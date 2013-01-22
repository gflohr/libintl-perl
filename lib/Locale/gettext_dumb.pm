#! /bin/false

# vim: set autoindent shiftwidth=4 tabstop=4:

# Pure Perl implementation of Uniforum message translation.
# Copyright (C) 2002-2013 Guido Flohr <guido@imperia.net>,
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

package Locale::gettext_dumb;

use Locale::gettext_pp;

use vars qw (%EXPORT_TAGS @EXPORT_OK @ISA $VERSION);

%EXPORT_TAGS = (locale_h => [ qw (gettext
                                  dgettext
                                  dcgettext
                                  ngettext
                                  dngettext
                                  dcngettext
                                  pgettext
                                  dpgettext
                                  dcpgettext
                                  npgettext
                                  dnpgettext
                                  dcnpgettext
                                  textdomain
                                  bindtextdomain
                                  bind_textdomain_codeset
                                  )],
                libintl_h => [ qw (LC_CTYPE
                                   LC_NUMERIC
                                   LC_TIME
                                   LC_COLLATE
                                   LC_MONETARY
                                   LC_MESSAGES
                                   LC_ALL)],
                );

@EXPORT_OK = qw (gettext
                 dgettext
                 dcgettext
                 ngettext
                 dngettext
                 dcngettext
                 pgettext
                 dpgettext
                 dcpgettext
                 npgettext
                 dnpgettext
                 dcnpgettext
                 textdomain
                 bindtextdomain
                 bind_textdomain_codeset
                 nl_putenv
                 LC_CTYPE
                 LC_NUMERIC
                 LC_TIME
                 LC_COLLATE
                 LC_MONETARY
                 LC_MESSAGES
                 LC_ALL);
                 
@ISA = qw (Exporter);

*Locale::gettext_dumb::textdomain = \&Locale::gettext_pp::textdomain;
*Locale::gettext_dumb::bindtextdomain = \&Locale::gettext_pp::bindtextdomain;
*Locale::gettext_dumb::bind_textdomain_codeset = 
    \&Locale::gettext_pp::bind_textdomain_codeset;

*Locale::gettext_dumb::nl_putenv = \&Locale::gettext_pp::nl_putenv;

*Locale::gettext_dumb::LC_CTYPE = \&Locale::gettext_pp::LC_CTYPE;
*Locale::gettext_dumb::LC_NUMERIC = \&Locale::gettext_pp::LC_NUMERIC;
*Locale::gettext_dumb::LC_TIME= \&Locale::gettext_pp::LC_TIME;
*Locale::gettext_dumb::LC_COLLATE = \&Locale::gettext_pp::LC_COLLATE;
*Locale::gettext_dumb::LC_MONETARY = \&Locale::gettext_pp::LC_MONETARY;
*Locale::gettext_dumb::LC_MESSAGES = \&Locale::gettext_pp::LC_MESSAGES;
*Locale::gettext_dumb::LC_ALL = \&Locale::gettext_pp::LC_ALL;


sub gettext ($) {
    my ($msgid) = @_;

    return dcnpgettext ('', undef, $msgid, undef, undef, undef);
}

sub dgettext ($$) {
    my ($domainname, $msgid) = @_;

    return dcnpgettext ($domainname, undef, $msgid, undef, undef, undef);
}

sub dcgettext ($$$) {
    my ($domainname, $msgid, $category) = @_;

    return dcnpgettext ($domainname, undef, $msgid, undef, undef, undef);
}

sub ngettext ($$$) {
    my ($msgid, $msgid_plural, $n) = @_;

    return dcnpgettext ('', undef, $msgid, $msgid_plural, $n, undef);
}

sub dngettext ($$$$) {
    my ($domainname, $msgid, $msgid_plural, $n) = @_;

    return dcnpgettext ($domainname, undef, $msgid, $msgid_plural, $n, undef);
}

sub dcngettext ($$$$$) {
    my ($domainname, $msgid, $msgid_plural, $n, $category) = @_;

    return dcnpgettext ($domainname, undef, $msgid, $msgid_plural, $n, , 
                        $category);
}

sub pgettext ($$) {
    my ($msgctxt, $msgid) = @_;

    return dcnpgettext ('', $msgctxt, $msgid, undef, undef, undef);
}

sub dpgettext ($$$) {
    my ($domainname, $msgctxt, $msgid) = @_;

    return dcnpgettext ($domainname, $msgctxt, $msgid, undef, undef, undef);
}

sub dcpgettext($$$$) {
    my ($domainname, $msgctxt, $msgid, $category) = @_;

    return dcnpgettext ($domainname, $msgctxt, $msgid, undef, undef, undef);
}

sub npgettext ($$$$) {
    my ($msgctxt, $msgid, $msgid_plural, $n) = @_;

    return dcnpgettext ('', $msgctxt, $msgid, $msgid_plural, $n, undef);
}

sub dnpgettext ($$$$$) {
    my ($domainname, $msgctxt, $msgid, $msgid_plural, $n) = @_;

    return dcnpgettext ($domainname, $msgctxt, $msgid, $msgid_plural, $n, undef);
}

sub dcnpgettext ($$$$$$) {
    my ($domainname, $msgctxt, $msgid, $msgid_plural, $n, $category) = @_;

    my $msgpath;
    my $locale;

    if (exists $ENV{MSGPATH} && length $ENV{MSGPATH}) {
        my $path_sep;
        if ($^O !~ /darwin/i && $^O =~ /win/i) {
            $path_sep = ';';
        } else {
            $path_sep = ':';
        }
        $locale = 'C';
        $msgpath = [split /$path_sep/, $ENV{MSGPATH}];
    } else {
        if (exists $ENV{LANGUAGE} && length $ENV{LANGUAGE}) {
            $locale = $ENV{LANGUAGE};
            $locale =~ s/:.*//s;
        } elsif (exists $ENV{LC_ALL} && length $ENV{LC_ALL}) {
            $locale = $ENV{LC_ALL};
        } elsif (exists $ENV{LANG} && length $ENV{LANG}) {
            $locale = $ENV{LANG};
        } elsif (exists $ENV{LC_MESSAGES} && length $ENV{LC_MESSAGES}) {
            $locale = $ENV{LC_MESSAGES};
        } else {
            $locale = 'C';
        }
    }
    
    return Locale::gettext_pp::_dcnpgettext_impl ($domainname, $msgctxt,
                                                  $msgid, $msgid_plural, $n,
                                                  $category,
                                                  $locale, $msgpath);
}



1;

__END__

=head1 NAME

Locale::gettext_dumb - Locale unaware Implementation of Uniforum Message Translation

=head1 SYNOPSIS

 use Locale::gettext_dumb (:locale_h :libintl_h);

 # Normally, you will not want to include this module directly but this way:
 use Locale::Messages;
 
 my $selected = Locale::Messages->select_package ('gettext_dumb');

 gettext $msgid;
 dgettext $domainname, $msgid;
 dcgettext $domainname, $msgid, LC_MESSAGES;
 ngettext $msgid, $msgid_plural, $count;
 dngettext $domainname, $msgid, $msgid_plural, $count;
 dcngettext $domainname, $msgid, $msgid_plural, $count, LC_MESSAGES;
 pgettext $msgctxt, $msgid;
 dpgettext $domainname, $msgctxt, $msgid;
 dcpgettext $domainname, $msgctxt, $msgid, LC_MESSAGES;
 npgettext $msgctxt, $msgid, $msgid_plural, $count;
 dnpgettext $domainname, $msgctxt, $msgid, $msgid_plural, $count;
 dcnpgettext $domainname, $msgctxt, $msgid, $msgid_plural, $count, LC_MESSAGES;
 textdomain $domainname;
 bindtextdomain $domainname, $directory;
 bind_textdomain_codeset $domainname, $encoding;
 my $category = LC_CTYPE;
 my $category = LC_NUMERIC;
 my $category = LC_TIME;
 my $category = LC_COLLATE;
 my $category = LC_MONETARY;
 my $category = LC_MESSAGES;
 my $category = LC_ALL;

=head1 DESCRIPTION

B<IMPORTANT!> This module is experimental.  It may not work as described!

The module B<Locale::gettext_dumb> does exactly the same as 
Locale::gettext_xs(3pm) or Locale::gettext_pp(3pm).

While both other modules use POSIX::setlocale() to determine the currently
selected locale, this backend only checks the environment variables
MESSAGE_CATALOGS, LANGUAGE, LANG, LC_ALL, LC_MESSAGES (in that order)
in order to locate a message catalog (a .mo file).

The main advantage over the locale-aware message retrieval backends is
(maybe) better performance, thread-safety, and independence of the
locale data installed on the system.

The disadvantage is that you can face serious problems if you try to mix
the output of this package with output generated by operating system
facilities.

This class was introduced in libintl-perl 1.22.

=head1 AUTHOR

Copyright (C) 2002-2013, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(L<http://www.imperia.net/>).
use vars qw (%EXPORT_TAGS @EXPORT_OK @ISA $VERSION);

%EXPORT_TAGS = (locale_h => [ qw (
                                                                  gettext
                                                                  dgettext
                                                                  dcgettext
                                                                  ngettext
                                                                  dngettext
                                                                  dcngettext
                                                                  pgettext
                                                                  dpgettext
                                                                  dcpgettext
                                                                  npgettext
                                                                  dnpgettext
                                                                  dcnpgettext
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
                                 pgettext
                                 dpgettext
                                 dcpgettext
                                 npgettext
                                 dnpgettext
                                 dcnpgettext
                                 textdomain
                                 bindtextdomain
                                 bind_textdomain_codeset
                 nl_putenv
                                 LC_CTYPE
                                 LC_NUMERIC
                                 LC_TIME
                                 LC_COLLATE
                                 LC_MONETARY
                                 LC_MESSAGES
                                 LC_ALL);
@ISA = qw (Exporter);

=head1 SEE ALSO

Locale::TextDomain(3pm), Locale::Messages(3pm), Encode(3pm),
perllocale(3pm), POSIX(3pm), perl(1), gettext(1), gettext(3)

=cut

Local Variables:
mode: perl
perl-indent-level: 4
perl-continued-statement-offset: 4
perl-continued-brace-offset: 0
perl-brace-offset: -4
perl-brace-imaginary-offset: 0
perl-label-offset: -4
tab-width: 4
End:

=cut
