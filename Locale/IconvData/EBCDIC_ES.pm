#! /bin/false
# -*- perl -*-
# $Id: EBCDIC_ES.pm,v 1.1 2002/07/08 19:19:59 guido Exp $

# Conversion routines for EBCDIC-ES.
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

package Locale::IconvData::EBCDIC_ES;

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
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x000000a2,
    0x0000002e,
    0x0000003c,
    0x00000028,
    0x0000002b,
    0x0000007c,
    0x00000026,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x00000021,
    0x000020a7,
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
    0x000000f1,
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
    0x000000d1,
    0x00000040,
    0x00000027,
    0x0000003d,
    0x00000022,
    undef,
    0x00000061,
    0x00000062,
    0x00000063,
    0x00000064,
    0x00000065,
    0x00000066,
    0x00000067,
    0x00000068,
    0x00000069,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x0000006a,
    0x0000006b,
    0x0000006c,
    0x0000006d,
    0x0000006e,
    0x0000006f,
    0x00000070,
    0x00000071,
    0x00000072,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x000000a8,
    0x00000073,
    0x00000074,
    0x00000075,
    0x00000076,
    0x00000077,
    0x00000078,
    0x00000079,
    0x0000007a,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x0000007b,
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
    0x0000007d,
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
    0x0000005c,
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
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\xc2\xa2",
    "\x2e",
    "\x3c",
    "\x28",
    "\x2b",
    "\x7c",
    "\x26",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\x21",
    "\xe2\x82\xa7",
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
    "\xc3\xb1",
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
    "\xc3\x91",
    "\x40",
    "\x27",
    "\x3d",
    "\x22",
    undef,
    "\x61",
    "\x62",
    "\x63",
    "\x64",
    "\x65",
    "\x66",
    "\x67",
    "\x68",
    "\x69",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\x6a",
    "\x6b",
    "\x6c",
    "\x6d",
    "\x6e",
    "\x6f",
    "\x70",
    "\x71",
    "\x72",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\xc2\xa8",
    "\x73",
    "\x74",
    "\x75",
    "\x76",
    "\x77",
    "\x78",
    "\x79",
    "\x7a",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\x7b",
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
    "\x7d",
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
    "\x5c",
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
    0x0000005c => 0xe0,
    0x0000005f => 0x6d,
    0x00000060 => 0x79,
    0x00000061 => 0x81,
    0x00000062 => 0x82,
    0x00000063 => 0x83,
    0x00000064 => 0x84,
    0x00000065 => 0x85,
    0x00000066 => 0x86,
    0x00000067 => 0x87,
    0x00000068 => 0x88,
    0x00000069 => 0x89,
    0x0000006a => 0x91,
    0x0000006b => 0x92,
    0x0000006c => 0x93,
    0x0000006d => 0x94,
    0x0000006e => 0x95,
    0x0000006f => 0x96,
    0x00000070 => 0x97,
    0x00000071 => 0x98,
    0x00000072 => 0x99,
    0x00000073 => 0xa2,
    0x00000074 => 0xa3,
    0x00000075 => 0xa4,
    0x00000076 => 0xa5,
    0x00000077 => 0xa6,
    0x00000078 => 0xa7,
    0x00000079 => 0xa8,
    0x0000007a => 0xa9,
    0x0000007b => 0xc0,
    0x0000007c => 0x4f,
    0x0000007d => 0xd0,
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
    0x000000a2 => 0x4a,
    0x000000a8 => 0xa1,
    0x000000ac => 0x5f,
    0x000000d1 => 0x7b,
    0x000000f1 => 0x6a,
    0x000020a7 => 0x5b,
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
  source: IBM 3270 Char Set Ref Ch 10, GA27-2837-9, April 1987

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
    4A |  000000A2 | CENT SIGN
    4B |  0000002E | FULL STOP
    4C |  0000003C | LESS-THAN SIGN
    4D |  00000028 | LEFT PARENTHESIS
    4E |  0000002B | PLUS SIGN
    4F |  0000007C | VERTICAL LINE
    50 |  00000026 | AMPERSAND
    5A |  00000021 | EXCLAMATION MARK
    5B |  000020A7 | PESETA SIGN
    5C |  0000002A | ASTERISK
    5D |  00000029 | RIGHT PARENTHESIS
    5E |  0000003B | SEMICOLON
    5F |  000000AC | NOT SIGN
    60 |  0000002D | HYPHEN-MINUS
    61 |  0000002F | SOLIDUS
    6A |  000000F1 | LATIN SMALL LETTER N WITH TILDE
    6B |  0000002C | COMMA
    6C |  00000025 | PERCENT SIGN
    6D |  0000005F | LOW LINE
    6E |  0000003E | GREATER-THAN SIGN
    6F |  0000003F | QUESTION MARK
    79 |  00000060 | GRAVE ACCENT
    7A |  0000003A | COLON
    7B |  000000D1 | LATIN CAPITAL LETTER N WITH TILDE
    7C |  00000040 | COMMERCIAL AT
    7D |  00000027 | APOSTROPHE
    7E |  0000003D | EQUALS SIGN
    7F |  00000022 | QUOTATION MARK
    81 |  00000061 | LATIN SMALL LETTER A
    82 |  00000062 | LATIN SMALL LETTER B
    83 |  00000063 | LATIN SMALL LETTER C
    84 |  00000064 | LATIN SMALL LETTER D
    85 |  00000065 | LATIN SMALL LETTER E
    86 |  00000066 | LATIN SMALL LETTER F
    87 |  00000067 | LATIN SMALL LETTER G
    88 |  00000068 | LATIN SMALL LETTER H
    89 |  00000069 | LATIN SMALL LETTER I
    91 |  0000006A | LATIN SMALL LETTER J
    92 |  0000006B | LATIN SMALL LETTER K
    93 |  0000006C | LATIN SMALL LETTER L
    94 |  0000006D | LATIN SMALL LETTER M
    95 |  0000006E | LATIN SMALL LETTER N
    96 |  0000006F | LATIN SMALL LETTER O
    97 |  00000070 | LATIN SMALL LETTER P
    98 |  00000071 | LATIN SMALL LETTER Q
    99 |  00000072 | LATIN SMALL LETTER R
    A1 |  000000A8 | DIAERESIS
    A2 |  00000073 | LATIN SMALL LETTER S
    A3 |  00000074 | LATIN SMALL LETTER T
    A4 |  00000075 | LATIN SMALL LETTER U
    A5 |  00000076 | LATIN SMALL LETTER V
    A6 |  00000077 | LATIN SMALL LETTER W
    A7 |  00000078 | LATIN SMALL LETTER X
    A8 |  00000079 | LATIN SMALL LETTER Y
    A9 |  0000007A | LATIN SMALL LETTER Z
    C0 |  0000007B | LEFT CURLY BRACKET
    C1 |  00000041 | LATIN CAPITAL LETTER A
    C2 |  00000042 | LATIN CAPITAL LETTER B
    C3 |  00000043 | LATIN CAPITAL LETTER C
    C4 |  00000044 | LATIN CAPITAL LETTER D
    C5 |  00000045 | LATIN CAPITAL LETTER E
    C6 |  00000046 | LATIN CAPITAL LETTER F
    C7 |  00000047 | LATIN CAPITAL LETTER G
    C8 |  00000048 | LATIN CAPITAL LETTER H
    C9 |  00000049 | LATIN CAPITAL LETTER I
    D0 |  0000007D | RIGHT CURLY BRACKET
    D1 |  0000004A | LATIN CAPITAL LETTER J
    D2 |  0000004B | LATIN CAPITAL LETTER K
    D3 |  0000004C | LATIN CAPITAL LETTER L
    D4 |  0000004D | LATIN CAPITAL LETTER M
    D5 |  0000004E | LATIN CAPITAL LETTER N
    D6 |  0000004F | LATIN CAPITAL LETTER O
    D7 |  00000050 | LATIN CAPITAL LETTER P
    D8 |  00000051 | LATIN CAPITAL LETTER Q
    D9 |  00000052 | LATIN CAPITAL LETTER R
    E0 |  0000005C | REVERSE SOLIDUS
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

