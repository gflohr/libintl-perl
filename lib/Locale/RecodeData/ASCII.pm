#! /bin/false
# vim: syntax=perl
#      tabstop=4
# -*- perl -*-

# Conversion routines for ASCII.
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

package Locale::RecodeData::ASCII;

use base Locale::RecodeData;

use strict;

sub _recode
{
	my $unknown = $_[0]->{_unknown};

    if ($_[0]->{_from} eq 'INTERNAL') {
		my $unknown_chr = chr $unknown;
		$unknown_chr = '' unless defined $unknown_chr;
		# FIXME: Maybe the lookup is cheaper than the call to chr().
		$_[1] = join '', 
		    map $_ > 0x7f ? $unknown_chr : chr $_,
			    @{$_[1]};
    } elsif ($_[0]->{_to} =~ m,^UTF-8/+,) {
		my $unknown_chr = $unknown <= 0x7f ? chr $unknown : '';
		$unknown_chr = '' unless defined $unknown_chr;
		# FIXME: Maybe the lookup is cheaper than the call to chr().
		$_[1] = join '', 
		    map $_ > 0x7f ? $unknown_chr : chr $_, unpack 'C*', $_[1];
    } else {
		$_[1] = [ map { $_ > 0x7f ? $unknown : $_ } unpack 'C*', $_[1] ];
    }

    return 1;
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
