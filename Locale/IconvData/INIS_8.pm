#! /bin/false
# -*- perl -*-
# $Id: INIS_8.pm,v 1.2 2002/07/09 19:02:17 guido Exp $

# Conversion routines for INIS-8.
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

package Locale::IconvData::INIS_8;

use base Locale::IconvData;

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
    0x000003b1,
    0x000003b2,
    0x000003b3,
    0x000003b4,
    0x0000039e,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x00002192,
    0x0000222b,
    0x00002070,
    0x000000b9,
    0x000000b2,
    0x000000b3,
    0x00002074,
    0x00002075,
    0x00002076,
    0x00002077,
    0x00002078,
    0x00002079,
    0x0000207a,
    0x0000207b,
    0x000030eb,
    0x00000394,
    0x0000039b,
    0x000003a9,
    0x00002080,
    0x00002081,
    0x00002082,
    0x00002083,
    0x00002084,
    0x00002085,
    0x00002086,
    0x00002087,
    0x00002088,
    0x00002089,
    0x000003a3,
    0x000003bc,
    0x000003bd,
    0x000003c9,
    0x000003c0,
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
    "\xce\xb1",
    "\xce\xb2",
    "\xce\xb3",
    "\xce\xb4",
    "\xce\x9e",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\xe2\x86\x92",
    "\xe2\x88\xab",
    "\xe2\x81\xb0",
    "\xc2\xb9",
    "\xc2\xb2",
    "\xc2\xb3",
    "\xe2\x81\xb4",
    "\xe2\x81\xb5",
    "\xe2\x81\xb6",
    "\xe2\x81\xb7",
    "\xe2\x81\xb8",
    "\xe2\x81\xb9",
    "\xe2\x81\xba",
    "\xe2\x81\xbb",
    "\xe3\x83\xab",
    "\xce\x94",
    "\xce\x9b",
    "\xce\xa9",
    "\xe2\x82\x80",
    "\xe2\x82\x81",
    "\xe2\x82\x82",
    "\xe2\x82\x83",
    "\xe2\x82\x84",
    "\xe2\x82\x85",
    "\xe2\x82\x86",
    "\xe2\x82\x87",
    "\xe2\x82\x88",
    "\xe2\x82\x89",
    "\xce\xa3",
    "\xce\xbc",
    "\xce\xbd",
    "\xcf\x89",
    "\xcf\x80",
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
    0x0000007f => "\x7f",
    0x000000b2 => "\x62",
    0x000000b3 => "\x63",
    0x000000b9 => "\x61",
    0x00000394 => "\x6d",
    0x0000039b => "\x6e",
    0x0000039e => "\x3e",
    0x000003a3 => "\x7a",
    0x000003a9 => "\x6f",
    0x000003b1 => "\x3a",
    0x000003b2 => "\x3b",
    0x000003b3 => "\x3c",
    0x000003b4 => "\x3d",
    0x000003bc => "\x7b",
    0x000003bd => "\x7c",
    0x000003c0 => "\x7e",
    0x000003c9 => "\x7d",
    0x00002070 => "\x60",
    0x00002074 => "\x64",
    0x00002075 => "\x65",
    0x00002076 => "\x66",
    0x00002077 => "\x67",
    0x00002078 => "\x68",
    0x00002079 => "\x69",
    0x0000207a => "\x6a",
    0x0000207b => "\x6b",
    0x00002080 => "\x70",
    0x00002081 => "\x71",
    0x00002082 => "\x72",
    0x00002083 => "\x73",
    0x00002084 => "\x74",
    0x00002085 => "\x75",
    0x00002086 => "\x76",
    0x00002087 => "\x77",
    0x00002088 => "\x78",
    0x00002089 => "\x79",
    0x00002192 => "\x5e",
    0x0000222b => "\x5f",
    0x000030eb => "\x6c",
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

=head1 NAME

Locale::IconvData::$module_name

=head1 SYNOPSIS

This module is internal to libintl.  Do not use directly!

=head1 DESCRIPTION

This module is generated and contains the conversion tables and
routines for $codeset.

=head1 COMMENTS

The following comments have been extracted from the original charmap:

 version: 1.0
 repertoiremap: mnemonic,ds
  source: ECMA registry
 alias ISO-IR-50

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
    3A |  000003B1 | GREEK SMALL LETTER ALPHA
    3B |  000003B2 | GREEK SMALL LETTER BETA
    3C |  000003B3 | GREEK SMALL LETTER GAMMA
    3D |  000003B4 | GREEK SMALL LETTER DELTA
    3E |  0000039E | GREEK CAPITAL LETTER XI
    5E |  00002192 | RIGHTWARDS ARROW
    5F |  0000222B | INTEGRAL
    60 |  00002070 | SUPERSCRIPT ZERO
    61 |  000000B9 | SUPERSCRIPT ONE
    62 |  000000B2 | SUPERSCRIPT TWO
    63 |  000000B3 | SUPERSCRIPT THREE
    64 |  00002074 | SUPERSCRIPT FOUR
    65 |  00002075 | SUPERSCRIPT FIVE
    66 |  00002076 | SUPERSCRIPT SIX
    67 |  00002077 | SUPERSCRIPT SEVEN
    68 |  00002078 | SUPERSCRIPT EIGHT
    69 |  00002079 | SUPERSCRIPT NINE
    6A |  0000207A | SUPERSCRIPT PLUS SIGN
    6B |  0000207B | SUPERSCRIPT MINUS
    6C |  000030EB | KATAKANA LETTER RU
    6D |  00000394 | GREEK CAPITAL LETTER DELTA
    6E |  0000039B | GREEK CAPITAL LETTER LAMDA
    6F |  000003A9 | GREEK CAPITAL LETTER OMEGA
    70 |  00002080 | SUBSCRIPT ZERO
    71 |  00002081 | SUBSCRIPT ONE
    72 |  00002082 | SUBSCRIPT TWO
    73 |  00002083 | SUBSCRIPT THREE
    74 |  00002084 | SUBSCRIPT FOUR
    75 |  00002085 | SUBSCRIPT FIVE
    76 |  00002086 | SUBSCRIPT SIX
    77 |  00002087 | SUBSCRIPT SEVEN
    78 |  00002088 | SUBSCRIPT EIGHT
    79 |  00002089 | SUBSCRIPT NINE
    7A |  000003A3 | GREEK CAPITAL LETTER SIGMA
    7B |  000003BC | GREEK SMALL LETTER MU
    7C |  000003BD | GREEK SMALL LETTER NU
    7D |  000003C9 | GREEK SMALL LETTER OMEGA
    7E |  000003C0 | GREEK SMALL LETTER PI
    7F |  0000007F | DELETE (DEL)


=head1 AUTHOR

Copyright (C) 2002, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(http://www.imperia.net/).

=head1 SEE ALSO

Locale::IconvData(3), Locale::Iconv(3), perl(1)

