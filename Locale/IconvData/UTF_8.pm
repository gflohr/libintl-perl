#! /bin/false
# vim: syntax=perl
#      tabstop=4
# -*- perl -*-
# $Id: UTF_8.pm,v 1.1 2002/07/12 18:00:38 guido Exp $

# Conversion routines for VISCII.
# Copyright (C) 2002 Guido Flohr <guido@imperia.net>, all rights reserved.
# This file is generated, do not edit!

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

package Locale::IconvData::UTF_8;

use base Locale::IconvData;

use strict;

sub _recode
{
    if ($_[0]->{_from} eq 'INTERNAL') {
	return $_[0]->_fromInternal ($_[1]);
    } else {
	return $_[0]->_toInternal ($_[1]);
    }
}

# This routine assumes that the internal representation is always sane
# and contains valid codes only.
sub _fromInternal
{
    $_[1] = join '', map {
	if ($_ <= 0x7f) {
	    chr $_;
	} elsif ($_ <= 0x7ff) {
	    pack ("c2", 
		  (0xc0 | (($_ >> 6) & 0x1f)),
		  (0x80 | ($_ & 0x3f)));
	} elsif ($_ <= 0xffff) {
	    pack ("c3", 
		  (0xe0 | (($_ >> 12) & 0xf)),
		  (0x80 | (($_ >> 6) & 0x3f)),
		  (0x80 | ($_ & 0x3f)));
	} elsif ($_ <= 0x1fffff) {
	    pack ("c4", 
		  (0xf0 | (($_ >> 18) & 0x7)),
		  (0x80 | (($_ >> 12) & 0x3f)),
		  (0x80 | (($_ >> 6) & 0x3f)),
		  (0x80 | ($_ & 0x3f)));
	} elsif ($_ <= 0x3ffffff) {
	    pack ("c5", 
		  (0xf0 | (($_ >> 24) & 0x3)),
		  (0x80 | (($_ >> 18) & 0x3f)),
		  (0x80 | (($_ >> 12) & 0x3f)),
		  (0x80 | (($_ >> 6) & 0x3f)),
		  (0x80 | ($_ & 0x3f)));
	} else {
	    pack ("c6", 
		  (0xf0 | (($_ >> 30) & 0x3)),
		  (0x80 | (($_ >> 24) & 0x1)),
		  (0x80 | (($_ >> 18) & 0x3f)),
		  (0x80 | (($_ >> 12) & 0x3f)),
		  (0x80 | (($_ >> 6) & 0x3f)),
		  (0x80 | ($_ & 0x3f)));
	}
    } @{$_[1]};
    return 1;
}

# Decode UTF-8 into integers.  We do not bother to care about possibly
# configured replacement characters here and simply fall back to 0xfffd.
# Rationale: the internal format is never output directly and the other
# encoders will handle the replacement character correctly.
sub _toInternal
{
    eval '$_[1] = [ unpack "U*", $_[1] ]';
    return 1 unless $@;  # Perl 5.6 or better.

    return;
}

1;

__END__

=head1 NAME

Locale::IconvData::UTF_8

=head1 SYNOPSIS

This module is internal to libintl.  Do not use directly!

=head1 DESCRIPTION

This modules contains the conversion tables for UTF-8.  It is capable of
converting from UTF-8 to the internal format of libintl-perl and vice
versa.

=head1 CHARACTER TABLE

See http://www.unicode.org/.

=head1 AUTHOR

Copyright (C) 2002, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(http://www.imperia.net/).

=head1 SEE ALSO

Locale::IconvData(3), Locale::Iconv(3), perl(1)

