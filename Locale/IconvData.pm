#! /bin/false
# -*- perl -*-

# Virtual base class for Locale::iconv converters.
# Copyright (C) 2002 Guido Flohr <guido@imperia.net>, all rights reserved.

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

package Locale::IconvData;

use strict;

sub new
{
    my ($class, %args) = @_;

    bless {
	_from => $args{from},
	_to => $args{to},
	_unknown => $args{unknown},
	_illegal => $args{illegal},
    }, $class;
}

sub _setUnknown
{
    my ($self, $unknown) = @_;
    $unknown = '?' unless defined $unknown;
    return $self->{_unknown} = $unknown;
}

sub _getError
{
	shift->{_error};
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
