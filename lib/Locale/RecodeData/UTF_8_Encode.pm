#! /bin/false

# vim: tabstop=4
# $Id: UTF_8_Encode.pm,v 1.2 2003/06/13 11:40:10 guido Exp $

# Conversion routines for UTF-8 (Perl >= 5.8.0).
# Copyright (C) 2002-2003 Guido Flohr <guido@imperia.net>,
# all rights reserved.
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

package Locale::RecodeData::UTF_8_Encode;

require Locale::RecodeData;
use base qw(Locale::RecodeData);

use strict;

use Encode;
use bytes;

sub _recode
{
    if ($_[0]->{_from} eq 'INTERNAL') {
	return $_[0]->_fromInternal ($_[1]);
    } else {
	return $_[0]->_toInternal ($_[1]);
    }
}

sub _toInternal
{
    my $string = $_[1];
    
    if ($string eq "\000") {
	$_[1] = [ 0 ];
	return 1;
    }
    Encode::_utf8_on ($string);

    # Despite the promise in the manpage, Encode does not seem to
    # honor the additional flag.
    my @output = ();

    my @chunks = split /\000/, $string;
    my $count = 0;
    foreach my $chunk (@chunks) {
	Encode::_utf8_on ($chunk);
	push @output, 0x0 if $count++;
	push @output, map $_ || 0xfffd, unpack "N*", encode ("UTF-32BE",
							     $chunk,
							     Encode::FB_DEFAULT);
    }

    $_[1] = \@output;

    return 1;
}

# This routine assumes that the internal representation is always sane
# and contains valid codes only.
sub _fromInternal
{
    $_[1] = pack "U*", @{$_[1]};
    
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
tab-width: 4
End:

=head1 NAME

Locale::RecodeData::UTF_8_Encode

=head1 SYNOPSIS

This module is internal to libintl.  Do not use directly!

=head1 DESCRIPTION

This modules contains the conversion tables for UTF-8.  It is capable of
converting from UTF-8 to the internal format of libintl-perl and vice
versa.  It is only suitable for Perl 5.8.0 and later versions.  However,
you do not have to bother about version checking, Locale::Recode(3)
will do that for you.

=head1 CHARACTER TABLE

See http://www.unicode.org/.

=head1 AUTHOR

Copyright (C) 2002-2003, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(http://www.imperia.net/).

=head1 SEE ALSO

Locale::RecodeData(3), Locale::Recode(3), Locale::RecodeData::UTF_8(3), 
perl(1)

