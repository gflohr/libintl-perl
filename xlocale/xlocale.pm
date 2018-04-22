#! /bin/false

# vim: tabstop=4

# Perl XS implementation of Uniforum message translation.
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

package Locale::xlocale;

use base qw(DynaLoader);

bootstrap Locale::xlocale;

BEGIN {
    eval { Locale::xlocale::init_threads() };
}

sub strftime_l {
    require Carp;
    Carp::croak("strftime_l emulation not yet done");
}

sub localeconv_l {
    require Carp;
    Carp::croak("localeconv_l emulation not yet done");
}

sub printf_l {
    require Carp;
    Carp::croak("printf_l emulation not yet done");
}

sub sprintf_l {
    require Carp;
    Carp::croak("sprintf_l emulation not yet done");
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
tab-width: 4
End:

