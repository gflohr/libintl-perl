#! /bin/false
# Copyright (C) 2002, Guido Flohr <guido@imperia.net>
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

%EXPORT_TAGS = ( locale_h => [ qw (
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
$VERSION = '0.01';

sub dcigettext__;
sub __load_catalog;
sub __guess_category_value;
sub __find_domain;

sub LC_NUMERIC
{
	&POSIX::LC_NUMERIC;
}

sub LC_CTYPE
{
	&POSIX::LC_CTYPE;
}

sub LC_TIME
{
	&POSIX::LC_TIME;
}

sub LC_COLLATE
{
	&POSIX::LC_COLLATE;
}

sub LC_MONETARY
{
	&POSIX::LC_MONETARY;
}

sub LC_MESSAGES
{
	local $!; # Do not clobber errno!

	my $retval = eval '&POSIX::LC_MESSAGES';
	return $retval if $retval;

	# Hack: POSIX.pm deems LC_MESSAGES an invalid macro.  However, on 
	# GNU systems, LC_MESSAGES should be 5 ...
	my $success = POSIX::setlocale (5, '');
	return 5 if $success;

	return 1729;
}

sub LC_ALL
{
	&POSIX::LC_ALL;
}

sub textdomain
{
	my $new_domain = shift;

	$__gettext_pp_textdomain = $new_domain if defined $new_domain && 
		length $new_domain;

	return $__gettext_pp_textdomain;
}

sub bindtextdomain
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

sub bind_textdomain_codeset
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
sub gettext
{
	my ($msgid) = @_;

	return dcgettext ('', $msgid, LC_MESSAGES);
}

sub dgettext
{
	my ($textdomain, $msgid) = @_;

	return dcgettext ($textdomain, $msgid, LC_MESSAGES);
}

sub dcgettext
{
	my ($textdomain, $msgid, $category) = @_;

	return dcigettext__ ($textdomain, $msgid, '', 0, 0, $category);
}

sub ngettext
{
	my ($msgid1, $msgid2, $n) = @_;

	return dcngettext ('', $msgid1, $msgid2, $n, LC_MESSAGES);
}

sub dngettext
{
	my ($textdomain, $msgid1, $msgid2, $n) = @_;

	return dcngettext ($textdomain, $msgid1, $msgid2, $n, LC_MESSAGES);
}

sub dcngettext
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
		my $msgid = $origs[0] || '';
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
