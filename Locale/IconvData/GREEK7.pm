#! /bin/false
# -*- perl -*-
# $Id: GREEK7.pm,v 1.1.1.1 2002/07/08 19:19:59 guido Exp $

# Conversion routines for GREEK7.
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

package Locale::IconvData::GREEK7;

use base Locale::IconvData;

use strict;

use constant TO_UCS4 => [
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
    0x00000021,
    0x00000022,
    0x00000023,
    0x000000a4,
    0x00000025,
    0x00000026,
    0x00000027,
    0x00000028,
    0x00000029,
    0x0000002a,
    0x0000002b,
    0x0000002c,
    0x0000002d,
    0x0000002e,
    0x0000002f,
    0x00000030,
    0x00000031,
    0x00000032,
    0x00000033,
    0x00000034,
    0x00000035,
    0x00000036,
    0x00000037,
    0x00000038,
    0x00000039,
    0x0000003a,
    0x0000003b,
    0x0000003c,
    0x0000003d,
    0x0000003e,
    0x0000003f,
    0x00000040,
    0x00000391,
    0x00000392,
    0x00000393,
    0x00000394,
    0x00000395,
    0x00000396,
    0x00000397,
    0x00000398,
    0x00000399,
    undef,
    0x0000039a,
    0x0000039b,
    0x0000039c,
    0x0000039d,
    0x0000039e,
    0x0000039f,
    0x000003a0,
    0x000003a1,
    0x000003a3,
    0x000003a4,
    0x000003a5,
    0x000003a6,
    undef,
    0x000003a7,
    0x000003a8,
    0x000003a9,
    0x0000005b,
    0x0000005c,
    0x0000005d,
    0x0000005e,
    0x0000005f,
    0x00000060,
    0x000003b1,
    0x000003b2,
    0x000003b3,
    0x000003b4,
    0x000003b5,
    0x000003b6,
    0x000003b7,
    0x000003b8,
    0x000003b9,
    undef,
    0x000003ba,
    0x000003bb,
    0x000003bc,
    0x000003bd,
    0x000003be,
    0x000003bf,
    0x000003c0,
    0x000003c1,
    0x000003c3,
    0x000003c4,
    0x000003c5,
    0x000003c6,
    0x000003c2,
    0x000003c7,
    0x000003c8,
    0x000003c9,
    0x0000007b,
    0x0000007c,
    0x0000007d,
    0x0000203e,
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
];

use constant TO_UTF8 => [
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
    "\x21",
    "\x22",
    "\x23",
    "\xc2\xa4",
    "\x25",
    "\x26",
    "\x27",
    "\x28",
    "\x29",
    "\x2a",
    "\x2b",
    "\x2c",
    "\x2d",
    "\x2e",
    "\x2f",
    "\x30",
    "\x31",
    "\x32",
    "\x33",
    "\x34",
    "\x35",
    "\x36",
    "\x37",
    "\x38",
    "\x39",
    "\x3a",
    "\x3b",
    "\x3c",
    "\x3d",
    "\x3e",
    "\x3f",
    "\x40",
    "\xce\x91",
    "\xce\x92",
    "\xce\x93",
    "\xce\x94",
    "\xce\x95",
    "\xce\x96",
    "\xce\x97",
    "\xce\x98",
    "\xce\x99",
    undef,
    "\xce\x9a",
    "\xce\x9b",
    "\xce\x9c",
    "\xce\x9d",
    "\xce\x9e",
    "\xce\x9f",
    "\xce\xa0",
    "\xce\xa1",
    "\xce\xa3",
    "\xce\xa4",
    "\xce\xa5",
    "\xce\xa6",
    undef,
    "\xce\xa7",
    "\xce\xa8",
    "\xce\xa9",
    "\x5b",
    "\x5c",
    "\x5d",
    "\x5e",
    "\x5f",
    "\x60",
    "\xce\xb1",
    "\xce\xb2",
    "\xce\xb3",
    "\xce\xb4",
    "\xce\xb5",
    "\xce\xb6",
    "\xce\xb7",
    "\xce\xb8",
    "\xce\xb9",
    undef,
    "\xce\xba",
    "\xce\xbb",
    "\xce\xbc",
    "\xce\xbd",
    "\xce\xbe",
    "\xce\xbf",
    "\xcf\x80",
    "\xcf\x81",
    "\xcf\x83",
    "\xcf\x84",
    "\xcf\x85",
    "\xcf\x86",
    "\xcf\x82",
    "\xcf\x87",
    "\xcf\x88",
    "\xcf\x89",
    "\x7b",
    "\x7c",
    "\x7d",
    "\xe2\x80\xbe",
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
];

use constant FROM_UCS4 => {
    0x00000000 => 0x00,
    0x00000001 => 0x01,
    0x00000002 => 0x02,
    0x00000003 => 0x03,
    0x00000004 => 0x04,
    0x00000005 => 0x05,
    0x00000006 => 0x06,
    0x00000007 => 0x07,
    0x00000008 => 0x08,
    0x00000009 => 0x09,
    0x0000000a => 0x0a,
    0x0000000b => 0x0b,
    0x0000000c => 0x0c,
    0x0000000d => 0x0d,
    0x0000000e => 0x0e,
    0x0000000f => 0x0f,
    0x00000010 => 0x10,
    0x00000011 => 0x11,
    0x00000012 => 0x12,
    0x00000013 => 0x13,
    0x00000014 => 0x14,
    0x00000015 => 0x15,
    0x00000016 => 0x16,
    0x00000017 => 0x17,
    0x00000018 => 0x18,
    0x00000019 => 0x19,
    0x0000001a => 0x1a,
    0x0000001b => 0x1b,
    0x0000001c => 0x1c,
    0x0000001d => 0x1d,
    0x0000001e => 0x1e,
    0x0000001f => 0x1f,
    0x00000020 => 0x20,
    0x00000021 => 0x21,
    0x00000022 => 0x22,
    0x00000023 => 0x23,
    0x00000025 => 0x25,
    0x00000026 => 0x26,
    0x00000027 => 0x27,
    0x00000028 => 0x28,
    0x00000029 => 0x29,
    0x0000002a => 0x2a,
    0x0000002b => 0x2b,
    0x0000002c => 0x2c,
    0x0000002d => 0x2d,
    0x0000002e => 0x2e,
    0x0000002f => 0x2f,
    0x00000030 => 0x30,
    0x00000031 => 0x31,
    0x00000032 => 0x32,
    0x00000033 => 0x33,
    0x00000034 => 0x34,
    0x00000035 => 0x35,
    0x00000036 => 0x36,
    0x00000037 => 0x37,
    0x00000038 => 0x38,
    0x00000039 => 0x39,
    0x0000003a => 0x3a,
    0x0000003b => 0x3b,
    0x0000003c => 0x3c,
    0x0000003d => 0x3d,
    0x0000003e => 0x3e,
    0x0000003f => 0x3f,
    0x00000040 => 0x40,
    0x0000005b => 0x5b,
    0x0000005c => 0x5c,
    0x0000005d => 0x5d,
    0x0000005e => 0x5e,
    0x0000005f => 0x5f,
    0x00000060 => 0x60,
    0x0000007b => 0x7b,
    0x0000007c => 0x7c,
    0x0000007d => 0x7d,
    0x0000007f => 0x7f,
    0x000000a4 => 0x24,
    0x00000391 => 0x41,
    0x00000392 => 0x42,
    0x00000393 => 0x43,
    0x00000394 => 0x44,
    0x00000395 => 0x45,
    0x00000396 => 0x46,
    0x00000397 => 0x47,
    0x00000398 => 0x48,
    0x00000399 => 0x49,
    0x0000039a => 0x4b,
    0x0000039b => 0x4c,
    0x0000039c => 0x4d,
    0x0000039d => 0x4e,
    0x0000039e => 0x4f,
    0x0000039f => 0x50,
    0x000003a0 => 0x51,
    0x000003a1 => 0x52,
    0x000003a3 => 0x53,
    0x000003a4 => 0x54,
    0x000003a5 => 0x55,
    0x000003a6 => 0x56,
    0x000003a7 => 0x58,
    0x000003a8 => 0x59,
    0x000003a9 => 0x5a,
    0x000003b1 => 0x61,
    0x000003b2 => 0x62,
    0x000003b3 => 0x63,
    0x000003b4 => 0x64,
    0x000003b5 => 0x65,
    0x000003b6 => 0x66,
    0x000003b7 => 0x67,
    0x000003b8 => 0x68,
    0x000003b9 => 0x69,
    0x000003ba => 0x6b,
    0x000003bb => 0x6c,
    0x000003bc => 0x6d,
    0x000003bd => 0x6e,
    0x000003be => 0x6f,
    0x000003bf => 0x70,
    0x000003c0 => 0x71,
    0x000003c1 => 0x72,
    0x000003c2 => 0x77,
    0x000003c3 => 0x73,
    0x000003c4 => 0x74,
    0x000003c5 => 0x75,
    0x000003c6 => 0x76,
    0x000003c7 => 0x78,
    0x000003c8 => 0x79,
    0x000003c9 => 0x7a,
    0x0000203e => 0x7e,
};

sub _recode
{
    my $unknown = FROM_UCS4->{$_[0]->{_unknown}};
    $unknown = defined $unknown ? (chr $unknown) : '';

    if ($_[0]->{_from} eq 'INTERNAL') {
	$_[1] = join '', map {
	    my $code = FROM_UCS4->{$_};
	    defined $code ? (chr $code) : $unknown;
	    } @{$_[1]};
    } elsif ($_[0]->{_to} =~ m,^UTF-8/+,) {
	return $_[0]->__toUTF8 ($_[1]);
    } else {
	$_[1] = [ map { 
	    defined TO_UCS4->[$_] ?
		TO_UCS4->[$_] : $_[0]->{_unknown} 
	} unpack 'C*', $_[1] ];
    }

    return 1;
}

sub __toUTF8
{
    $_[1] = join '', map { TO_UTF8->[$_] } unpack 'C*', $_[1];
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
 alias ISO-IR-88

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
    21 |  00000021 | EXCLAMATION MARK
    22 |  00000022 | QUOTATION MARK
    23 |  00000023 | NUMBER SIGN
    24 |  000000A4 | CURRENCY SIGN
    25 |  00000025 | PERCENT SIGN
    26 |  00000026 | AMPERSAND
    27 |  00000027 | APOSTROPHE
    28 |  00000028 | LEFT PARENTHESIS
    29 |  00000029 | RIGHT PARENTHESIS
    2A |  0000002A | ASTERISK
    2B |  0000002B | PLUS SIGN
    2C |  0000002C | COMMA
    2D |  0000002D | HYPHEN-MINUS
    2E |  0000002E | FULL STOP
    2F |  0000002F | SOLIDUS
    30 |  00000030 | DIGIT ZERO
    31 |  00000031 | DIGIT ONE
    32 |  00000032 | DIGIT TWO
    33 |  00000033 | DIGIT THREE
    34 |  00000034 | DIGIT FOUR
    35 |  00000035 | DIGIT FIVE
    36 |  00000036 | DIGIT SIX
    37 |  00000037 | DIGIT SEVEN
    38 |  00000038 | DIGIT EIGHT
    39 |  00000039 | DIGIT NINE
    3A |  0000003A | COLON
    3B |  0000003B | SEMICOLON
    3C |  0000003C | LESS-THAN SIGN
    3D |  0000003D | EQUALS SIGN
    3E |  0000003E | GREATER-THAN SIGN
    3F |  0000003F | QUESTION MARK
    40 |  00000040 | COMMERCIAL AT
    41 |  00000391 | GREEK CAPITAL LETTER ALPHA
    42 |  00000392 | GREEK CAPITAL LETTER BETA
    43 |  00000393 | GREEK CAPITAL LETTER GAMMA
    44 |  00000394 | GREEK CAPITAL LETTER DELTA
    45 |  00000395 | GREEK CAPITAL LETTER EPSILON
    46 |  00000396 | GREEK CAPITAL LETTER ZETA
    47 |  00000397 | GREEK CAPITAL LETTER ETA
    48 |  00000398 | GREEK CAPITAL LETTER THETA
    49 |  00000399 | GREEK CAPITAL LETTER IOTA
    4B |  0000039A | GREEK CAPITAL LETTER KAPPA
    4C |  0000039B | GREEK CAPITAL LETTER LAMDA
    4D |  0000039C | GREEK CAPITAL LETTER MU
    4E |  0000039D | GREEK CAPITAL LETTER NU
    4F |  0000039E | GREEK CAPITAL LETTER XI
    50 |  0000039F | GREEK CAPITAL LETTER OMICRON
    51 |  000003A0 | GREEK CAPITAL LETTER PI
    52 |  000003A1 | GREEK CAPITAL LETTER RHO
    53 |  000003A3 | GREEK CAPITAL LETTER SIGMA
    54 |  000003A4 | GREEK CAPITAL LETTER TAU
    55 |  000003A5 | GREEK CAPITAL LETTER UPSILON
    56 |  000003A6 | GREEK CAPITAL LETTER PHI
    58 |  000003A7 | GREEK CAPITAL LETTER CHI
    59 |  000003A8 | GREEK CAPITAL LETTER PSI
    5A |  000003A9 | GREEK CAPITAL LETTER OMEGA
    5B |  0000005B | LEFT SQUARE BRACKET
    5C |  0000005C | REVERSE SOLIDUS
    5D |  0000005D | RIGHT SQUARE BRACKET
    5E |  0000005E | CIRCUMFLEX ACCENT
    5F |  0000005F | LOW LINE
    60 |  00000060 | GRAVE ACCENT
    61 |  000003B1 | GREEK SMALL LETTER ALPHA
    62 |  000003B2 | GREEK SMALL LETTER BETA
    63 |  000003B3 | GREEK SMALL LETTER GAMMA
    64 |  000003B4 | GREEK SMALL LETTER DELTA
    65 |  000003B5 | GREEK SMALL LETTER EPSILON
    66 |  000003B6 | GREEK SMALL LETTER ZETA
    67 |  000003B7 | GREEK SMALL LETTER ETA
    68 |  000003B8 | GREEK SMALL LETTER THETA
    69 |  000003B9 | GREEK SMALL LETTER IOTA
    6B |  000003BA | GREEK SMALL LETTER KAPPA
    6C |  000003BB | GREEK SMALL LETTER LAMDA
    6D |  000003BC | GREEK SMALL LETTER MU
    6E |  000003BD | GREEK SMALL LETTER NU
    6F |  000003BE | GREEK SMALL LETTER XI
    70 |  000003BF | GREEK SMALL LETTER OMICRON
    71 |  000003C0 | GREEK SMALL LETTER PI
    72 |  000003C1 | GREEK SMALL LETTER RHO
    73 |  000003C3 | GREEK SMALL LETTER SIGMA
    74 |  000003C4 | GREEK SMALL LETTER TAU
    75 |  000003C5 | GREEK SMALL LETTER UPSILON
    76 |  000003C6 | GREEK SMALL LETTER PHI
    77 |  000003C2 | GREEK SMALL LETTER FINAL SIGMA
    78 |  000003C7 | GREEK SMALL LETTER CHI
    79 |  000003C8 | GREEK SMALL LETTER PSI
    7A |  000003C9 | GREEK SMALL LETTER OMEGA
    7B |  0000007B | LEFT CURLY BRACKET
    7C |  0000007C | VERTICAL LINE
    7D |  0000007D | RIGHT CURLY BRACKET
    7E |  0000203E | OVERLINE
    7F |  0000007F | DELETE (DEL)


=head1 AUTHOR

Copyright (C) 2002, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(http://www.imperia.net/).

=head1 SEE ALSO

Locale::IconvData(3), Locale::Iconv(3), perl(1)

