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

package Locale;

use strict;

# Get rid of that!
use Locale::Messages;

use vars qw (@EXPORT_OK %EXPORT_TAGS @ISA $VERSION);

$VERSION = '1.29';

# Do not load from current working directory.
local @INC = grep { File::Spec->file_name_is_absolute($_) } @INC;

eval <<'EOF';
require Locale::xlocale; 
my $version = Locale::xlocale::__xlocale_version();
die "Version: version mismatch ($VERSION vs. $version)" unless $version eq $VERSION;
EOF
my $no_xlocale = $@;

require Exporter;
@ISA = qw (Exporter);
%EXPORT_TAGS = (locale_h => [ 
                    qw (LC_ADDRESS_MASK
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

@EXPORT_OK = qw (LC_ADDRESS_MASK
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

sub AUTOLOAD {
    our $AUTOLOAD;

$DB::single = 1;
    my $constant = $AUTOLOAD;

    if ($constant =~ /::(LC_[A-Z]+)_MASK$/) {
        # FIXME! Use this class instead! 
        my $retval = Locale::Messages->can($1)->();
        return 1 << $retval; 
    }

    require Carp;
    Carp::croak("Unknown Locale constant '$constant'");
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

Perl 5.6 introduced the so-called utf8 flag, see L<Encode> for details.
This module I<never> sets the utf8 flag for scalars it returns without
being told to.  This is consistent with Perl's behavior.

See below L</"set_utf8"> for a way to change that.

=head1 CONSTANTS

This module defines a lot of constants.  Not all of them are available on
every system.  In doubt, protect their usage by eval().

You can either import definitions for a particular constant directly
or by one of the provided import tags.  The following list is grouped
by import tag.

=head2 Import Tag "locale_h"

All of the following constants, except for B<LC_GLOBAL_LOCALE>
are valid arguments, whenever a locale mask is needed.  You can also
use their bitwise OR.

=over 4

=item B<LC_ADDRESS_MASK>

Formatting of addresses and geography-related items.

This is a GNU extension.

=item B<LC_COLLATE_MASK>

String collation.

=item B<LC_CTYPE_MASK>

Character classification.

=item B<LC_IDENTIFICATION_MASK>

Metadata describing the locale.

This is a GNU extension.

=item B<LC_MEASUREMENT_MASK>

Settings related to measurements (metric versus US customary).

Ths is a GNU extension.

=item B<LC_MESSAGES_MASK>

Localizable natural-language messages.

=item B<LC_MONETARY_MASK>

Formatting of monetary values.

=item B<LC_NUMERIC_MASK>

Formatting of nonmonetary numeric values.

=item B<LC_NAME_MASK>

Formatting of salutations for persons.

This is a GNU extension.

=item B<LC_PAPER_MASK>

Settings related to the standard paper size.

This is a GNU extension.

=item B<LC_TELEPHONE_MASK>

Formats to be used with telephone services.

This is a GNU extension.

=item B<LC_TIME_MASK>

Formatting of date and time values.

=item B<LC_ALL_MASK>

All of the locale.

=item B<LC_GLOBAL_LOCALE>

The globale locale defined by setlocale().

=back

=head1 AUTHOR

Copyright (C) 2002-2017 L<Guido Flohr|http://www.guido-flohr.net/>
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
