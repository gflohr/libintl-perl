#! /bin/false
# -*- perl -*-
# $Id: IBM905.pm,v 1.1 2002/07/08 19:19:59 guido Exp $

# Conversion routines for IBM905.
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

package Locale::IconvData::IBM905;

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
    0x000000e2,
    0x000000e4,
    0x000000e0,
    0x000000e1,
    undef,
    0x0000010b,
    0x0000007b,
    0x000000f1,
    0x000000c7,
    0x0000002e,
    0x0000003c,
    0x00000028,
    0x0000002b,
    0x00000021,
    0x00000026,
    0x000000e9,
    0x000000ea,
    0x000000eb,
    0x000000e8,
    0x000000ed,
    0x000000ee,
    0x000000ef,
    0x000000ec,
    0x000000df,
    0x0000011e,
    0x00000130,
    0x0000002a,
    0x00000029,
    0x0000003b,
    0x0000005e,
    0x0000002d,
    0x0000002f,
    0x000000c2,
    0x000000c4,
    0x000000c0,
    0x000000c1,
    undef,
    0x0000010a,
    0x0000005b,
    0x000000d1,
    0x0000015f,
    0x0000002c,
    0x00000025,
    0x0000005f,
    0x0000003e,
    0x0000003f,
    undef,
    0x000000c9,
    0x000000ca,
    0x000000cb,
    0x000000c8,
    0x000000cd,
    0x000000ce,
    0x000000cf,
    0x000000cc,
    0x00000131,
    0x0000003a,
    0x000000d6,
    0x0000015e,
    0x00000027,
    0x0000003d,
    0x000000dc,
    0x000002d8,
    0x00000061,
    0x00000062,
    0x00000063,
    0x00000064,
    0x00000065,
    0x00000066,
    0x00000067,
    0x00000068,
    0x00000069,
    0x00000127,
    0x00000109,
    0x0000015d,
    0x0000016d,
    undef,
    0x0000007c,
    0x000000b0,
    0x0000006a,
    0x0000006b,
    0x0000006c,
    0x0000006d,
    0x0000006e,
    0x0000006f,
    0x00000070,
    0x00000071,
    0x00000072,
    0x00000125,
    0x0000011d,
    0x00000135,
    0x000002db,
    undef,
    0x000000a4,
    0x000000b5,
    0x000000f6,
    0x00000073,
    0x00000074,
    0x00000075,
    0x00000076,
    0x00000077,
    0x00000078,
    0x00000079,
    0x0000007a,
    0x00000126,
    0x00000108,
    0x0000015c,
    0x0000016c,
    undef,
    0x00000040,
    0x000000b7,
    0x000000a3,
    0x0000017c,
    0x0000007d,
    0x0000017b,
    0x000000a7,
    0x0000005d,
    undef,
    0x000000bd,
    0x00000024,
    0x00000124,
    0x0000011c,
    0x00000134,
    0x000000a8,
    0x000000b4,
    0x000000d7,
    0x000000e7,
    0x00000041,
    0x00000042,
    0x00000043,
    0x00000044,
    0x00000045,
    0x00000046,
    0x00000047,
    0x00000048,
    0x00000049,
    0x000000ad,
    0x000000f4,
    0x0000007e,
    0x000000f2,
    0x000000f3,
    0x00000121,
    0x0000011f,
    0x0000004a,
    0x0000004b,
    0x0000004c,
    0x0000004d,
    0x0000004e,
    0x0000004f,
    0x00000050,
    0x00000051,
    0x00000052,
    0x00000060,
    0x000000fb,
    0x0000005c,
    0x000000f9,
    0x000000fa,
    undef,
    0x000000fc,
    0x000000f7,
    0x00000053,
    0x00000054,
    0x00000055,
    0x00000056,
    0x00000057,
    0x00000058,
    0x00000059,
    0x0000005a,
    0x000000b2,
    0x000000d4,
    0x00000023,
    0x000000d2,
    0x000000d3,
    0x00000120,
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
    0x000000b3,
    0x000000db,
    0x00000022,
    0x000000d9,
    0x000000da,
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
    "\xc3\xa2",
    "\xc3\xa4",
    "\xc3\xa0",
    "\xc3\xa1",
    undef,
    "\xc4\x8b",
    "\x7b",
    "\xc3\xb1",
    "\xc3\x87",
    "\x2e",
    "\x3c",
    "\x28",
    "\x2b",
    "\x21",
    "\x26",
    "\xc3\xa9",
    "\xc3\xaa",
    "\xc3\xab",
    "\xc3\xa8",
    "\xc3\xad",
    "\xc3\xae",
    "\xc3\xaf",
    "\xc3\xac",
    "\xc3\x9f",
    "\xc4\x9e",
    "\xc4\xb0",
    "\x2a",
    "\x29",
    "\x3b",
    "\x5e",
    "\x2d",
    "\x2f",
    "\xc3\x82",
    "\xc3\x84",
    "\xc3\x80",
    "\xc3\x81",
    undef,
    "\xc4\x8a",
    "\x5b",
    "\xc3\x91",
    "\xc5\x9f",
    "\x2c",
    "\x25",
    "\x5f",
    "\x3e",
    "\x3f",
    undef,
    "\xc3\x89",
    "\xc3\x8a",
    "\xc3\x8b",
    "\xc3\x88",
    "\xc3\x8d",
    "\xc3\x8e",
    "\xc3\x8f",
    "\xc3\x8c",
    "\xc4\xb1",
    "\x3a",
    "\xc3\x96",
    "\xc5\x9e",
    "\x27",
    "\x3d",
    "\xc3\x9c",
    "\xcb\x98",
    "\x61",
    "\x62",
    "\x63",
    "\x64",
    "\x65",
    "\x66",
    "\x67",
    "\x68",
    "\x69",
    "\xc4\xa7",
    "\xc4\x89",
    "\xc5\x9d",
    "\xc5\xad",
    undef,
    "\x7c",
    "\xc2\xb0",
    "\x6a",
    "\x6b",
    "\x6c",
    "\x6d",
    "\x6e",
    "\x6f",
    "\x70",
    "\x71",
    "\x72",
    "\xc4\xa5",
    "\xc4\x9d",
    "\xc4\xb5",
    "\xcb\x9b",
    undef,
    "\xc2\xa4",
    "\xc2\xb5",
    "\xc3\xb6",
    "\x73",
    "\x74",
    "\x75",
    "\x76",
    "\x77",
    "\x78",
    "\x79",
    "\x7a",
    "\xc4\xa6",
    "\xc4\x88",
    "\xc5\x9c",
    "\xc5\xac",
    undef,
    "\x40",
    "\xc2\xb7",
    "\xc2\xa3",
    "\xc5\xbc",
    "\x7d",
    "\xc5\xbb",
    "\xc2\xa7",
    "\x5d",
    undef,
    "\xc2\xbd",
    "\x24",
    "\xc4\xa4",
    "\xc4\x9c",
    "\xc4\xb4",
    "\xc2\xa8",
    "\xc2\xb4",
    "\xc3\x97",
    "\xc3\xa7",
    "\x41",
    "\x42",
    "\x43",
    "\x44",
    "\x45",
    "\x46",
    "\x47",
    "\x48",
    "\x49",
    "\xc2\xad",
    "\xc3\xb4",
    "\x7e",
    "\xc3\xb2",
    "\xc3\xb3",
    "\xc4\xa1",
    "\xc4\x9f",
    "\x4a",
    "\x4b",
    "\x4c",
    "\x4d",
    "\x4e",
    "\x4f",
    "\x50",
    "\x51",
    "\x52",
    "\x60",
    "\xc3\xbb",
    "\x5c",
    "\xc3\xb9",
    "\xc3\xba",
    undef,
    "\xc3\xbc",
    "\xc3\xb7",
    "\x53",
    "\x54",
    "\x55",
    "\x56",
    "\x57",
    "\x58",
    "\x59",
    "\x5a",
    "\xc2\xb2",
    "\xc3\x94",
    "\x23",
    "\xc3\x92",
    "\xc3\x93",
    "\xc4\xa0",
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
    "\xc2\xb3",
    "\xc3\x9b",
    "\x22",
    "\xc3\x99",
    "\xc3\x9a",
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
    0x00000021 => 0x4f,
    0x00000022 => 0xfc,
    0x00000023 => 0xec,
    0x00000024 => 0xb9,
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
    0x00000040 => 0xaf,
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
    0x0000005b => 0x68,
    0x0000005c => 0xdc,
    0x0000005d => 0xb6,
    0x0000005e => 0x5f,
    0x0000005f => 0x6d,
    0x00000060 => 0xda,
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
    0x0000007b => 0x48,
    0x0000007c => 0x8f,
    0x0000007d => 0xb3,
    0x0000007e => 0xcc,
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
    0x000000a3 => 0xb1,
    0x000000a4 => 0x9f,
    0x000000a7 => 0xb5,
    0x000000a8 => 0xbd,
    0x000000ad => 0xca,
    0x000000b0 => 0x90,
    0x000000b2 => 0xea,
    0x000000b3 => 0xfa,
    0x000000b4 => 0xbe,
    0x000000b5 => 0xa0,
    0x000000b7 => 0xb0,
    0x000000bd => 0xb8,
    0x000000c0 => 0x64,
    0x000000c1 => 0x65,
    0x000000c2 => 0x62,
    0x000000c4 => 0x63,
    0x000000c7 => 0x4a,
    0x000000c8 => 0x74,
    0x000000c9 => 0x71,
    0x000000ca => 0x72,
    0x000000cb => 0x73,
    0x000000cc => 0x78,
    0x000000cd => 0x75,
    0x000000ce => 0x76,
    0x000000cf => 0x77,
    0x000000d1 => 0x69,
    0x000000d2 => 0xed,
    0x000000d3 => 0xee,
    0x000000d4 => 0xeb,
    0x000000d6 => 0x7b,
    0x000000d7 => 0xbf,
    0x000000d9 => 0xfd,
    0x000000da => 0xfe,
    0x000000db => 0xfb,
    0x000000dc => 0x7f,
    0x000000df => 0x59,
    0x000000e0 => 0x44,
    0x000000e1 => 0x45,
    0x000000e2 => 0x42,
    0x000000e4 => 0x43,
    0x000000e7 => 0xc0,
    0x000000e8 => 0x54,
    0x000000e9 => 0x51,
    0x000000ea => 0x52,
    0x000000eb => 0x53,
    0x000000ec => 0x58,
    0x000000ed => 0x55,
    0x000000ee => 0x56,
    0x000000ef => 0x57,
    0x000000f1 => 0x49,
    0x000000f2 => 0xcd,
    0x000000f3 => 0xce,
    0x000000f4 => 0xcb,
    0x000000f6 => 0xa1,
    0x000000f7 => 0xe1,
    0x000000f9 => 0xdd,
    0x000000fa => 0xde,
    0x000000fb => 0xdb,
    0x000000fc => 0xe0,
    0x00000108 => 0xab,
    0x00000109 => 0x8b,
    0x0000010a => 0x67,
    0x0000010b => 0x47,
    0x0000011c => 0xbb,
    0x0000011d => 0x9b,
    0x0000011e => 0x5a,
    0x0000011f => 0xd0,
    0x00000120 => 0xef,
    0x00000121 => 0xcf,
    0x00000124 => 0xba,
    0x00000125 => 0x9a,
    0x00000126 => 0xaa,
    0x00000127 => 0x8a,
    0x00000130 => 0x5b,
    0x00000131 => 0x79,
    0x00000134 => 0xbc,
    0x00000135 => 0x9c,
    0x0000015c => 0xac,
    0x0000015d => 0x8c,
    0x0000015e => 0x7c,
    0x0000015f => 0x6a,
    0x0000016c => 0xad,
    0x0000016d => 0x8d,
    0x0000017b => 0xb4,
    0x0000017c => 0xb2,
    0x000002d8 => 0x80,
    0x000002db => 0x9d,
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
 alias CP905
 alias EBCDIC-CP-TR

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
    42 |  000000E2 | LATIN SMALL LETTER A WITH CIRCUMFLEX
    43 |  000000E4 | LATIN SMALL LETTER A WITH DIAERESIS
    44 |  000000E0 | LATIN SMALL LETTER A WITH GRAVE
    45 |  000000E1 | LATIN SMALL LETTER A WITH ACUTE
    47 |  0000010B | LATIN SMALL LETTER C WITH DOT ABOVE
    48 |  0000007B | LEFT CURLY BRACKET
    49 |  000000F1 | LATIN SMALL LETTER N WITH TILDE
    4A |  000000C7 | LATIN CAPITAL LETTER C WITH CEDILLA
    4B |  0000002E | FULL STOP
    4C |  0000003C | LESS-THAN SIGN
    4D |  00000028 | LEFT PARENTHESIS
    4E |  0000002B | PLUS SIGN
    4F |  00000021 | EXCLAMATION MARK
    50 |  00000026 | AMPERSAND
    51 |  000000E9 | LATIN SMALL LETTER E WITH ACUTE
    52 |  000000EA | LATIN SMALL LETTER E WITH CIRCUMFLEX
    53 |  000000EB | LATIN SMALL LETTER E WITH DIAERESIS
    54 |  000000E8 | LATIN SMALL LETTER E WITH GRAVE
    55 |  000000ED | LATIN SMALL LETTER I WITH ACUTE
    56 |  000000EE | LATIN SMALL LETTER I WITH CIRCUMFLEX
    57 |  000000EF | LATIN SMALL LETTER I WITH DIAERESIS
    58 |  000000EC | LATIN SMALL LETTER I WITH GRAVE
    59 |  000000DF | LATIN SMALL LETTER SHARP S (German)
    5A |  0000011E | LATIN CAPITAL LETTER G WITH BREVE
    5B |  00000130 | LATIN CAPITAL LETTER I WITH DOT ABOVE
    5C |  0000002A | ASTERISK
    5D |  00000029 | RIGHT PARENTHESIS
    5E |  0000003B | SEMICOLON
    5F |  0000005E | CIRCUMFLEX ACCENT
    60 |  0000002D | HYPHEN-MINUS
    61 |  0000002F | SOLIDUS
    62 |  000000C2 | LATIN CAPITAL LETTER A WITH CIRCUMFLEX
    63 |  000000C4 | LATIN CAPITAL LETTER A WITH DIAERESIS
    64 |  000000C0 | LATIN CAPITAL LETTER A WITH GRAVE
    65 |  000000C1 | LATIN CAPITAL LETTER A WITH ACUTE
    67 |  0000010A | LATIN CAPITAL LETTER C WITH DOT ABOVE
    68 |  0000005B | LEFT SQUARE BRACKET
    69 |  000000D1 | LATIN CAPITAL LETTER N WITH TILDE
    6A |  0000015F | LATIN SMALL LETTER S WITH CEDILLA
    6B |  0000002C | COMMA
    6C |  00000025 | PERCENT SIGN
    6D |  0000005F | LOW LINE
    6E |  0000003E | GREATER-THAN SIGN
    6F |  0000003F | QUESTION MARK
    71 |  000000C9 | LATIN CAPITAL LETTER E WITH ACUTE
    72 |  000000CA | LATIN CAPITAL LETTER E WITH CIRCUMFLEX
    73 |  000000CB | LATIN CAPITAL LETTER E WITH DIAERESIS
    74 |  000000C8 | LATIN CAPITAL LETTER E WITH GRAVE
    75 |  000000CD | LATIN CAPITAL LETTER I WITH ACUTE
    76 |  000000CE | LATIN CAPITAL LETTER I WITH CIRCUMFLEX
    77 |  000000CF | LATIN CAPITAL LETTER I WITH DIAERESIS
    78 |  000000CC | LATIN CAPITAL LETTER I WITH GRAVE
    79 |  00000131 | LATIN SMALL LETTER DOTLESS I
    7A |  0000003A | COLON
    7B |  000000D6 | LATIN CAPITAL LETTER O WITH DIAERESIS
    7C |  0000015E | LATIN CAPITAL LETTER S WITH CEDILLA
    7D |  00000027 | APOSTROPHE
    7E |  0000003D | EQUALS SIGN
    7F |  000000DC | LATIN CAPITAL LETTER U WITH DIAERESIS
    80 |  000002D8 | BREVE
    81 |  00000061 | LATIN SMALL LETTER A
    82 |  00000062 | LATIN SMALL LETTER B
    83 |  00000063 | LATIN SMALL LETTER C
    84 |  00000064 | LATIN SMALL LETTER D
    85 |  00000065 | LATIN SMALL LETTER E
    86 |  00000066 | LATIN SMALL LETTER F
    87 |  00000067 | LATIN SMALL LETTER G
    88 |  00000068 | LATIN SMALL LETTER H
    89 |  00000069 | LATIN SMALL LETTER I
    8A |  00000127 | LATIN SMALL LETTER H WITH STROKE
    8B |  00000109 | LATIN SMALL LETTER C WITH CIRCUMFLEX
    8C |  0000015D | LATIN SMALL LETTER S WITH CIRCUMFLEX
    8D |  0000016D | LATIN SMALL LETTER U WITH BREVE
    8F |  0000007C | VERTICAL LINE
    90 |  000000B0 | DEGREE SIGN
    91 |  0000006A | LATIN SMALL LETTER J
    92 |  0000006B | LATIN SMALL LETTER K
    93 |  0000006C | LATIN SMALL LETTER L
    94 |  0000006D | LATIN SMALL LETTER M
    95 |  0000006E | LATIN SMALL LETTER N
    96 |  0000006F | LATIN SMALL LETTER O
    97 |  00000070 | LATIN SMALL LETTER P
    98 |  00000071 | LATIN SMALL LETTER Q
    99 |  00000072 | LATIN SMALL LETTER R
    9A |  00000125 | LATIN SMALL LETTER H WITH CIRCUMFLEX
    9B |  0000011D | LATIN SMALL LETTER G WITH CIRCUMFLEX
    9C |  00000135 | LATIN SMALL LETTER J WITH CIRCUMFLEX
    9D |  000002DB | OGONEK
    9F |  000000A4 | CURRENCY SIGN
    A0 |  000000B5 | MICRO SIGN
    A1 |  000000F6 | LATIN SMALL LETTER O WITH DIAERESIS
    A2 |  00000073 | LATIN SMALL LETTER S
    A3 |  00000074 | LATIN SMALL LETTER T
    A4 |  00000075 | LATIN SMALL LETTER U
    A5 |  00000076 | LATIN SMALL LETTER V
    A6 |  00000077 | LATIN SMALL LETTER W
    A7 |  00000078 | LATIN SMALL LETTER X
    A8 |  00000079 | LATIN SMALL LETTER Y
    A9 |  0000007A | LATIN SMALL LETTER Z
    AA |  00000126 | LATIN CAPITAL LETTER H WITH STROKE
    AB |  00000108 | LATIN CAPITAL LETTER C WITH CIRCUMFLEX
    AC |  0000015C | LATIN CAPITAL LETTER S WITH CIRCUMFLEX
    AD |  0000016C | LATIN CAPITAL LETTER U WITH BREVE
    AF |  00000040 | COMMERCIAL AT
    B0 |  000000B7 | MIDDLE DOT
    B1 |  000000A3 | POUND SIGN
    B2 |  0000017C | LATIN SMALL LETTER Z WITH DOT ABOVE
    B3 |  0000007D | RIGHT CURLY BRACKET
    B4 |  0000017B | LATIN CAPITAL LETTER Z WITH DOT ABOVE
    B5 |  000000A7 | SECTION SIGN
    B6 |  0000005D | RIGHT SQUARE BRACKET
    B8 |  000000BD | VULGAR FRACTION ONE HALF
    B9 |  00000024 | DOLLAR SIGN
    BA |  00000124 | LATIN CAPITAL LETTER H WITH CIRCUMFLEX
    BB |  0000011C | LATIN CAPITAL LETTER G WITH CIRCUMFLEX
    BC |  00000134 | LATIN CAPITAL LETTER J WITH CIRCUMFLEX
    BD |  000000A8 | DIAERESIS
    BE |  000000B4 | ACUTE ACCENT
    BF |  000000D7 | MULTIPLICATION SIGN
    C0 |  000000E7 | LATIN SMALL LETTER C WITH CEDILLA
    C1 |  00000041 | LATIN CAPITAL LETTER A
    C2 |  00000042 | LATIN CAPITAL LETTER B
    C3 |  00000043 | LATIN CAPITAL LETTER C
    C4 |  00000044 | LATIN CAPITAL LETTER D
    C5 |  00000045 | LATIN CAPITAL LETTER E
    C6 |  00000046 | LATIN CAPITAL LETTER F
    C7 |  00000047 | LATIN CAPITAL LETTER G
    C8 |  00000048 | LATIN CAPITAL LETTER H
    C9 |  00000049 | LATIN CAPITAL LETTER I
    CA |  000000AD | SOFT HYPHEN
    CB |  000000F4 | LATIN SMALL LETTER O WITH CIRCUMFLEX
    CC |  0000007E | TILDE
    CD |  000000F2 | LATIN SMALL LETTER O WITH GRAVE
    CE |  000000F3 | LATIN SMALL LETTER O WITH ACUTE
    CF |  00000121 | LATIN SMALL LETTER G WITH DOT ABOVE
    D0 |  0000011F | LATIN SMALL LETTER G WITH BREVE
    D1 |  0000004A | LATIN CAPITAL LETTER J
    D2 |  0000004B | LATIN CAPITAL LETTER K
    D3 |  0000004C | LATIN CAPITAL LETTER L
    D4 |  0000004D | LATIN CAPITAL LETTER M
    D5 |  0000004E | LATIN CAPITAL LETTER N
    D6 |  0000004F | LATIN CAPITAL LETTER O
    D7 |  00000050 | LATIN CAPITAL LETTER P
    D8 |  00000051 | LATIN CAPITAL LETTER Q
    D9 |  00000052 | LATIN CAPITAL LETTER R
    DA |  00000060 | GRAVE ACCENT
    DB |  000000FB | LATIN SMALL LETTER U WITH CIRCUMFLEX
    DC |  0000005C | REVERSE SOLIDUS
    DD |  000000F9 | LATIN SMALL LETTER U WITH GRAVE
    DE |  000000FA | LATIN SMALL LETTER U WITH ACUTE
    E0 |  000000FC | LATIN SMALL LETTER U WITH DIAERESIS
    E1 |  000000F7 | DIVISION SIGN
    E2 |  00000053 | LATIN CAPITAL LETTER S
    E3 |  00000054 | LATIN CAPITAL LETTER T
    E4 |  00000055 | LATIN CAPITAL LETTER U
    E5 |  00000056 | LATIN CAPITAL LETTER V
    E6 |  00000057 | LATIN CAPITAL LETTER W
    E7 |  00000058 | LATIN CAPITAL LETTER X
    E8 |  00000059 | LATIN CAPITAL LETTER Y
    E9 |  0000005A | LATIN CAPITAL LETTER Z
    EA |  000000B2 | SUPERSCRIPT TWO
    EB |  000000D4 | LATIN CAPITAL LETTER O WITH CIRCUMFLEX
    EC |  00000023 | NUMBER SIGN
    ED |  000000D2 | LATIN CAPITAL LETTER O WITH GRAVE
    EE |  000000D3 | LATIN CAPITAL LETTER O WITH ACUTE
    EF |  00000120 | LATIN CAPITAL LETTER G WITH DOT ABOVE
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
    FA |  000000B3 | SUPERSCRIPT THREE
    FB |  000000DB | LATIN CAPITAL LETTER U WITH CIRCUMFLEX
    FC |  00000022 | QUOTATION MARK
    FD |  000000D9 | LATIN CAPITAL LETTER U WITH GRAVE
    FE |  000000DA | LATIN CAPITAL LETTER U WITH ACUTE
    FF |  0000009F | APPLICATION PROGRAM COMMAND (APC)


=head1 AUTHOR

Copyright (C) 2002, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(http://www.imperia.net/).

=head1 SEE ALSO

Locale::IconvData(3), Locale::Iconv(3), perl(1)

