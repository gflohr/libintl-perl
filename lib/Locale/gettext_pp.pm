#! /bin/false

# vim: tabstop=4
# $Id: gettext_pp.pm,v 1.6 2003/06/15 14:35:35 guido Exp $

# Pure Perl implementation of Uniforum message translation.
# Copyright (C) 2002-2003 Guido Flohr <guido@imperia.net>,
# all rights reserved.

# Distribution either under the terms of the Artistic license (see
# Artistic) or - at your choice - under the terms and conditions of
# the GNU General Public License described below.

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
# 02111-1307, USA.

# Copyright (C) 2002-2003, Guido Flohr <guido@imperia.net>
# All rights reserved.

package Locale::gettext_pp;

use strict;

require 5.004;

use vars qw ($__gettext_pp_default_dir 
			 $__gettext_pp_textdomain
			 $__gettext_pp_domain_bindings
			 $__gettext_pp_domain_codeset_bindings
			 $__gettext_pp_domains
			 $__gettext_pp_recoders
			 $__gettext_pp_domain_cache);

use locale;

BEGIN {
	$__gettext_pp_textdomain = 'messages';
	$__gettext_pp_domain_bindings = {};
	$__gettext_pp_domain_codeset_bindings = {};
	$__gettext_pp_domains = {};
	$__gettext_pp_recoders = {};
	$__gettext_pp_domain_cache = {};

	# Check whether we are on a GNU system.
	$__gettext_pp_default_dir = '/usr/share/locale';

	for my $dir (qw (/usr/share/locale /usr/local/share/locale)) {
		if (-d '/usr/share/locale') {
			$__gettext_pp_default_dir = $dir;
			last;
		}
	}
}

require POSIX;
require Exporter;
use IO::Handle;
require Locale::Recode;

use vars qw (%EXPORT_TAGS @EXPORT_OK @ISA $VERSION);

%EXPORT_TAGS = (locale_h => [ qw (
								  gettext
								  dgettext
								  dcgettext
								  ngettext
								  dngettext
								  dcngettext
								  textdomain
								  bindtextdomain
								  bind_textdomain_codeset
								  )
						  ],
				libintl_h => [ qw (LC_CTYPE
								   LC_NUMERIC
								   LC_TIME
								   LC_COLLATE
								   LC_MONETARY
								   LC_MESSAGES
								   LC_ALL)
								],
				);

@EXPORT_OK = qw (gettext
				 dgettext
				 dcgettext
				 ngettext
				 dngettext
				 dcngettext
				 textdomain
				 bindtextdomain
				 bind_textdomain_codeset
				 LC_CTYPE
				 LC_NUMERIC
				 LC_TIME
				 LC_COLLATE
				 LC_MONETARY
				 LC_MESSAGES
				 LC_ALL);
@ISA = qw (Exporter);

sub dcigettext__;
sub __load_catalog;
sub __guess_category_value;
sub __find_domain;

sub LC_NUMERIC()
{
	&POSIX::LC_NUMERIC;
}

sub LC_CTYPE()
{
	&POSIX::LC_CTYPE;
}

sub LC_TIME()
{
	&POSIX::LC_TIME;
}

sub LC_COLLATE()
{
	&POSIX::LC_COLLATE;
}

sub LC_MONETARY()
{
	&POSIX::LC_MONETARY;
}

sub LC_MESSAGES()
{
	local $!; # Do not clobber errno!

	my $retval = eval '&POSIX::LC_MESSAGES'
		if $POSIX::{LC_MESSAGES};
	return $retval if $retval;

	# Hack: POSIX.pm deems LC_MESSAGES an invalid macro.  However, on 
	# GNU systems, LC_MESSAGES should be 5 ...
	my $success = POSIX::setlocale (5, '');
	return 5 if $success;

	return 1729;
}

sub LC_ALL()
{
	&POSIX::LC_ALL;
}

sub textdomain(;$)
{
	my $new_domain = shift;

	$__gettext_pp_textdomain = $new_domain if defined $new_domain && 
		length $new_domain;

	return $__gettext_pp_textdomain;
}

sub bindtextdomain($;$)
{
	my ($domain, $directory) = @_;

	if (defined $domain && length $domain) {
		if (defined $directory && length $directory) {
			return $__gettext_pp_domain_bindings->{$domain} = $directory;
		} elsif (exists $__gettext_pp_domain_bindings->{$domain}) {
			return $__gettext_pp_domain_bindings->{$domain};
		} else {
			return $__gettext_pp_default_dir;
		}
	} else {
		return;
	}
}

sub bind_textdomain_codeset($;$)
{
	my ($domain, $codeset) = @_;

	if (defined $domain && length $domain) {
		if (defined $codeset && length $codeset) {
			return $__gettext_pp_domain_codeset_bindings->{$domain} = $codeset;
		} elsif (exists $__gettext_pp_domain_codeset_bindings->{$domain}) {
			return $__gettext_pp_domain_codeset_bindings->{$domain};
		}
	}

	return;
}

# FIXME: Do not jump unnecessarily through intermediate functions.  This
# is Perl not C.
sub gettext($)
{
	my ($msgid) = @_;

	return dcgettext ('', $msgid, LC_MESSAGES);
}

sub dgettext($$)
{
	my ($textdomain, $msgid) = @_;

	return dcgettext ($textdomain, $msgid, LC_MESSAGES);
}

sub dcgettext($$$)
{
	my ($textdomain, $msgid, $category) = @_;

	return dcigettext__ ($textdomain, $msgid, '', 0, 0, $category);
}

sub ngettext($$$)
{
	my ($msgid1, $msgid2, $n) = @_;

	return dcngettext ('', $msgid1, $msgid2, $n, LC_MESSAGES);
}

sub dngettext($$$$)
{
	my ($textdomain, $msgid1, $msgid2, $n) = @_;

	return dcngettext ($textdomain, $msgid1, $msgid2, $n, LC_MESSAGES);
}

sub dcngettext($$$$$)
{
	my ($textdomain, $msgid1, $msgid2, $n, $category) = @_;

	return dcigettext__ ($textdomain, $msgid1, $msgid2, 1, $n, $category);
}

sub dcigettext__
{
	my ($textdomain, $msgid1, $msgid2, $plural, $n, $category) = @_;

	return unless defined $msgid1;

	local $!; # Do not clobber errno!

	# This is also done in __find_domain but we need a proper value.
	$textdomain = textdomain unless defined $textdomain && length $textdomain;
	
	# Category is always LC_MESSAGES (other categories are ignored).
	my $category_name = 'LC_MESSAGES';
	$category = LC_MESSAGES;

	my $domains = __find_domain ($textdomain, $category, $category_name);

	my @trans = ();
	my $domain;
	my $found;
	foreach my $this_domain (@$domains) {
		if ($this_domain && defined $this_domain->{messages}->{$msgid1}) {
			@trans = @{$this_domain->{messages}->{$msgid1}};
			shift @trans;
			$domain = $this_domain;
			$found = 1;
			last;
		}
	}
	@trans = ($msgid1, $msgid2) unless @trans;

	my $trans = $trans[0];
	if ($plural) {
		if ($domain) {
			my $nplurals = 0;
			($nplurals, $plural) = &{$domain->{plural_func}} ($n);
			$plural = 0 unless defined $plural;
			$nplurals = 0 unless defined $nplurals;
			$plural = 0 if $nplurals <= $plural;
		} else {
			$plural = $n != 1 || 0;
		}

		$trans = $trans[$plural] if defined $trans[$plural];
	}

	if ($found && defined $domain->{po_header}->{charset}) {
		my $input_codeset = $domain->{po_header}->{charset};
		# Convert into output charset.
		my $output_codeset = bind_textdomain_codeset ($textdomain);
		$output_codeset = $ENV{OUTPUT_CHARSET} unless defined $output_codeset;
		
		unless (defined $output_codeset) {
			# Still no point.
			my $lc_ctype = __guess_category_value (POSIX::LC_CTYPE(), 
												   'LC_CTYPE');
			$output_codeset = $1
				if $lc_ctype =~ /^[a-z]{2}(?:_[A-Z]{2})?\.([^@]+)/;
		}

		$output_codeset = Locale::Recode->resolveAlias ($output_codeset) if
			defined $output_codeset;

		if (defined $output_codeset &&
			$output_codeset ne $domain->{po_header}->{charset}) {
			# We have to convert.
			my $recoder;

			if (exists 
				$__gettext_pp_recoders->{$input_codeset}->{$output_codeset}) {
				$recoder = $__gettext_pp_recoders->{$input_codeset}->{$output_codeset};
			} else {
				$recoder = 
					$__gettext_pp_recoders->{$input_codeset}->{$output_codeset} =
					Locale::Recode->new (from => $input_codeset,
										 to => $output_codeset,
										 unknown => 0x3f, # '?'
										 );
			}
			
			$recoder->recode ($trans);
		}
	}

	return $trans;
}

sub __find_domain
{
	my ($textdomain, $category, $category_name) = @_;

	$textdomain = textdomain ('') unless defined $textdomain && 
		length $textdomain;
	my $dir = bindtextdomain ($textdomain, '');
	$dir = $__gettext_pp_default_dir unless defined $dir && length $dir;

	my $locale = __guess_category_value ($category, $category_name);
	# Have we looked that one up already?
	my $domains = $__gettext_pp_domain_cache->{$dir}->{$locale}->{$category_name}->{$textdomain};

	if (defined $locale && length $locale && !defined $domains) {
		my @dirs = ($dir);
		my @tries = ($locale);

		if (defined $locale && length $locale &&
			$locale =~ /^([a-z][a-z])
			(?:(_[A-Z][A-Z])?
			 (\.[-_A-Za-z0-9]+)?
			 )?
			(\@[-_A-Za-z0-9]+)?$/x) {
			push @tries, $1 . $2 . $3 if defined $3;
			push @tries, $1 . $2 if defined $2;
			push @tries, $1 if defined $1;
		}

		push @dirs, $__gettext_pp_default_dir
			unless $dir eq $__gettext_pp_default_dir;

		foreach my $basedir (@dirs) {
			foreach my $try (@tries) {
				my $fulldir = "$basedir/$try/$category_name";

				my $domain = __load_catalog $fulldir, $textdomain;
				next unless $domain;
				
				unless (defined $domain->{po_header}->{charset} &&
						length $domain->{po_header}->{charset} &&
						$try =~ /^(?:[a-z][a-z])
						(?:(?:_[A-Z][A-Z])?
						 (\.[-_A-Za-z0-9]+)?
						 )?
						(?:\@[-_A-Za-z0-9]+)?$/x) {
					$domain->{po_header}->{charset} = $1;
				}
				
				if (defined $domain->{po_header}->{charset}) {
					$domain->{po_header}->{charset} = 
					    Locale::Recode->resolveAlias ($domain->{po_header}->{charset});
				}
				push @$domains, $domain;
			}
		}
		$__gettext_pp_domain_cache->{$dir}->{$locale}->{$category_name}->{$textdomain} = $domains;
	}

	$domains = [] unless defined $domains;

	return $domains;
}

sub __load_catalog
{
	my ($directory, $textdomain) = @_;

	my $filename = "$directory/$textdomain.mo";

	# Alternatively we could check the filename for evil characters ...
	# (Important for CGIs).
	return unless -f $filename && -r $filename;

	local $/;
	local *HANDLE;

	open HANDLE, "<$filename"
		or return;
	binmode HANDLE;
	my $raw = <HANDLE>;
	close HANDLE;

	# Corrupted?
	return unless defined $raw || length $raw < 28;

	my $filesize = length $raw;

	# Read the magic number in order to determine the byte order.
	my $domain = {};
	my $unpack = 'N';
	$domain->{magic} = unpack $unpack, substr $raw, 0, 4;

	if ($domain->{magic} == 0xde120495) {
		$unpack = 'V';
	} elsif ($domain->{magic} != 0x950412de) {
		return;
	}
	my $domain_unpack = $unpack x 6;

	my ($revision, $nstrings, $orig_tab_offset, $trans_tab_offset,
		$hash_tab_size, $hash_tab_offset) = 
			unpack (($unpack x 6), substr $raw, 4, 24);

	return unless $revision == 0; # Invalid revision number.

	$domain->{revision} = $revision;
	$domain->{nstrings} = $nstrings;
	$domain->{orig_tab_offset} = $orig_tab_offset;
	$domain->{trans_tab_offset} = $trans_tab_offset;
	$domain->{hash_tab_size} = $hash_tab_size;
	$domain->{hash_tab_offset} = $hash_tab_offset;

	return if $orig_tab_offset + 4 * $nstrings > $filesize;
	return if $trans_tab_offset + 4 * $nstrings > $filesize;

	my @orig_tab = unpack (($unpack x (2 * $nstrings)), 
						   substr $raw, $orig_tab_offset, 8 * $nstrings);
	my @trans_tab = unpack (($unpack x (2 * $nstrings)), 
							substr $raw, $trans_tab_offset, 8 * $nstrings);

	my $messages = {};

	for (my $count = 0; $count < 2 * $nstrings; $count += 2) {
		my $orig_length = $orig_tab[$count];
		my $orig_offset = $orig_tab[$count + 1];
		my $trans_length = $trans_tab[$count];
		my $trans_offset = $trans_tab[$count + 1];

		return if $orig_offset + $orig_length > $filesize;
		return if $trans_offset + $trans_length > $filesize;

		my @origs = split /\000/, substr $raw, $orig_offset, $orig_length;
		my @trans = split /\000/, substr $raw, $trans_offset, $trans_length;

		# The singular is the key, the plural plus all translations is the
		# value.
		my $msgid = $origs[0];
		$msgid = '' unless defined $msgid && length $msgid;
		my $msgstr = [ $origs[1], @trans ];
		$messages->{$msgid} = $msgstr;
	}

	$domain->{messages} = $messages;

	# Try to find po header information.
	my $po_header = {};
	my $null_entry = $messages->{''}->[1];
	if ($null_entry) {
		my @lines = split /\n/, $null_entry;
		foreach my $line (@lines) {
			my ($key, $value) = split /:/, $line, 2;
			$key =~ s/-/_/g;
			$po_header->{lc $key} = $value;
		}
	}
	$domain->{po_header} = $po_header;

	if (exists $domain->{po_header}->{content_type}) {
		my $content_type = $domain->{po_header}->{content_type};
		if ($content_type =~ s/.*=//) {
			$domain->{po_header}->{charset} = $content_type;
		}
	}
	$domain->{po_header}->{plural_forms} = '' unless
		$domain->{po_header}->{plural_forms};

	# Determine plural rules.
	# The leading and trailing space is necessary to be able to match
	# against word boundaries.
	my $plural_func;

	if ($domain->{po_header}->{plural_forms}) {
		my $code = ' ' . $domain->{po_header}->{plural_forms} . ' ';
		$code =~ s/(\W)([_A-Za-z][_A-Za-z0-9]*)(\W)/$1\$$2$3/g;
		$code =~ s/\`\s//g;
		
		$code = "sub { my \$n = shift; 
                   my (\$plural, \$nplurals); 
                   $code; 
                   return (\$nplurals, \$plural ? \$plural : 0); }";
		
		# Now try to evaluate the code.  There is no need to run the code in
		# a Safe compartment.  The above substitutions should have destroyed
		# all evil code.  Corrections are welcome!
		$plural_func = eval $code;
		undef $plural_func if $@;
	}

	# Default is Germanic plural (which is incorrect for French).
	$plural_func = eval "sub { (2, 1 != shift || 0) }" unless $plural_func;

	$domain->{plural_func} = $plural_func;

	return $domain;
}

sub __guess_category_value
{
	my ($category, $category_name) = @_;

	my $language = $ENV{LANGUAGE};
	
	my $value = eval "POSIX::setlocale ($category)";

	# We support only XPG syntax, i. e.
	# language[_territory[.codeset]][@modifier].
	undef $value unless (defined $value && 
						 length $value &&
						 $value =~ /^[a-z][a-z]
						 (?:_[A-Z][A-Z]
						  (?:\.[-_A-Za-z0-9]+)?
						  )?
						 (?:\@[-_A-Za-z0-9]+)?$/x);

	unless ($value) {
		$value = $ENV{LC_ALL};
		$value = $ENV{$category_name} unless defined $value && length $value;
		$value = $ENV{LANG} unless defined $value && length $value;
		return 'C' unless defined $value && length $value;
	}

	return defined $language && length $language &&
		$value ne 'C' && $value ne 'POSIX' ? $language : $value;
}

1;

__END__

Local Variables:
mode: perl
perl-indent-level: 4
perl-continued-statement-offset: 4
perl-continued-brace-offset: 0
perl-brace-offset: -4
perl-brace-imaginary-offset: 0
perl-label-offset: -4
cperl-indent-level: 4
cperl-continued-statement-offset: 2
tab-width: 4
End:

=head1 NAME

Locale::gettext_pp - Pure Perl implementation of Uniforum Message Translation

=head1 SYNOPSIS

 use gettext_pp (:locale_h :libintl_h);

 gettext $msgid;
 dgettext $textdomain, $msgid;
 dcgettext $textdomain, $msgid, LC_MESSAGES;
 ngettext $msgid, $msgid_plural, $count;
 dngettext $textdomain, $msgid, $msgid_plural, $count;
 dcngettext $textdomain, $msgid, $msgid_plural, $count, LC_MESSAGES;
 textdomain $textdomain;
 bindtextdomain $textdomain, $directory;
 bind_textdomain_codeset $textdomain, $encoding;
 my $category = LC_CTYPE;
 my $category = LC_NUMERIC;
 my $category = LC_TIME;
 my $category = LC_COLLATE;
 my $category = LC_MONETARY;
 my $category = LC_MESSAGES;
 my $category = LC_ALL;

=head1 DESCRIPTION

The module B<Locale::gettext_pp> is the low-level interface to 
message translation according to the Uniforum approach that is
for example used in GNU gettext and Sun's Solaris.

Normally you should not use this module directly, but the high
level interface Locale::TextDomain(3) that provides a much simpler
interface.  This description is therefore deliberately kept
brief.  FIXME: Point to GNU gettext online docs!

=head1 FUNCTIONS

The module exports by default nothing.  Every function has to be
imported explicitely or via an export tag (L</"EXPORT TAGS">).

=over 4

=item B<gettext MSGID>

Returns the translation for B<MSGID>.  Example:

    print gettext "Hello World!\n";

If no translation can be found, the unmodified B<MSGID> is returned,
i. e. the function can I<never> fail, and will I<never> mess up your
original message.

One common mistake is this:

    print gettext "Hello $name!";

Perl will interpolate the variable C<$name> I<before> the function
will see the string.  Unless the corresponding message catalog 
contains a message "Hello Tom!", "Hello Dick!" or "Hello Harry!",
no translation will be found.

Using printf() is only an option here, if you have not more than
one conversion specification like C<%d> or C<%s>.  A somewhat stupid
example:

    print sprintf (gettext ("This is the %s %s."), $color, $thing);

(The example is stupid because neither color nor thing will get
translated here ...).

In English the adjective (the color) will precede the noun, many
other languages (for example French or Italian) differ here.  The 
translator of the message may therefore have a hard time to find
a translation that will still work and not sound stupid in the 
target language.  Many C implementations of printf() allow to 
change the order of the arguments, and a French translator could
then say:

    "C'est le %$2s %$1s."

Perl printf() does not implement this feature.

See the description of the function C<__x()> in Locale::TextDomain(3)
for a much better way to get around this problem.

Note for Perl 5.8 and later: The returned string will I<always> have
the UTF-8 flag off if the message has been touched, i. e. if it has
been translated and if it has been converted to another charset.  It
will be left untouched in all other cases.

=item B<dgettext TEXTDOMAIN, MSGID>

Like gettext(), but retrieves the message for the specified 
B<TEXTDOMAIN> instead of the default domain.  In case you wonder what
a textdomain is, you should really read on with Locale::TextDomain(3).

=item B<dcgettext TEXTDOMAIN, MSGID, CATEGORY>

Like dgettext() but retrieves the message from the specified B<CATEGORY>
instead of the default category C<LC_MESSAGES>.

=item B<ngettext MSGID, MSGID_PLURAL, COUNT>

Retrieves the correct translation for B<COUNT> items.  In legacy software
you will often find something like:

    print "$count file(s) deleted.\n";

or

    printf "$count file%s deleted.\n", $count == 1 ? '' : 's';

The first example looks awkward, the second will only work in English
and languages with similar plural rules.  Before ngettext() was introduced,
the best practice for internationalized programs was:

    if ($count == 1) {
        print gettext "One file deleted.\n";
    } else {
        printf gettext "%d files deleted.\n";
    }

This is a nuisance for the programmer and often still not sufficient
for an adequate translation.  Many languages have completely different
ideas on numerals.  Some (French, Italian, ...) treat 0 and 1 alike,
other make no distinction at all (Japanese, Korean, Chinese, ...),
others have two or more plural forms (Russian, Latvian, Czech,
Polish, ...).  The solution is:

    printf (ngettext ("One file deleted.\n",
                     "%d files deleted.\n",
                     $count), # argument to ngettext!
            $count);          # argument to printf!

In English, or if no translation can be found, the first argument
(B<MSGID>) is picked if C<$count> is one, the second one otherwise.
For other languages, the correct plural form (of 1, 2, 3, 4, ...)
is automatically picked, too.  You don't have to know anything about
the plural rules in the target language, ngettext() will take care
of that.

This is most of the time sufficient but you will have to prove your
creativity in cases like

    printf "%d file(s) deleted, and %d file(s) created.\n";

=item B<dngettext TEXTDOMAIN, MSGID, MSGID_PLURAL, COUNT>

Like ngettext() but retrieves the translation from the specified
textdomain instead of the default domain.

=item B<dcngettext TEXTDOMAIN, MSGID, MSGID_PLURAL, COUNT, CATEGORY>

Like dngettext() but retrieves the translation from the specified
category, instead of the default category C<LC_MESSAGES>.

=item B<textdomain TEXTDOMAIN>

Sets the default textdomain (initially 'messages').

=item B<bindtextdomain TEXTDOMAIN, DIRECTORY>

Binds B<TEXTDOMAIN> to B<DIRECTORY>.  Huh? An example:

    bindtextdomain "my-package", "./mylocale";

Say, the selected locale (actually the selected locale for category
C<LC_MESSAGES>) of the program is 'fr_CH', then the message catalog
will be expected in F<./mylocale/fr_CH/LC_MESSAGES/my-package.mo>.

=item B<bind_textdomain_codeset TEXTDOMAIN, ENCODING>

Sets the output encoding for B<TEXTDOMAIN> to B<ENCODING>.  

=back

=head1 CONSTANTS

You can (maybe) get the same constants from POSIX(3); see there for
a detailed description

=over 4

=item B<LC_CTYPE>

=item B<LC_NUMERIC>

=item B<LC_TIME>

=item B<LC_COLLATE>

=item B<LC_MONETARY>
								   
=item B<LC_MESSAGES>

This locale category was the reason that these constants from POSIX(3)
were included here.  Even if it was present in your systems C include
file F<locale.h>, it was not provided by POSIX(3).  Perl 5.8 and later
seems to export the constant if available, although it is not documented
in POSIX(3).

gettext_pp(3) makes an attempt to guess the value of this category for
all systems, and assumes the arbitrary value 1729 otherwise.

=item B<LC_ALL>

If you specify the category B<LC_ALL> as the first argument to
POSIX::setlocale(), I<all> locale categories will be accected at once.

=back

=head1 EXPORT_TAGS

This module does not export anything unless explicitely requested.
You can import groups of functions via two tags:

=over 4

=item B<use Locale::gettext_pp (':locale_h')>

Imports the functions that are normally defined in the C include
file F<locale.h>:

=over 8

=item B<gettext()>

=item B<dgettext()>

=item B<dcgettext()>

=item B<ngettext()>

=item B<dngettext()>

=item B<dcngettext()>

=item B<textdomain()>

=item B<bindtextdomain()>

=item B<bind_textdomain_codeset()>

=back

=item B<use Locale::gettext_pp (':libintl_h')>

Imports the locale category constants:

=over 8

=item B<LC_CTYPE>

=item B<LC_NUMERIC>

=item B<LC_TIME>

=item B<LC_COLLATE>

=item B<LC_MONETARY>

=item B<LC_MESSAGES>

=item B<LC_ALL>

=back

=back

=head1 USAGE

A complete example:

    1: use Locale::gettext_pp qw (:locale_h :libintl_h);
    2: use POSIX qw (setlocale);
    3: setlocale (LC_MESSAGES, '');
    4: textdomain ('my-package');
    5: bindtextdomain ('my-package' => '/usr/local/share/locale');
    6:
    7: print gettext ("Hello world!\n");

Step by step: Line 1 imports the necessary functions and constants.
In line 3 we set the locale for category LC_MESSAGES to the default
user settings.  For C programs you will often read that LC_ALL
is the best category here but this will also change the locale for
LC_NUMERIC and many programs will not work reliably after changing
that category in Perl; choose your own poison!

In line 4 we say that all messages (translations) without an explicit
domain specification should be retrieved from the message catalog
for the domain 'my-package'.  Line 5 has the effect that the message
catalog will be searched under the directory F</usr/local/share/locale>.

If the user has selected the locale 'fr_CH', and if the file 
F</usr/local/share/locale/fr_CH/LC_MESSAGES/my-package.mo>
exists, and if it contains a GNU message object file with a translation
for the string "Hello world!\n", then line 7 will print the French
translation (for Switzerland CH) to STDOUT.

The documentation for GNU gettext explains how to extract translatable
strings from your Perl files and how to create message catalogs.

Another less portable example: If your system uses the GNU libc you
should be able to find various files with the name F<libc.mo>, the
message catalog for the library itself.  If you have found these
files under F</usr/share/locale>, then you can try the following:

    use Locale::gettext_pp qw (:locale_h :libintl_h);
    use POSIX qw (setlocale);

    setlocale LC_MESSAGES, "";
    textdomain "libc";

    # The following is actually not needed, since this is
    # one of the default search directories.
    bindtextdomain libc => '/usr/share/locale';
    bind_textdomain_codeset libc => 'iso-8859-1';

    print gettext ("No such file or directory");

See Locale::TextDomain(3) for much simpler ways.

=head1 AUTHOR

Copyright (C) 2002-2003, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(http://www.imperia.net/).

=head1 SEE ALSO

Locale::TextDomain(3pm), Locale::Messages(3pm), Encode(3pm),
perllocale(3pm), POSIX(3pm), perl(1), gettext(1), gettext(3)
