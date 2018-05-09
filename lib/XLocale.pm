#! /bin/false

# vim: set autoindent shiftwidth=4 tabstop=4:

# Copyright (C) 2002-2018 Guido Flohr <guido.flohr@cantanea.com>,
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

package XLocale;

use strict;

use File::Spec();
use POSIX();
use List::Util qw(max);

use vars qw (@EXPORT_OK %EXPORT_TAGS @ISA $VERSION);

$VERSION = '1.29';

# Do not load from current working directory.
local @INC = grep { File::Spec->file_name_is_absolute($_) } @INC;

eval <<'EOF';
require Locale::xlocale; 
my $version = Locale::xlocale::__xlocale_version();
die "Version: version mismatch ($VERSION vs. $version)" unless $version eq $VERSION;
EOF
my $has_xlocale = !$@;

require Exporter;
@ISA = qw (Exporter);
%EXPORT_TAGS = (locale_h => [ 
                    qw (LC_ADDRESS
                        LC_CTYPE
                        LC_COLLATE
                        LC_IDENTIFICATION
                        LC_MEASUREMENT
                        LC_MESSAGES
                        LC_MONETARY
                        LC_NUMERIC
                        LC_NAME
                        LC_PAPER
                        LC_TELEPHONE
                        LC_TIME
                        LC_ALL
                        LC_ADDRESS_MASK
                        LC_CTYPE_MASK
                        LC_COLLATE_MASK
                        LC_IDENTIFICATION_MASK
                        LC_MEASUREMENT_MASK
                        LC_MESSAGES_MASK
                        LC_MONETARY_MASK
                        LC_NUMERIC_MASK
                        LC_NAME_MASK
                        LC_PAPER_MASK
                        LC_TELEPHONE_MASK
                        LC_TIME_MASK
                        LC_ALL_MASK
                        
                        LC_GLOBAL_LOCALE)],
		 );

@EXPORT_OK = qw (LC_ADDRESS
                 LC_CTYPE
                 LC_COLLATE
                 LC_IDENTIFICATION
                 LC_MEASUREMENT
                 LC_MESSAGES
                 LC_MONETARY
                 LC_NUMERIC
                 LC_NAME
                 LC_PAPER
                 LC_TELEPHONE
                 LC_TIME
                 LC_ALL
                 LC_ADDRESS_MASK
                 LC_CTYPE_MASK
                 LC_COLLATE_MASK
                 LC_IDENTIFICATION_MASK
                 LC_MEASUREMENT_MASK
                 LC_MESSAGES_MASK
                 LC_MONETARY_MASK
                 LC_NUMERIC_MASK
                 LC_NAME_MASK
                 LC_PAPER_MASK
                 LC_TELEPHONE_MASK
                 LC_TIME_MASK
                 LC_ALL_MASK
                 
                 LC_GLOBAL_LOCALE);

our $__libintl_mutex_setlocale => 0;
my $lc_global_locale;
$lc_global_locale = bless \$lc_global_locale, __PACKAGE__;

sub new {
    my ($class, $mask, $locale, $base) = @_;

    my $loc;
    if ($has_xlocale) {
        if (@_ < 4) {
            $loc = Locale::xlocale::newlocale($mask, $locale) or return;
        } elsif ($base == $lc_global_locale) {
            $loc = Locale::xlocale::newlocale(
                    $mask, $locale, Locale::xlocale::LC_GLOBAL_LOCALE())
                        or return;
        } else {
            $loc = Locale::xlocale::newlocale($mask, $locale, $base)
                or return;
        }
    } else {
        $loc = {}; 
    }

    bless { __loc => $loc }, shift;
}

sub DESTROY {
}

sub LC_GLOBAL_LOCALE { $lc_global_locale }

sub __xGlobalLocale($$$) {
    my ($category, $locale, $code) = @_;
    eval { Locale::xlocale::lock($__libintl_mutex_setlocale) };
    my $saved_locale = eval { POSIX::setlocale($category, $locale) };

    if (!defined wantarray) {
        eval { $code->() };
        my $x = $@;
        if ($saved_locale) {
            eval { POSIX::setlocale($category, $saved_locale) };
        }
        eval { Locale::xlocale::lock($__libintl_mutex_setlocale) };
        die $x if $x;
        return;
    } elsif (wantarray) {
        my @retval = eval { $code->() };
        my $x = $@;
        if ($saved_locale) {
            eval { POSIX::setlocale($category, $saved_locale) };
        }
        eval { Locale::xlocale::lock($__libintl_mutex_setlocale) };
        die $x if $x;
        return @retval;
    } else {
        my $retval = eval { $code->() };
        my $x = $@;
        if ($saved_locale) {
            eval { POSIX::setlocale($category, $saved_locale) };
        }
        eval { Locale::xlocale::lock($__libintl_mutex_setlocale) };
        die $x if $x;
        return $retval;
    }
}

sub __lc_messages_mask {
    if (POSIX->can('LC_MESSAGES')) {
        return 1 << POSIX::LC_MESSAGES();
    }
    # If LC_MESSAGES is not defined, generate a mask value for it that
    # does not conflict with one of LC_COLLATE_MASK, LC_CTYPE_MASK,
    # LC_MONETARY_MASK, LC_NUMERIC_MASK or LC_TIME_MASK.
    my $max = max(POSIX->can('LC_COLLATE')->(),
                  POSIX->can('LC_CTYPE')->(),
                  POSIX->can('LC_MONETARY')->(),
                  POSIX->can('LC_NUMERIC')->(),
                  POSIX->can('LC_TIME')->());
    return 1 << (1 + $max);
}

# This may become a bottleneck.  Maybe better write out regular
# methods.
sub AUTOLOAD {
    our $AUTOLOAD;

    my $constant = $AUTOLOAD;
    my $pkg = __PACKAGE__;
    if ($has_xlocale) {
        if ($constant =~ /^${pkg}::(LC_[A-Z]+)_MASK$/) {
            return Locale::xlocale->can($1)->() || 0;
        } else {
            die "todo $constant";
        }
    } else {
        if ($constant eq "${pkg}::LC_ALL_MASK") {
            return (1 << POSIX->can('LC_COLLATE')->())
                 | (1 << POSIX->can('LC_CTYPE')->())
                 | (1 << POSIX->can('LC_MONETARY')->())
                 | (1 << POSIX->can('LC_NUMERIC')->())
                 | (1 << POSIX->can('LC_TIME')->())
                 | __lc_messages_mask();
        } elsif ($constant eq "${pkg}::LC_MESSAGES_MASK") {
            return __lc_messages_mask();
        } elsif ($constant =~ /^${pkg}::(LC_[A-Z]+)_MASK$/) {
            my $retval = POSIX->can($1)->();
            return 1 << POSIX->can($1)->();
        } else {
            die "todo no xlocale $constant";
        }
    }

    require Carp;
    Carp::croak("Undefined subroutine &${constant} called");
}

1;

__END__

=head1 NAME

Locale - POSIX Extended Locale Support

=head1 SYNOPSIS

  use Locale qw(:locale_h);

  $loc = Locale->new(LC_NUMERIC_MASK | LC_TIME_MASK, "", LC_GLOBAL_LOCALE);

=head1 DESCRIPTION

The module B<Locale> is a wrapper around the (thread-safe) POSIX Extended
Locale Interface.  If that interface is not available, a fallback to the
traditional locale interface of the libc is provided.

B<Locale> was introduced in libintl-perl version 2.

=head2 Thread-Safety

All parts of libintl-perl are thread-safe in the
context of Perl threads aka Perl interpreter threads (L<threads>).  If the
Perl interpreter is running inside operating system threads, libintl-perl
is mostly not thread-safe because the underlying functionality of the
system library libc is not thread-safe.

This module fills a gap.  It tries its best to provide thread-safe locale
support.  If the system library libc provides the functions newlocale(),
uselocale(), and freelocale(), they will be used.

Otherwise, if POSIX threads are available (try "man pthread_create" to find
out), locale switching is synchronized with mutexes.  As long as only this
library switches locale, thread-safety is also guaranteed.

If the system also does not have POSIX threads, the module is not thread-safe
but most probably that does not matter for you, because your code will not
run inside a threaded environment anyway.

One prominent example of Perl interpreters running with operating threads
is mod_perl running with an Apache threaded MPM or a threaded Plack backend.

=head2 The UTF8 Flag

TODO!

=head1 CONSTANTS

This module defines a lot of constants.  Not all of them are available on
every system.  In doubt, protect their usage by eval().

You can either import definitions for a particular constant directly
or by one of the provided import tags.  The following list is grouped
by import tag.

=head2 Import Tag "locale_h"

All of the following constants that end in "_MASK"
are valid arguments, whenever a locale mask is needed.  You can also
use their bitwise OR.

The variants without "_MASK" are meant to be used for L<POSIX/"setlocale">.

=over 4

=item B<LC_ADDRESS, LC_ADDRESS_MASK>

Formatting of addresses and geography-related items.

This is a GNU extension.

=item B<LC_COLLATE, LC_COLLATE_MASK>

String collation.

=item B<LC_CTYPE, LC_CTYPE_MASK>

Character classification.

=item B<LC_IDENTIFICATION, LC_IDENTIFICATION_MASK>

Metadata describing the locale.

This is a GNU extension.

=item B<LC_MEASUREMENT, LC_MEASUREMENT_MASK>

Settings related to measurements (metric versus US customary).

Ths is a GNU extension.

=item B<LC_MESSAGES, LC_MESSAGES_MASK>

Localizable natural-language messages.

=item B<LC_MONETARY, LC_MONETARY_MASK>

Formatting of monetary values.

=item B<LC_NUMERIC, LC_NUMERIC_MASK>

Formatting of nonmonetary numeric values.

=item B<LC_NAME, LC_NAME_MASK>

Formatting of salutations for persons.

This is a GNU extension.

=item B<LC_PAPER, LC_PAPER_MASK>

Settings related to the standard paper size.

This is a GNU extension.

=item B<LC_TELEPHONE, LC_TELEPHONE_MASK>

Formats to be used with telephone services.

This is a GNU extension.

=item B<LC_TIME, LC_TIME_MASK>

Formatting of date and time values.

=item B<LC_ALL, LC_ALL_MASK>

All of the locale.

=item B<LC_GLOBAL_LOCALE>

The globale locale defined by setlocale().

=back

=head1 AUTHOR

Copyright (C) 2002-2018 L<Guido Flohr|http://www.guido-flohr.net/>
(L<mailto:guido.flohr@cantanea.com>), all rights reserved.  See the source
code for details!code for details!

=head1 SEE ALSO

L<Encode>, L<Locale::Messages>, newlocale(3), uselocale(3), duplocale(3),
freelocale(3), querylocale(3), L<POSIX>, locale(7), L<perl>

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
