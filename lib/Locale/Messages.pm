#! /bin/false

# vim: tabstop=4
# $Id: Messages.pm,v 1.14 2003/09/15 08:21:46 guido Exp $

# Conversion routines for ATARI-ST.
# Copyright (C) 2002-2003 Guido Flohr <guido@imperia.net>,
# all rights reserved.

# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU Library General Public License as published
# by the Free Software Foundation; either version 2, or (at your option)
# any later version.
                                                                                
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Library General Public License for more details.
                                                                                
# You should have received a copy of the GNU Library General Public 
# License along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, 
# USA.

package Locale::Messages;

use strict;

use vars qw ($package @EXPORT_OK %EXPORT_TAGS @ISA $VERSION);

# Try to load the C version first.
$package = 'gettext_xs';
eval "require Locale::gettext_xs";
if ($@) {
    $package = 'gettext_pp';
    require Locale::gettext_pp;
}

require Exporter;
@ISA = qw (Exporter);
%EXPORT_TAGS = ( locale_h => [ qw (gettext
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

@EXPORT_OK = qw (select_package
		 gettext
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

BEGIN {
	my ($has_encode, $has_bytes);
	
	if ($] >= 5.006) {
		unless (defined $has_encode) {
			eval "require Encode";
			$has_encode = !$@;
		}

		unless ($has_encode || defined $has_bytes) {
			eval "use bytes";
			$has_bytes = !$@;
		}
	}

	# Turn the UTF-8 flag off unconditionally.
	if ($has_encode) {
		eval <<'EOF';
sub _turn_utf_8_off($)
{
	Encode::_utf8_off ($_[0]);
	return $_[0];
}
EOF
	} elsif ($has_bytes) {
		eval <<'EOF';
sub _turn_utf_8_off($)
{
	use bytes;
	$_[0] = join "", split //, $_[0];
}
EOF
	} else {
		eval <<'EOF';
sub _turn_utf_8_off($)
{
	return $_[0];
}
EOF
	}
}

sub select_package
{
	my ($class, $pkg) = @_;

	if (defined $pkg && 'gettext_pp' eq $pkg) {
		require Locale::gettext_pp;
		$package = 'gettext_pp';
	} else {
		eval "require Locale::gettext_xs";
		$package = 'gettext_xs' unless $@;
	}

    return $package;
}

sub textdomain(;$)
{
    'gettext_xs' eq $package ?
	&Locale::gettext_xs::textdomain :
	&Locale::gettext_pp::textdomain;
}

sub bindtextdomain($;$)
{
    'gettext_xs' eq $package ?
	&Locale::gettext_xs::bindtextdomain :
	&Locale::gettext_pp::bindtextdomain;
}

sub bind_textdomain_codeset($;$)
{
    'gettext_xs' eq $package ?
	&Locale::gettext_xs::bind_textdomain_codeset :
	&Locale::gettext_pp::bind_textdomain_codeset;
}

sub gettext($)
{
    _turn_utf_8_off ('gettext_xs' eq $package ?
		     &Locale::gettext_xs::gettext :
		     &Locale::gettext_pp::gettext);
}

sub dgettext($$)
{
    _turn_utf_8_off ('gettext_xs' eq $package ?
		     &Locale::gettext_xs::dgettext :
		     &Locale::gettext_pp::dgettext);
}

sub dcgettext($$$)
{
    _turn_utf_8_off ('gettext_xs' eq $package ?
		     &Locale::gettext_xs::dcgettext :
		     &Locale::gettext_pp::dcgettext);
}

sub ngettext($$$)
{
    _turn_utf_8_off ('gettext_xs' eq $package ?
		     &Locale::gettext_xs::ngettext :
		     &Locale::gettext_pp::ngettext);
}

sub dngettext($$$$)
{
    _turn_utf_8_off ('gettext_xs' eq $package ?
		     &Locale::gettext_xs::dngettext :
		     &Locale::gettext_pp::dngettext);
}

sub dcngettext($$$$$)
{
    _turn_utf_8_off ('gettext_xs' eq $package ?
		     &Locale::gettext_xs::dcngettext :
		     &Locale::gettext_pp::dcngettext);
}

sub LC_NUMERIC
{
    'gettext_xs' eq $package ?
	&Locale::gettext_xs::LC_NUMERIC :
	&Locale::gettext_pp::LC_NUMERIC;
}

sub LC_CTYPE
{
    'gettext_xs' eq $package ?
	&Locale::gettext_xs::LC_CTYPE :
	&Locale::gettext_pp::LC_CTYPE;
}

sub LC_TIME
{
    'gettext_xs' eq $package ?
	&Locale::gettext_xs::LC_TIME :
	&Locale::gettext_pp::LC_TIME;
}

sub LC_COLLATE
{
    'gettext_xs' eq $package ?
	&Locale::gettext_xs::LC_COLLATE :
	&Locale::gettext_pp::LC_COLLATE;
}

sub LC_MONETARY
{
    'gettext_xs' eq $package ?
	&Locale::gettext_xs::LC_MONETARY :
	&Locale::gettext_pp::LC_MONETARY;
}

sub LC_MESSAGES
{
    'gettext_xs' eq $package ?
	&Locale::gettext_xs::LC_MESSAGES :
	&Locale::gettext_pp::LC_MESSAGES;
}

sub LC_ALL
{
    'gettext_xs' eq $package ?
	&Locale::gettext_xs::LC_ALL :
	&Locale::gettext_pp::LC_ALL;
}

1;

__END__

=head1 NAME

Locale::Messages - Gettext Like Message Retrieval

=head1 SYNOPSIS

 use Locale::Messages (:locale_h :libintl_h);

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

The module B<Locale::Messages> is a wrapper around the interface to
message translation according to the Uniforum approach that is
for example used in GNU gettext and Sun's Solaris.  It is intended
to allow Locale::Messages(3) to switch between different implementations
of the lower level libraries but this is not yet implemented.

Normally you should not use this module directly, but the high
level interface Locale::TextDomain(3) that provides a much simpler
interface.  This description is therefore deliberately kept
brief.  Please refer to the GNU gettext documentation available at
L<http://www.gnu.org/manual/gettext/> for in-depth and background 
information on the topic.

The lower level module Locale::gettext_pp(3) provides the Perl
implementation of gettext() and related functions.

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

Note for Perl 5.8 and later: The returned string will I<always> have
the UTF-8 flag off if the message has been touched, i. e. if it has
been translated and if it has been converted to another charset.  It
will be left untouched in all other cases.

One common mistake is this:

    print gettext "Hello $name!";

Perl will interpolate the variable C<$name> I<before> the function
will see the string.  Unless the corresponding message catalog 
contains a message "Hello Tom!", "Hello Dick!" or "Hello Harry!",
no translation will be found.

Using printf() and friends has its own problems:

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

Perl printf() implements this feature as of version 5.8 or better.
Consequently you can only use it, if you are sure that your software
will run with Perl 5.8 or a later version.

Another disadvantage of using printf() is its cryptic syntax (maybe
not for you but translators of your software may have their own
opinion).

See the description of the function C<__x()> in Locale::TextDomain(3)
for a much better way to get around this problem.

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
others make no distinction at all (Japanese, Korean, Chinese, ...),
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

=item B<select_package PACKAGE>

By default, B<Locale::Messages> will try to load the XS version of
the gettext implementation, i. e. Locale::gettext_xs(3) and will fall
back to the pure Perl implementation Locale::gettext_pp(3).  You can
override this behavior by passing the string "gettext_pp" or
"gettext_xs" to the function select_package().  Passing "gettext_pp"
here, will prefer the pure Perl implementation.

You will normally want to use that in a BEGIN block of your main
script.

The function was introduced with libintl-perl version 1.03.

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

Locale::Messages(3) makes an attempt to guess the value of this category for
all systems, and assumes the arbitrary value 1729 otherwise.

=item B<LC_ALL>

If you specify the category B<LC_ALL> as the first argument to
POSIX::setlocale(), I<all> locale categories will be affected at once.

=back

=head1 EXPORT TAGS

The module does not export anything unless explicitely requested.
You can import groups of functions via two tags:

=over 4

=item B<use Locale::Messages (':locale_h')>

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

=item B<use Locale::Messages (':libintl_h')>

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

=head1 OTHER EXPORTS

=item B<select_package PACKAGE>

=head1 USAGE

A complete example:

    1: use Locale::Messages qw (:locale_h :libintl_h);
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

    use Locale::Messages qw (:locale_h :libintl_h);
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
(L<http://www.imperia.net/>).

=head1 SEE ALSO

Locale::TextDomain(3pm), Locale::gettext_pp(3pm), Encode(3pm),
perllocale(3pm), POSIX(3pm), perl(1), gettext(1), gettext(3)

=cut

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
