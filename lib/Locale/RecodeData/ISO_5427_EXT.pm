#! /bin/false

# vim: tabstop=4
# $Id: ISO_5427_EXT.pm,v 1.3 2003/06/02 11:16:56 guido Exp $

# Conversion routines for ISO_5427-EXT.
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

package Locale::RecodeData::ISO_5427_EXT;

require Locale::RecodeData;
use base qw(Locale::RecodeData);

use strict;

my @to_ucs4 = (
    0x00000000,
    0x00000001,
    0x00000002,
    0x00000003,
    0x00000004,
    0x00000005,
    0x00000006,
    0x00000007,
    0x00000008,
    0x00000009,
    0x0000000a,
    0x0000000b,
    0x0000000c,
    0x0000000d,
    0x0000000e,
    0x0000000f,
    0x00000010,
    0x00000011,
    0x00000012,
    0x00000013,
    0x00000014,
    0x00000015,
    0x00000016,
    0x00000017,
    0x00000018,
    0x00000019,
    0x0000001a,
    0x0000001b,
    0x0000001c,
    0x0000001d,
    0x0000001e,
    0x0000001f,
    0x00000020,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x00000491,
    0x00000452,
    0x00000453,
    0x00000454,
    0x00000451,
    0x00000455,
    0x00000456,
    0x00000457,
    0x00000458,
    0x00000459,
    0x0000045a,
    0x0000045b,
    0x0000045c,
    0x0000045e,
    0x0000045f,
    undef,
    0x00000463,
    0x00000473,
    0x00000475,
    0x0000046b,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x0000005b,
    undef,
    0x0000005d,
    undef,
    0x0000005f,
    0x00000490,
    0x00000402,
    0x00000403,
    0x00000404,
    0x00000401,
    0x00000405,
    0x00000406,
    0x00000407,
    0x00000408,
    0x00000409,
    0x0000040a,
    0x0000040b,
    0x0000040c,
    0x0000040e,
    0x0000040f,
    0x0000042a,
    0x00000462,
    0x00000472,
    0x00000474,
    0x0000046a,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x0000007f,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
);

my @to_utf8 = (
    "\x00",
    "\x01",
    "\x02",
    "\x03",
    "\x04",
    "\x05",
    "\x06",
    "\x07",
    "\x08",
    "\x09",
    "\x0a",
    "\x0b",
    "\x0c",
    "\x0d",
    "\x0e",
    "\x0f",
    "\x10",
    "\x11",
    "\x12",
    "\x13",
    "\x14",
    "\x15",
    "\x16",
    "\x17",
    "\x18",
    "\x19",
    "\x1a",
    "\x1b",
    "\x1c",
    "\x1d",
    "\x1e",
    "\x1f",
    "\x20",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\xd2\x91",
    "\xd1\x92",
    "\xd1\x93",
    "\xd1\x94",
    "\xd1\x91",
    "\xd1\x95",
    "\xd1\x96",
    "\xd1\x97",
    "\xd1\x98",
    "\xd1\x99",
    "\xd1\x9a",
    "\xd1\x9b",
    "\xd1\x9c",
    "\xd1\x9e",
    "\xd1\x9f",
    undef,
    "\xd1\xa3",
    "\xd1\xb3",
    "\xd1\xb5",
    "\xd1\xab",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\x5b",
    undef,
    "\x5d",
    undef,
    "\x5f",
    "\xd2\x90",
    "\xd0\x82",
    "\xd0\x83",
    "\xd0\x84",
    "\xd0\x81",
    "\xd0\x85",
    "\xd0\x86",
    "\xd0\x87",
    "\xd0\x88",
    "\xd0\x89",
    "\xd0\x8a",
    "\xd0\x8b",
    "\xd0\x8c",
    "\xd0\x8e",
    "\xd0\x8f",
    "\xd0\xaa",
    "\xd1\xa2",
    "\xd1\xb2",
    "\xd1\xb4",
    "\xd1\xaa",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\x7f",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
);

my %from_ucs4 = (
    0x00000000 => "\x00",
    0x00000001 => "\x01",
    0x00000002 => "\x02",
    0x00000003 => "\x03",
    0x00000004 => "\x04",
    0x00000005 => "\x05",
    0x00000006 => "\x06",
    0x00000007 => "\x07",
    0x00000008 => "\x08",
    0x00000009 => "\x09",
    0x0000000a => "\x0a",
    0x0000000b => "\x0b",
    0x0000000c => "\x0c",
    0x0000000d => "\x0d",
    0x0000000e => "\x0e",
    0x0000000f => "\x0f",
    0x00000010 => "\x10",
    0x00000011 => "\x11",
    0x00000012 => "\x12",
    0x00000013 => "\x13",
    0x00000014 => "\x14",
    0x00000015 => "\x15",
    0x00000016 => "\x16",
    0x00000017 => "\x17",
    0x00000018 => "\x18",
    0x00000019 => "\x19",
    0x0000001a => "\x1a",
    0x0000001b => "\x1b",
    0x0000001c => "\x1c",
    0x0000001d => "\x1d",
    0x0000001e => "\x1e",
    0x0000001f => "\x1f",
    0x00000020 => "\x20",
    0x0000005b => "\x5b",
    0x0000005d => "\x5d",
    0x0000005f => "\x5f",
    0x0000007f => "\x7f",
    0x00000401 => "\x64",
    0x00000402 => "\x61",
    0x00000403 => "\x62",
    0x00000404 => "\x63",
    0x00000405 => "\x65",
    0x00000406 => "\x66",
    0x00000407 => "\x67",
    0x00000408 => "\x68",
    0x00000409 => "\x69",
    0x0000040a => "\x6a",
    0x0000040b => "\x6b",
    0x0000040c => "\x6c",
    0x0000040e => "\x6d",
    0x0000040f => "\x6e",
    0x0000042a => "\x6f",
    0x00000451 => "\x44",
    0x00000452 => "\x41",
    0x00000453 => "\x42",
    0x00000454 => "\x43",
    0x00000455 => "\x45",
    0x00000456 => "\x46",
    0x00000457 => "\x47",
    0x00000458 => "\x48",
    0x00000459 => "\x49",
    0x0000045a => "\x4a",
    0x0000045b => "\x4b",
    0x0000045c => "\x4c",
    0x0000045e => "\x4d",
    0x0000045f => "\x4e",
    0x00000462 => "\x70",
    0x00000463 => "\x50",
    0x0000046a => "\x73",
    0x0000046b => "\x53",
    0x00000472 => "\x71",
    0x00000473 => "\x51",
    0x00000474 => "\x72",
    0x00000475 => "\x52",
    0x00000490 => "\x60",
    0x00000491 => "\x40",
);

sub _recode
{
    my $unknown = $_[0]->{_unknown};

    if ($_[0]->{_from} eq 'INTERNAL') {
	my $unknown_chr = $from_ucs4{$unknown};
	$unknown_chr = '' unless defined $unknown_chr;
	$_[1] = join '',
	    map $from_ucs4{$_} || (defined $from_ucs4{$_} ? 0 : $unknown_chr),
	        @{$_[1]};
    } elsif ($_[0]->{_to} =~ m,^UTF-8/+,) {
	return $_[0]->__toUTF8 ($_[1]);
    } else {
	$_[1] = [ map 
	    $to_ucs4[$_] || (defined $to_ucs4[$_] ? 0 : $unknown),
	        unpack 'C*', $_[1] 
	];
    }

    return 1;
}

sub __toUTF8
{
    $_[1] = join '', map $to_utf8[$_], unpack 'C*', $_[1];
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

Locale::RecodeData::ISO_5427_EXT

=head1 SYNOPSIS

This module is internal to libintl.  Do not use directly!

=head1 DESCRIPTION

This module is generated and contains the conversion tables and
routines for ISO_5427-EXT.

=head1 COMMENTS

The following comments have been extracted from the original charmap:

 version: 1.0
 repertoiremap: mnemonic,ds
  source: ECMA registry
 alias ISO-IR-54
 alias ISO_5427:1981

Please note that aliases listed above are not necessarily valid!

=head1 CHARACTER TABLE

The following table is sorted in the same order as the original charmap.
All character codes are in hexadecimal.  Please read 'ISO-10646' as
'ISO-10646-UCS4'.

 Local | ISO-10646 | Description
-------+-----------+-------------------------------------------------
    00 |  00000000 | NULL (NUL)
    01 |  00000001 | START OF HEADING (SOH)
    02 |  00000002 | START OF TEXT (STX)
    03 |  00000003 | END OF TEXT (ETX)
    04 |  00000004 | END OF TRANSMISSION (EOT)
    05 |  00000005 | ENQUIRY (ENQ)
    06 |  00000006 | ACKNOWLEDGE (ACK)
    07 |  00000007 | BELL (BEL)
    08 |  00000008 | BACKSPACE (BS)
    09 |  00000009 | CHARACTER TABULATION (HT)
    0A |  0000000A | LINE FEED (LF)
    0B |  0000000B | LINE TABULATION (VT)
    0C |  0000000C | FORM FEED (FF)
    0D |  0000000D | CARRIAGE RETURN (CR)
    0E |  0000000E | SHIFT OUT (SO)
    0F |  0000000F | SHIFT IN (SI)
    10 |  00000010 | DATALINK ESCAPE (DLE)
    11 |  00000011 | DEVICE CONTROL ONE (DC1)
    12 |  00000012 | DEVICE CONTROL TWO (DC2)
    13 |  00000013 | DEVICE CONTROL THREE (DC3)
    14 |  00000014 | DEVICE CONTROL FOUR (DC4)
    15 |  00000015 | NEGATIVE ACKNOWLEDGE (NAK)
    16 |  00000016 | SYNCHRONOUS IDLE (SYN)
    17 |  00000017 | END OF TRANSMISSION BLOCK (ETB)
    18 |  00000018 | CANCEL (CAN)
    19 |  00000019 | END OF MEDIUM (EM)
    1A |  0000001A | SUBSTITUTE (SUB)
    1B |  0000001B | ESCAPE (ESC)
    1C |  0000001C | FILE SEPARATOR (IS4)
    1D |  0000001D | GROUP SEPARATOR (IS3)
    1E |  0000001E | RECORD SEPARATOR (IS2)
    1F |  0000001F | UNIT SEPARATOR (IS1)
    20 |  00000020 | SPACE
    40 |  00000491 | CYRILLIC SMALL LETTER GHE WITH UPTURN
    41 |  00000452 | CYRILLIC SMALL LETTER DJE
    42 |  00000453 | CYRILLIC SMALL LETTER GJE
    43 |  00000454 | CYRILLIC SMALL LETTER UKRAINIAN IE
    44 |  00000451 | CYRILLIC SMALL LETTER IO
    45 |  00000455 | CYRILLIC SMALL LETTER DZE
    46 |  00000456 | CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I
    47 |  00000457 | CYRILLIC SMALL LETTER YI
    48 |  00000458 | CYRILLIC SMALL LETTER JE
    49 |  00000459 | CYRILLIC SMALL LETTER LJE
    4A |  0000045A | CYRILLIC SMALL LETTER NJE
    4B |  0000045B | CYRILLIC SMALL LETTER TSHE
    4C |  0000045C | CYRILLIC SMALL LETTER KJE
    4D |  0000045E | CYRILLIC SMALL LETTER SHORT U
    4E |  0000045F | CYRILLIC SMALL LETTER DZHE
    50 |  00000463 | CYRILLIC SMALL LETTER YAT
    51 |  00000473 | CYRILLIC SMALL LETTER FITA
    52 |  00000475 | CYRILLIC SMALL LETTER IZHITSA
    53 |  0000046B | CYRILLIC SMALL LETTER BIG YUS
    5B |  0000005B | LEFT SQUARE BRACKET
    5D |  0000005D | RIGHT SQUARE BRACKET
    5F |  0000005F | LOW LINE
    60 |  00000490 | CYRILLIC CAPITAL LETTER GHE WITH UPTURN
    61 |  00000402 | CYRILLIC CAPITAL LETTER DJE
    62 |  00000403 | CYRILLIC CAPITAL LETTER GJE
    63 |  00000404 | CYRILLIC CAPITAL LETTER UKRAINIAN IE
    64 |  00000401 | CYRILLIC CAPITAL LETTER IO
    65 |  00000405 | CYRILLIC CAPITAL LETTER DZE
    66 |  00000406 | CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I
    67 |  00000407 | CYRILLIC CAPITAL LETTER YI
    68 |  00000408 | CYRILLIC CAPITAL LETTER JE
    69 |  00000409 | CYRILLIC CAPITAL LETTER LJE
    6A |  0000040A | CYRILLIC CAPITAL LETTER NJE
    6B |  0000040B | CYRILLIC CAPITAL LETTER TSHE
    6C |  0000040C | CYRILLIC CAPITAL LETTER KJE
    6D |  0000040E | CYRILLIC CAPITAL LETTER SHORT U
    6E |  0000040F | CYRILLIC CAPITAL LETTER DZHE
    6F |  0000042A | CYRILLIC CAPITAL LETTER HARD SIGN
    70 |  00000462 | CYRILLIC CAPITAL LETTER YAT
    71 |  00000472 | CYRILLIC CAPITAL LETTER FITA
    72 |  00000474 | CYRILLIC CAPITAL LETTER IZHITSA
    73 |  0000046A | CYRILLIC CAPITAL LETTER BIG YUS
    7F |  0000007F | DELETE (DEL)


=head1 AUTHOR

Copyright (C) 2002-2003, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(http://www.imperia.net/).

=head1 SEE ALSO

Locale::RecodeData(3), Locale::Recode(3), perl(1)

