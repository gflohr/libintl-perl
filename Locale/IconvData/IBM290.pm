#! /bin/false
# -*- perl -*-
# $Id: IBM290.pm,v 1.1 2002/07/08 19:19:59 guido Exp $

# Conversion routines for IBM290.
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

package Locale::IconvData::IBM290;

use base Locale::IconvData;

use strict;

use constant TO_UCS4 => [
    0x00000000,
    0x00000001,
    0x00000002,
    0x00000003,
    0x0000009c,
    0x00000009,
    0x00000086,
    0x0000007f,
    0x00000097,
    0x0000008d,
    0x0000008e,
    0x0000000b,
    0x0000000c,
    0x0000000d,
    0x0000000e,
    0x0000000f,
    0x00000010,
    0x00000011,
    0x00000012,
    0x00000013,
    0x0000009d,
    0x00000085,
    0x00000008,
    0x00000087,
    0x00000018,
    0x00000019,
    0x00000092,
    0x0000008f,
    0x0000001c,
    0x0000001d,
    0x0000001e,
    0x0000001f,
    0x00000080,
    0x00000081,
    0x00000082,
    0x00000083,
    0x00000084,
    0x0000000a,
    0x00000017,
    0x0000001b,
    0x00000088,
    0x00000089,
    0x0000008a,
    0x0000008b,
    0x0000008c,
    0x00000005,
    0x00000006,
    0x00000007,
    0x00000090,
    0x00000091,
    0x00000016,
    0x00000093,
    0x00000094,
    0x00000095,
    0x00000096,
    0x00000004,
    0x00000098,
    0x00000099,
    0x0000009a,
    0x0000009b,
    0x00000014,
    0x00000015,
    0x0000009e,
    0x0000001a,
    0x00000020,
    0x00003002,
    0x0000300c,
    0x0000300d,
    0x00003001,
    0x000030fb,
    0x000030f2,
    0x000030a1,
    0x000030a3,
    0x000030a5,
    0x000000a3,
    0x0000002e,
    0x0000003c,
    0x00000028,
    0x0000002b,
    0x0000007c,
    0x00000026,
    0x000030a7,
    0x000030a9,
    0x000030e3,
    0x000030e5,
    0x000030e7,
    0x000030c3,
    undef,
    0x000030fc,
    undef,
    0x00000021,
    0x000000a5,
    0x0000002a,
    0x00000029,
    0x0000003b,
    0x000000ac,
    0x0000002d,
    0x0000002f,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x000000a6,
    0x0000002c,
    0x00000025,
    0x0000005f,
    0x0000003e,
    0x0000003f,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x00000060,
    0x0000003a,
    0x00000023,
    0x00000040,
    0x00000027,
    0x0000003d,
    0x00000022,
    undef,
    0x000030a2,
    0x000030a4,
    0x000030a6,
    0x000030a8,
    0x000030aa,
    0x000030ab,
    0x000030ad,
    0x000030af,
    0x000030b1,
    0x000030b3,
    undef,
    0x000030b5,
    0x000030b7,
    0x000030b9,
    0x000030bb,
    0x000030bd,
    0x000030bf,
    0x000030c1,
    0x000030c4,
    0x000030c6,
    0x000030c8,
    0x000030ca,
    0x000030cb,
    0x000030cc,
    0x000030cd,
    0x000030ce,
    undef,
    undef,
    0x000030cf,
    0x000030d2,
    0x000030d5,
    undef,
    0x0000203e,
    0x000030d8,
    0x000030db,
    0x000030de,
    0x000030df,
    0x000030e0,
    0x000030e1,
    0x000030e2,
    0x000030e4,
    0x000030e6,
    undef,
    0x000030e8,
    0x000030e9,
    0x000030ea,
    0x000030eb,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x000030ec,
    0x000030ed,
    0x000030ef,
    0x000030f3,
    0x0000309b,
    0x0000309c,
    undef,
    0x00000041,
    0x00000042,
    0x00000043,
    0x00000044,
    0x00000045,
    0x00000046,
    0x00000047,
    0x00000048,
    0x00000049,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x0000004a,
    0x0000004b,
    0x0000004c,
    0x0000004d,
    0x0000004e,
    0x0000004f,
    0x00000050,
    0x00000051,
    0x00000052,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x00000024,
    undef,
    0x00000053,
    0x00000054,
    0x00000055,
    0x00000056,
    0x00000057,
    0x00000058,
    0x00000059,
    0x0000005a,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
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
    undef,
    undef,
    undef,
    undef,
    undef,
    0x0000009f,
];

use constant TO_UTF8 => [
    "\x00",
    "\x01",
    "\x02",
    "\x03",
    "\xc2\x9c",
    "\x09",
    "\xc2\x86",
    "\x7f",
    "\xc2\x97",
    "\xc2\x8d",
    "\xc2\x8e",
    "\x0b",
    "\x0c",
    "\x0d",
    "\x0e",
    "\x0f",
    "\x10",
    "\x11",
    "\x12",
    "\x13",
    "\xc2\x9d",
    "\xc2\x85",
    "\x08",
    "\xc2\x87",
    "\x18",
    "\x19",
    "\xc2\x92",
    "\xc2\x8f",
    "\x1c",
    "\x1d",
    "\x1e",
    "\x1f",
    "\xc2\x80",
    "\xc2\x81",
    "\xc2\x82",
    "\xc2\x83",
    "\xc2\x84",
    "\x0a",
    "\x17",
    "\x1b",
    "\xc2\x88",
    "\xc2\x89",
    "\xc2\x8a",
    "\xc2\x8b",
    "\xc2\x8c",
    "\x05",
    "\x06",
    "\x07",
    "\xc2\x90",
    "\xc2\x91",
    "\x16",
    "\xc2\x93",
    "\xc2\x94",
    "\xc2\x95",
    "\xc2\x96",
    "\x04",
    "\xc2\x98",
    "\xc2\x99",
    "\xc2\x9a",
    "\xc2\x9b",
    "\x14",
    "\x15",
    "\xc2\x9e",
    "\x1a",
    "\x20",
    "\xe3\x80\x82",
    "\xe3\x80\x8c",
    "\xe3\x80\x8d",
    "\xe3\x80\x81",
    "\xe3\x83\xbb",
    "\xe3\x83\xb2",
    "\xe3\x82\xa1",
    "\xe3\x82\xa3",
    "\xe3\x82\xa5",
    "\xc2\xa3",
    "\x2e",
    "\x3c",
    "\x28",
    "\x2b",
    "\x7c",
    "\x26",
    "\xe3\x82\xa7",
    "\xe3\x82\xa9",
    "\xe3\x83\xa3",
    "\xe3\x83\xa5",
    "\xe3\x83\xa7",
    "\xe3\x83\x83",
    undef,
    "\xe3\x83\xbc",
    undef,
    "\x21",
    "\xc2\xa5",
    "\x2a",
    "\x29",
    "\x3b",
    "\xc2\xac",
    "\x2d",
    "\x2f",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\xc2\xa6",
    "\x2c",
    "\x25",
    "\x5f",
    "\x3e",
    "\x3f",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\x60",
    "\x3a",
    "\x23",
    "\x40",
    "\x27",
    "\x3d",
    "\x22",
    undef,
    "\xe3\x82\xa2",
    "\xe3\x82\xa4",
    "\xe3\x82\xa6",
    "\xe3\x82\xa8",
    "\xe3\x82\xaa",
    "\xe3\x82\xab",
    "\xe3\x82\xad",
    "\xe3\x82\xaf",
    "\xe3\x82\xb1",
    "\xe3\x82\xb3",
    undef,
    "\xe3\x82\xb5",
    "\xe3\x82\xb7",
    "\xe3\x82\xb9",
    "\xe3\x82\xbb",
    "\xe3\x82\xbd",
    "\xe3\x82\xbf",
    "\xe3\x83\x81",
    "\xe3\x83\x84",
    "\xe3\x83\x86",
    "\xe3\x83\x88",
    "\xe3\x83\x8a",
    "\xe3\x83\x8b",
    "\xe3\x83\x8c",
    "\xe3\x83\x8d",
    "\xe3\x83\x8e",
    undef,
    undef,
    "\xe3\x83\x8f",
    "\xe3\x83\x92",
    "\xe3\x83\x95",
    undef,
    "\xe2\x80\xbe",
    "\xe3\x83\x98",
    "\xe3\x83\x9b",
    "\xe3\x83\x9e",
    "\xe3\x83\x9f",
    "\xe3\x83\xa0",
    "\xe3\x83\xa1",
    "\xe3\x83\xa2",
    "\xe3\x83\xa4",
    "\xe3\x83\xa6",
    undef,
    "\xe3\x83\xa8",
    "\xe3\x83\xa9",
    "\xe3\x83\xaa",
    "\xe3\x83\xab",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\xe3\x83\xac",
    "\xe3\x83\xad",
    "\xe3\x83\xaf",
    "\xe3\x83\xb3",
    "\xe3\x82\x9b",
    "\xe3\x82\x9c",
    undef,
    "\x41",
    "\x42",
    "\x43",
    "\x44",
    "\x45",
    "\x46",
    "\x47",
    "\x48",
    "\x49",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\x4a",
    "\x4b",
    "\x4c",
    "\x4d",
    "\x4e",
    "\x4f",
    "\x50",
    "\x51",
    "\x52",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\x24",
    undef,
    "\x53",
    "\x54",
    "\x55",
    "\x56",
    "\x57",
    "\x58",
    "\x59",
    "\x5a",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
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
    undef,
    undef,
    undef,
    undef,
    undef,
    "\xc2\x9f",
];

use constant FROM_UCS4 => {
    0x00000000 => 0x00,
    0x00000001 => 0x01,
    0x00000002 => 0x02,
    0x00000003 => 0x03,
    0x00000004 => 0x37,
    0x00000005 => 0x2d,
    0x00000006 => 0x2e,
    0x00000007 => 0x2f,
    0x00000008 => 0x16,
    0x00000009 => 0x05,
    0x0000000a => 0x25,
    0x0000000b => 0x0b,
    0x0000000c => 0x0c,
    0x0000000d => 0x0d,
    0x0000000e => 0x0e,
    0x0000000f => 0x0f,
    0x00000010 => 0x10,
    0x00000011 => 0x11,
    0x00000012 => 0x12,
    0x00000013 => 0x13,
    0x00000014 => 0x3c,
    0x00000015 => 0x3d,
    0x00000016 => 0x32,
    0x00000017 => 0x26,
    0x00000018 => 0x18,
    0x00000019 => 0x19,
    0x0000001a => 0x3f,
    0x0000001b => 0x27,
    0x0000001c => 0x1c,
    0x0000001d => 0x1d,
    0x0000001e => 0x1e,
    0x0000001f => 0x1f,
    0x00000020 => 0x40,
    0x00000021 => 0x5a,
    0x00000022 => 0x7f,
    0x00000023 => 0x7b,
    0x00000024 => 0xe0,
    0x00000025 => 0x6c,
    0x00000026 => 0x50,
    0x00000027 => 0x7d,
    0x00000028 => 0x4d,
    0x00000029 => 0x5d,
    0x0000002a => 0x5c,
    0x0000002b => 0x4e,
    0x0000002c => 0x6b,
    0x0000002d => 0x60,
    0x0000002e => 0x4b,
    0x0000002f => 0x61,
    0x00000030 => 0xf0,
    0x00000031 => 0xf1,
    0x00000032 => 0xf2,
    0x00000033 => 0xf3,
    0x00000034 => 0xf4,
    0x00000035 => 0xf5,
    0x00000036 => 0xf6,
    0x00000037 => 0xf7,
    0x00000038 => 0xf8,
    0x00000039 => 0xf9,
    0x0000003a => 0x7a,
    0x0000003b => 0x5e,
    0x0000003c => 0x4c,
    0x0000003d => 0x7e,
    0x0000003e => 0x6e,
    0x0000003f => 0x6f,
    0x00000040 => 0x7c,
    0x00000041 => 0xc1,
    0x00000042 => 0xc2,
    0x00000043 => 0xc3,
    0x00000044 => 0xc4,
    0x00000045 => 0xc5,
    0x00000046 => 0xc6,
    0x00000047 => 0xc7,
    0x00000048 => 0xc8,
    0x00000049 => 0xc9,
    0x0000004a => 0xd1,
    0x0000004b => 0xd2,
    0x0000004c => 0xd3,
    0x0000004d => 0xd4,
    0x0000004e => 0xd5,
    0x0000004f => 0xd6,
    0x00000050 => 0xd7,
    0x00000051 => 0xd8,
    0x00000052 => 0xd9,
    0x00000053 => 0xe2,
    0x00000054 => 0xe3,
    0x00000055 => 0xe4,
    0x00000056 => 0xe5,
    0x00000057 => 0xe6,
    0x00000058 => 0xe7,
    0x00000059 => 0xe8,
    0x0000005a => 0xe9,
    0x0000005f => 0x6d,
    0x00000060 => 0x79,
    0x0000007c => 0x4f,
    0x0000007f => 0x07,
    0x00000080 => 0x20,
    0x00000081 => 0x21,
    0x00000082 => 0x22,
    0x00000083 => 0x23,
    0x00000084 => 0x24,
    0x00000085 => 0x15,
    0x00000086 => 0x06,
    0x00000087 => 0x17,
    0x00000088 => 0x28,
    0x00000089 => 0x29,
    0x0000008a => 0x2a,
    0x0000008b => 0x2b,
    0x0000008c => 0x2c,
    0x0000008d => 0x09,
    0x0000008e => 0x0a,
    0x0000008f => 0x1b,
    0x00000090 => 0x30,
    0x00000091 => 0x31,
    0x00000092 => 0x1a,
    0x00000093 => 0x33,
    0x00000094 => 0x34,
    0x00000095 => 0x35,
    0x00000096 => 0x36,
    0x00000097 => 0x08,
    0x00000098 => 0x38,
    0x00000099 => 0x39,
    0x0000009a => 0x3a,
    0x0000009b => 0x3b,
    0x0000009c => 0x04,
    0x0000009d => 0x14,
    0x0000009e => 0x3e,
    0x0000009f => 0xff,
    0x000000a3 => 0x4a,
    0x000000a5 => 0x5b,
    0x000000a6 => 0x6a,
    0x000000ac => 0x5f,
    0x0000203e => 0xa1,
    0x00003001 => 0x44,
    0x00003002 => 0x41,
    0x0000300c => 0x42,
    0x0000300d => 0x43,
    0x0000309b => 0xbe,
    0x0000309c => 0xbf,
    0x000030a1 => 0x47,
    0x000030a2 => 0x81,
    0x000030a3 => 0x48,
    0x000030a4 => 0x82,
    0x000030a5 => 0x49,
    0x000030a6 => 0x83,
    0x000030a7 => 0x51,
    0x000030a8 => 0x84,
    0x000030a9 => 0x52,
    0x000030aa => 0x85,
    0x000030ab => 0x86,
    0x000030ad => 0x87,
    0x000030af => 0x88,
    0x000030b1 => 0x89,
    0x000030b3 => 0x8a,
    0x000030b5 => 0x8c,
    0x000030b7 => 0x8d,
    0x000030b9 => 0x8e,
    0x000030bb => 0x8f,
    0x000030bd => 0x90,
    0x000030bf => 0x91,
    0x000030c1 => 0x92,
    0x000030c3 => 0x56,
    0x000030c4 => 0x93,
    0x000030c6 => 0x94,
    0x000030c8 => 0x95,
    0x000030ca => 0x96,
    0x000030cb => 0x97,
    0x000030cc => 0x98,
    0x000030cd => 0x99,
    0x000030ce => 0x9a,
    0x000030cf => 0x9d,
    0x000030d2 => 0x9e,
    0x000030d5 => 0x9f,
    0x000030d8 => 0xa2,
    0x000030db => 0xa3,
    0x000030de => 0xa4,
    0x000030df => 0xa5,
    0x000030e0 => 0xa6,
    0x000030e1 => 0xa7,
    0x000030e2 => 0xa8,
    0x000030e3 => 0x53,
    0x000030e4 => 0xa9,
    0x000030e5 => 0x54,
    0x000030e6 => 0xaa,
    0x000030e7 => 0x55,
    0x000030e8 => 0xac,
    0x000030e9 => 0xad,
    0x000030ea => 0xae,
    0x000030eb => 0xaf,
    0x000030ec => 0xba,
    0x000030ed => 0xbb,
    0x000030ef => 0xbc,
    0x000030f2 => 0x46,
    0x000030f3 => 0xbd,
    0x000030fb => 0x45,
    0x000030fc => 0x58,
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
  source: IBM 3174 Character Set Ref, GA27-3831-02, March 1990
 alias CP290
 alias EBCDIC-JP-KANA

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
    04 |  0000009C | STRING TERMINATOR (ST)
    05 |  00000009 | CHARACTER TABULATION (HT)
    06 |  00000086 | START OF SELECTED AREA (SSA)
    07 |  0000007F | DELETE (DEL)
    08 |  00000097 | END OF GUARDED AREA (EPA)
    09 |  0000008D | REVERSE LINE FEED (RI)
    0A |  0000008E | SINGLE-SHIFT TWO (SS2)
    0B |  0000000B | LINE TABULATION (VT)
    0C |  0000000C | FORM FEED (FF)
    0D |  0000000D | CARRIAGE RETURN (CR)
    0E |  0000000E | SHIFT OUT (SO)
    0F |  0000000F | SHIFT IN (SI)
    10 |  00000010 | DATALINK ESCAPE (DLE)
    11 |  00000011 | DEVICE CONTROL ONE (DC1)
    12 |  00000012 | DEVICE CONTROL TWO (DC2)
    13 |  00000013 | DEVICE CONTROL THREE (DC3)
    14 |  0000009D | OPERATING SYSTEM COMMAND (OSC)
    15 |  00000085 | NEXT LINE (NEL)
    16 |  00000008 | BACKSPACE (BS)
    17 |  00000087 | END OF SELECTED AREA (ESA)
    18 |  00000018 | CANCEL (CAN)
    19 |  00000019 | END OF MEDIUM (EM)
    1A |  00000092 | PRIVATE USE TWO (PU2)
    1B |  0000008F | SINGLE-SHIFT THREE (SS3)
    1C |  0000001C | FILE SEPARATOR (IS4)
    1D |  0000001D | GROUP SEPARATOR (IS3)
    1E |  0000001E | RECORD SEPARATOR (IS2)
    1F |  0000001F | UNIT SEPARATOR (IS1)
    20 |  00000080 | PADDING CHARACTER (PAD)
    21 |  00000081 | HIGH OCTET PRESET (HOP)
    22 |  00000082 | BREAK PERMITTED HERE (BPH)
    23 |  00000083 | NO BREAK HERE (NBH)
    24 |  00000084 | INDEX (IND)
    25 |  0000000A | LINE FEED (LF)
    26 |  00000017 | END OF TRANSMISSION BLOCK (ETB)
    27 |  0000001B | ESCAPE (ESC)
    28 |  00000088 | CHARACTER TABULATION SET (HTS)
    29 |  00000089 | CHARACTER TABULATION WITH JUSTIFICATION (HTJ)
    2A |  0000008A | LINE TABULATION SET (VTS)
    2B |  0000008B | PARTIAL LINE FORWARD (PLD)
    2C |  0000008C | PARTIAL LINE BACKWARD (PLU)
    2D |  00000005 | ENQUIRY (ENQ)
    2E |  00000006 | ACKNOWLEDGE (ACK)
    2F |  00000007 | BELL (BEL)
    30 |  00000090 | DEVICE CONTROL STRING (DCS)
    31 |  00000091 | PRIVATE USE ONE (PU1)
    32 |  00000016 | SYNCHRONOUS IDLE (SYN)
    33 |  00000093 | SET TRANSMIT STATE (STS)
    34 |  00000094 | CANCEL CHARACTER (CCH)
    35 |  00000095 | MESSAGE WAITING (MW)
    36 |  00000096 | START OF GUARDED AREA (SPA)
    37 |  00000004 | END OF TRANSMISSION (EOT)
    38 |  00000098 | START OF STRING (SOS)
    39 |  00000099 | SINGLE GRAPHIC CHARACTER INTRODUCER (SGCI)
    3A |  0000009A | SINGLE CHARACTER INTRODUCER (SCI)
    3B |  0000009B | CONTROL SEQUENCE INTRODUCER (CSI)
    3C |  00000014 | DEVICE CONTROL FOUR (DC4)
    3D |  00000015 | NEGATIVE ACKNOWLEDGE (NAK)
    3E |  0000009E | PRIVACY MESSAGE (PM)
    3F |  0000001A | SUBSTITUTE (SUB)
    40 |  00000020 | SPACE
    41 |  00003002 | IDEOGRAPHIC FULL STOP
    42 |  0000300C | LEFT CORNER BRACKET
    43 |  0000300D | RIGHT CORNER BRACKET
    44 |  00003001 | IDEOGRAPHIC COMMA
    45 |  000030FB | KATAKANA MIDDLE DOT
    46 |  000030F2 | KATAKANA LETTER WO
    47 |  000030A1 | KATAKANA LETTER SMALL A
    48 |  000030A3 | KATAKANA LETTER SMALL I
    49 |  000030A5 | KATAKANA LETTER SMALL U
    4A |  000000A3 | POUND SIGN
    4B |  0000002E | FULL STOP
    4C |  0000003C | LESS-THAN SIGN
    4D |  00000028 | LEFT PARENTHESIS
    4E |  0000002B | PLUS SIGN
    4F |  0000007C | VERTICAL LINE
    50 |  00000026 | AMPERSAND
    51 |  000030A7 | KATAKANA LETTER SMALL E
    52 |  000030A9 | KATAKANA LETTER SMALL O
    53 |  000030E3 | KATAKANA LETTER SMALL YA
    54 |  000030E5 | KATAKANA LETTER SMALL YU
    55 |  000030E7 | KATAKANA LETTER SMALL YO
    56 |  000030C3 | KATAKANA LETTER SMALL TU
    58 |  000030FC | KATAKANA-HIRAGANA PROLONGED SOUND MARK
    5A |  00000021 | EXCLAMATION MARK
    5B |  000000A5 | YEN SIGN
    5C |  0000002A | ASTERISK
    5D |  00000029 | RIGHT PARENTHESIS
    5E |  0000003B | SEMICOLON
    5F |  000000AC | NOT SIGN
    60 |  0000002D | HYPHEN-MINUS
    61 |  0000002F | SOLIDUS
    6A |  000000A6 | BROKEN BAR
    6B |  0000002C | COMMA
    6C |  00000025 | PERCENT SIGN
    6D |  0000005F | LOW LINE
    6E |  0000003E | GREATER-THAN SIGN
    6F |  0000003F | QUESTION MARK
    79 |  00000060 | GRAVE ACCENT
    7A |  0000003A | COLON
    7B |  00000023 | NUMBER SIGN
    7C |  00000040 | COMMERCIAL AT
    7D |  00000027 | APOSTROPHE
    7E |  0000003D | EQUALS SIGN
    7F |  00000022 | QUOTATION MARK
    81 |  000030A2 | KATAKANA LETTER A
    82 |  000030A4 | KATAKANA LETTER I
    83 |  000030A6 | KATAKANA LETTER U
    84 |  000030A8 | KATAKANA LETTER E
    85 |  000030AA | KATAKANA LETTER O
    86 |  000030AB | KATAKANA LETTER KA
    87 |  000030AD | KATAKANA LETTER KI
    88 |  000030AF | KATAKANA LETTER KU
    89 |  000030B1 | KATAKANA LETTER KE
    8A |  000030B3 | KATAKANA LETTER KO
    8C |  000030B5 | KATAKANA LETTER SA
    8D |  000030B7 | KATAKANA LETTER SI
    8E |  000030B9 | KATAKANA LETTER SU
    8F |  000030BB | KATAKANA LETTER SE
    90 |  000030BD | KATAKANA LETTER SO
    91 |  000030BF | KATAKANA LETTER TA
    92 |  000030C1 | KATAKANA LETTER TI
    93 |  000030C4 | KATAKANA LETTER TU
    94 |  000030C6 | KATAKANA LETTER TE
    95 |  000030C8 | KATAKANA LETTER TO
    96 |  000030CA | KATAKANA LETTER NA
    97 |  000030CB | KATAKANA LETTER NI
    98 |  000030CC | KATAKANA LETTER NU
    99 |  000030CD | KATAKANA LETTER NE
    9A |  000030CE | KATAKANA LETTER NO
    9D |  000030CF | KATAKANA LETTER HA
    9E |  000030D2 | KATAKANA LETTER HI
    9F |  000030D5 | KATAKANA LETTER HU
    A1 |  0000203E | OVERLINE
    A2 |  000030D8 | KATAKANA LETTER HE
    A3 |  000030DB | KATAKANA LETTER HO
    A4 |  000030DE | KATAKANA LETTER MA
    A5 |  000030DF | KATAKANA LETTER MI
    A6 |  000030E0 | KATAKANA LETTER MU
    A7 |  000030E1 | KATAKANA LETTER ME
    A8 |  000030E2 | KATAKANA LETTER MO
    A9 |  000030E4 | KATAKANA LETTER YA
    AA |  000030E6 | KATAKANA LETTER YU
    AC |  000030E8 | KATAKANA LETTER YO
    AD |  000030E9 | KATAKANA LETTER RA
    AE |  000030EA | KATAKANA LETTER RI
    AF |  000030EB | KATAKANA LETTER RU
    BA |  000030EC | KATAKANA LETTER RE
    BB |  000030ED | KATAKANA LETTER RO
    BC |  000030EF | KATAKANA LETTER WA
    BD |  000030F3 | KATAKANA LETTER N
    BE |  0000309B | KATAKANA-HIRAGANA VOICED SOUND MARK
    BF |  0000309C | KATAKANA-HIRAGANA SEMI-VOICED SOUND MARK
    C1 |  00000041 | LATIN CAPITAL LETTER A
    C2 |  00000042 | LATIN CAPITAL LETTER B
    C3 |  00000043 | LATIN CAPITAL LETTER C
    C4 |  00000044 | LATIN CAPITAL LETTER D
    C5 |  00000045 | LATIN CAPITAL LETTER E
    C6 |  00000046 | LATIN CAPITAL LETTER F
    C7 |  00000047 | LATIN CAPITAL LETTER G
    C8 |  00000048 | LATIN CAPITAL LETTER H
    C9 |  00000049 | LATIN CAPITAL LETTER I
    D1 |  0000004A | LATIN CAPITAL LETTER J
    D2 |  0000004B | LATIN CAPITAL LETTER K
    D3 |  0000004C | LATIN CAPITAL LETTER L
    D4 |  0000004D | LATIN CAPITAL LETTER M
    D5 |  0000004E | LATIN CAPITAL LETTER N
    D6 |  0000004F | LATIN CAPITAL LETTER O
    D7 |  00000050 | LATIN CAPITAL LETTER P
    D8 |  00000051 | LATIN CAPITAL LETTER Q
    D9 |  00000052 | LATIN CAPITAL LETTER R
    E0 |  00000024 | DOLLAR SIGN
    E2 |  00000053 | LATIN CAPITAL LETTER S
    E3 |  00000054 | LATIN CAPITAL LETTER T
    E4 |  00000055 | LATIN CAPITAL LETTER U
    E5 |  00000056 | LATIN CAPITAL LETTER V
    E6 |  00000057 | LATIN CAPITAL LETTER W
    E7 |  00000058 | LATIN CAPITAL LETTER X
    E8 |  00000059 | LATIN CAPITAL LETTER Y
    E9 |  0000005A | LATIN CAPITAL LETTER Z
    F0 |  00000030 | DIGIT ZERO
    F1 |  00000031 | DIGIT ONE
    F2 |  00000032 | DIGIT TWO
    F3 |  00000033 | DIGIT THREE
    F4 |  00000034 | DIGIT FOUR
    F5 |  00000035 | DIGIT FIVE
    F6 |  00000036 | DIGIT SIX
    F7 |  00000037 | DIGIT SEVEN
    F8 |  00000038 | DIGIT EIGHT
    F9 |  00000039 | DIGIT NINE
    FF |  0000009F | APPLICATION PROGRAM COMMAND (APC)


=head1 AUTHOR

Copyright (C) 2002, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(http://www.imperia.net/).

=head1 SEE ALSO

Locale::IconvData(3), Locale::Iconv(3), perl(1)

