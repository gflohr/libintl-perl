#! /bin/false

# vim: set autoindent shiftwidth=4 tabstop=4:

# Copyright (C) 2002-2017 Guido Flohr <guido.flohr@cantanea.com>,
# all rights reserved.

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

package Locale::Messages::Debug;

use strict;

use Locale::Messages;
use Locale::gettext_pp;
use Locale::gettext_dumb;

use vars qw(@EXPORT_OK @ISA);

require Exporter;
@ISA = qw(Exporter);

@EXPORT_OK = qw(debug_gettext);

sub debug_gettext($) {
    my ($msgid) = @_;

    my @hints;

    my $package = $Locale::Messages::package;
    push @hints, "Package is '$package'.";

    my $domainname = Locale::Messages::textdomain();
    push @hints, "Textdomain is '$domainname', (use textdomain() to change this).";

    my $dir = Locale::Messages::bindtextdomain($domainname, '');
    unless (defined $dir && length $dir) {
        $dir = $Locale::gettext_pp::__gettext_pp_default_dir;
    }
    push @hints, "Textdomain is bound to '$dir', (use bindtextdomain() to change this).";

    my $lc_messages = Locale::Messages::LC_MESSAGES();
    if (1729 == $lc_messages) {
        push @hints, "System does not define 'LC_MESSAGES'";
    } else {
        push @hints, "System defines 'LC_MESSAGES'";
    }

    my $locale;
    if ('gettext_dumb' eq $package) {
        push @hints, "Package gettext_dumb selects locale by environment only:";
        $locale = Locale::gettext_dumb::__get_locale();
    } else {
        push @hints, "If setlocale() was called with empty string as second"
                     . " argument, the locale is selected from environment"
                     . " variables:";
    }

    if (exists $ENV{LANGUAGE} && length $ENV{LANGUAGE}) {
        push @hints, "  \$LANGUAGE is set to '$ENV{LANGUAGE}', wins.";
    } elsif (exists $ENV{LC_ALL} && length $ENV{LC_ALL}) {
        push @hints, "  \$LANGUAGE is not set.";
        push @hints, "  \$LC_ALL is set to '$ENV{LC_ALL}', wins.";
    } elsif (exists $ENV{LANG} && length $ENV{LANG}) {
        push @hints, "  \$LANGUAGE and \$LC_ALL are not set.";
        push @hints, "  \$LANG is set to '$ENV{LANG}', wins.";
    } elsif (exists $ENV{LC_MESSAGES} && length $ENV{LC_MESSAGES}) {
        push @hints, "  \$LANGUAGE, \$LC_ALL, and \$LANG are not set.";
        push @hints, "  \$LC_MESSAGES is set to '$ENV{LC_MESSAGES}', wins.";
    } else {
        push @hints, "  \$LANGUAGE, \$LC_ALL, \$LANG, and \$LC_MESSAGES are"
                     . " not set.";
        push @hints, "  falling back to 'C' aka 'POSIX'.";
    }

    my (undef, @locales) = 
        Locale::gettext_pp::__selected_locales($locale, 
                                               Locale::Messages::LC_MESSAGES(),
                                               "LC_MESSAGES");

    my @dirs = ($dir);
    my $default_dir = $Locale::gettext_pp::__gettext_pp_default_dir;
    push @dirs, $default_dir if $default_dir && $dir ne $default_dir;

    my @dirs = ($dir);
    my ($tries, $lookup) = Locale::gettext_pp::__extend_locales(@locales);

    my %seen;
	my %loaded;
    my @domains;
    push @hints, "Searching catalogs ...";
    foreach my $basedir (@dirs) {
    	foreach my $try (@$tries) {
			next if $loaded{$try};

    		my $fulldir = File::Spec->catfile($basedir, $try, "LC_MESSAGES");
    		next if $seen{$fulldir}++;

            my $filename = File::Spec->catfile($fulldir, "$domainname.mo");

    		my $domain = Locale::gettext_pp::__load_catalog($filename, $try);
            if ($domain) {
                push @hints, "  $filename: successfully loaded.";
            } else {
                push @hints, "  $filename: $!";
                next;
            }
    		
			$loaded{$try} = 1;

    		$domain->{locale_id} = $lookup->{$try};
    		push @domains, $domain;
    	}
    }

    if (!@domains) {
        push @hints, "No catalog found, giving up.";
    } else {
        foreach my $domain (@domains) {
            if (defined $domain->{messages}->{$msgid}) {
                my @trans = @{$domain->{messages}->{$msgid}};
                shift @trans;
                push @hints, "$domain->{filename}: found translation: >>>$trans[0]<<<";
                last;
            } else {
                push @hints, "$domain->{filename}: msgid not found";
            }
        }
    }

    return wantarray ? @hints : join "\n", @hints;
}

1;

__END__

=head1 NAME

Locale::Messages::Debug - Debug libint-perl Features

=head1 SYNOPSIS

 use Locale::Messages::Debug;

=head1 DESCRIPTION

Message translation with libintl-perl relies on a correct setup and to a
certain extent on features of the operating system.  There are many things 
that can go wrong.  This module aims to help you, when problems occur.  It
is not meant to be used in production code!

The module was introduced with libintl-perl version 1.30.

=head1 FUNCTIONS

The module exports by default nothing.  Every function has to be
imported explicitely.

=over 4

=item B<debug_gettext MSGID>

Tries to retrieve a translation for B<MSGID>.

The function returns a list of hints in string form or the same list as 
one new-line separated string in scalar context;

Example:

    my @hints = debug_gettext "Hello, world!";
    foreach my $hint (@hints) {
        print "hint\n";
    }

=head1 AUTHOR

Copyright (C) 2002-2017 L<Guido Flohr|http://www.guido-flohr.net/>
(L<mailto:guido.flohr@cantanea.com>), all rights reserved.  See the source
code for details!code for details!

=head1 SEE ALSO

Locale::Messages(3pm), Locale::TextDomain(3pm), Locale::gettext_pp(3pm),
Encode(3pm), perllocale(3pm), POSIX(3pm), perl(1), gettext(1), gettext(3)

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
