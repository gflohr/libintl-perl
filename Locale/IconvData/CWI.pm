#! /bin/false
# -*- perl -*-
# $Id: CWI.pm,v 1.1.1.1 2002/07/08 19:19:59 guido Exp $

# Conversion routines for CWI.
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

package Locale::IconvData::CWI;

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
    0x00000024,
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
    0x00000041,
    0x00000042,
    0x00000043,
    0x00000044,
    0x00000045,
    0x00000046,
    0x00000047,
    0x00000048,
    0x00000049,
    0x0000004a,
    0x0000004b,
    0x0000004c,
    0x0000004d,
    0x0000004e,
    0x0000004f,
    0x00000050,
    0x00000051,
    0x00000052,
    0x00000053,
    0x00000054,
    0x00000055,
    0x00000056,
    0x00000057,
    0x00000058,
    0x00000059,
    0x0000005a,
    0x0000005b,
    0x0000005c,
    0x0000005d,
    0x0000005e,
    0x0000005f,
    0x00000060,
    0x00000061,
    0x00000062,
    0x00000063,
    0x00000064,
    0x00000065,
    0x00000066,
    0x00000067,
    0x00000068,
    0x00000069,
    0x0000006a,
    0x0000006b,
    0x0000006c,
    0x0000006d,
    0x0000006e,
    0x0000006f,
    0x00000070,
    0x00000071,
    0x00000072,
    0x00000073,
    0x00000074,
    0x00000075,
    0x00000076,
    0x00000077,
    0x00000078,
    0x00000079,
    0x0000007a,
    0x0000007b,
    0x0000007c,
    0x0000007d,
    0x0000007e,
    0x0000007f,
    0x000000c7,
    0x000000fc,
    0x000000e9,
    0x000000e2,
    0x000000e4,
    0x000000e0,
    0x000000e5,
    0x000000e7,
    0x000000ea,
    0x000000eb,
    0x000000e8,
    0x000000ef,
    0x000000ee,
    0x000000cd,
    0x000000c4,
    0x000000c1,
    0x000000c9,
    0x000000e6,
    0x000000c6,
    0x00000151,
    0x000000f6,
    0x000000d3,
    0x00000171,
    0x000000da,
    0x00000170,
    0x000000d6,
    0x000000dc,
    0x000000a2,
    0x000000a3,
    0x000000a5,
    0x000020a7,
    0x0000e01f,
    0x000000e1,
    0x000000ed,
    0x000000f3,
    0x000000fa,
    0x000000f1,
    0x000000d1,
    0x000000aa,
    0x00000150,
    0x000000bf,
    0x00002310,
    0x000000ac,
    0x000000bd,
    0x000000bc,
    0x000000a1,
    0x000000ab,
    0x000000bb,
    0x00002591,
    0x00002592,
    0x00002593,
    0x00002502,
    0x00002524,
    0x00002561,
    0x00002562,
    0x00002556,
    0x00002555,
    0x00002563,
    0x00002551,
    0x00002557,
    0x0000255d,
    0x0000255c,
    0x0000255b,
    0x00002510,
    0x00002514,
    0x00002534,
    0x0000252c,
    0x0000251c,
    0x00002500,
    0x0000253c,
    0x0000255e,
    0x0000255f,
    0x0000255a,
    0x00002554,
    0x00002569,
    0x00002566,
    0x00002560,
    0x00002550,
    0x0000256c,
    0x00002567,
    0x00002568,
    0x00002564,
    0x00002565,
    0x00002559,
    0x00002558,
    0x00002552,
    0x00002553,
    0x0000256b,
    0x0000256a,
    0x00002518,
    0x0000250c,
    0x00002588,
    0x00002584,
    0x0000258c,
    0x00002590,
    0x00002580,
    0x000003b1,
    0x000003b2,
    0x00000393,
    0x000003c0,
    0x000003a3,
    0x000003c3,
    0x000003bc,
    0x000003c4,
    0x000003a6,
    0x00000398,
    0x000003a9,
    0x000003b4,
    0x0000221e,
    0x00002205,
    0x000003b5,
    0x00002229,
    0x00002261,
    0x000000b1,
    0x00002265,
    0x00002264,
    0x00002320,
    0x00002321,
    0x000000f7,
    0x00002248,
    0x00002218,
    0x000000b7,
    0x00002022,
    0x0000221a,
    0x0000207f,
    0x000000b2,
    0x000025a0,
    0x000000a0,
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
    "\x24",
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
    "\x41",
    "\x42",
    "\x43",
    "\x44",
    "\x45",
    "\x46",
    "\x47",
    "\x48",
    "\x49",
    "\x4a",
    "\x4b",
    "\x4c",
    "\x4d",
    "\x4e",
    "\x4f",
    "\x50",
    "\x51",
    "\x52",
    "\x53",
    "\x54",
    "\x55",
    "\x56",
    "\x57",
    "\x58",
    "\x59",
    "\x5a",
    "\x5b",
    "\x5c",
    "\x5d",
    "\x5e",
    "\x5f",
    "\x60",
    "\x61",
    "\x62",
    "\x63",
    "\x64",
    "\x65",
    "\x66",
    "\x67",
    "\x68",
    "\x69",
    "\x6a",
    "\x6b",
    "\x6c",
    "\x6d",
    "\x6e",
    "\x6f",
    "\x70",
    "\x71",
    "\x72",
    "\x73",
    "\x74",
    "\x75",
    "\x76",
    "\x77",
    "\x78",
    "\x79",
    "\x7a",
    "\x7b",
    "\x7c",
    "\x7d",
    "\x7e",
    "\x7f",
    "\xc3\x87",
    "\xc3\xbc",
    "\xc3\xa9",
    "\xc3\xa2",
    "\xc3\xa4",
    "\xc3\xa0",
    "\xc3\xa5",
    "\xc3\xa7",
    "\xc3\xaa",
    "\xc3\xab",
    "\xc3\xa8",
    "\xc3\xaf",
    "\xc3\xae",
    "\xc3\x8d",
    "\xc3\x84",
    "\xc3\x81",
    "\xc3\x89",
    "\xc3\xa6",
    "\xc3\x86",
    "\xc5\x91",
    "\xc3\xb6",
    "\xc3\x93",
    "\xc5\xb1",
    "\xc3\x9a",
    "\xc5\xb0",
    "\xc3\x96",
    "\xc3\x9c",
    "\xc2\xa2",
    "\xc2\xa3",
    "\xc2\xa5",
    "\xe2\x82\xa7",
    "\xee\x80\x9f",
    "\xc3\xa1",
    "\xc3\xad",
    "\xc3\xb3",
    "\xc3\xba",
    "\xc3\xb1",
    "\xc3\x91",
    "\xc2\xaa",
    "\xc5\x90",
    "\xc2\xbf",
    "\xe2\x8c\x90",
    "\xc2\xac",
    "\xc2\xbd",
    "\xc2\xbc",
    "\xc2\xa1",
    "\xc2\xab",
    "\xc2\xbb",
    "\xe2\x96\x91",
    "\xe2\x96\x92",
    "\xe2\x96\x93",
    "\xe2\x94\x82",
    "\xe2\x94\xa4",
    "\xe2\x95\xa1",
    "\xe2\x95\xa2",
    "\xe2\x95\x96",
    "\xe2\x95\x95",
    "\xe2\x95\xa3",
    "\xe2\x95\x91",
    "\xe2\x95\x97",
    "\xe2\x95\x9d",
    "\xe2\x95\x9c",
    "\xe2\x95\x9b",
    "\xe2\x94\x90",
    "\xe2\x94\x94",
    "\xe2\x94\xb4",
    "\xe2\x94\xac",
    "\xe2\x94\x9c",
    "\xe2\x94\x80",
    "\xe2\x94\xbc",
    "\xe2\x95\x9e",
    "\xe2\x95\x9f",
    "\xe2\x95\x9a",
    "\xe2\x95\x94",
    "\xe2\x95\xa9",
    "\xe2\x95\xa6",
    "\xe2\x95\xa0",
    "\xe2\x95\x90",
    "\xe2\x95\xac",
    "\xe2\x95\xa7",
    "\xe2\x95\xa8",
    "\xe2\x95\xa4",
    "\xe2\x95\xa5",
    "\xe2\x95\x99",
    "\xe2\x95\x98",
    "\xe2\x95\x92",
    "\xe2\x95\x93",
    "\xe2\x95\xab",
    "\xe2\x95\xaa",
    "\xe2\x94\x98",
    "\xe2\x94\x8c",
    "\xe2\x96\x88",
    "\xe2\x96\x84",
    "\xe2\x96\x8c",
    "\xe2\x96\x90",
    "\xe2\x96\x80",
    "\xce\xb1",
    "\xce\xb2",
    "\xce\x93",
    "\xcf\x80",
    "\xce\xa3",
    "\xcf\x83",
    "\xce\xbc",
    "\xcf\x84",
    "\xce\xa6",
    "\xce\x98",
    "\xce\xa9",
    "\xce\xb4",
    "\xe2\x88\x9e",
    "\xe2\x88\x85",
    "\xce\xb5",
    "\xe2\x88\xa9",
    "\xe2\x89\xa1",
    "\xc2\xb1",
    "\xe2\x89\xa5",
    "\xe2\x89\xa4",
    "\xe2\x8c\xa0",
    "\xe2\x8c\xa1",
    "\xc3\xb7",
    "\xe2\x89\x88",
    "\xe2\x88\x98",
    "\xc2\xb7",
    "\xe2\x80\xa2",
    "\xe2\x88\x9a",
    "\xe2\x81\xbf",
    "\xc2\xb2",
    "\xe2\x96\xa0",
    "\xc2\xa0",
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
    0x00000024 => 0x24,
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
    0x00000041 => 0x41,
    0x00000042 => 0x42,
    0x00000043 => 0x43,
    0x00000044 => 0x44,
    0x00000045 => 0x45,
    0x00000046 => 0x46,
    0x00000047 => 0x47,
    0x00000048 => 0x48,
    0x00000049 => 0x49,
    0x0000004a => 0x4a,
    0x0000004b => 0x4b,
    0x0000004c => 0x4c,
    0x0000004d => 0x4d,
    0x0000004e => 0x4e,
    0x0000004f => 0x4f,
    0x00000050 => 0x50,
    0x00000051 => 0x51,
    0x00000052 => 0x52,
    0x00000053 => 0x53,
    0x00000054 => 0x54,
    0x00000055 => 0x55,
    0x00000056 => 0x56,
    0x00000057 => 0x57,
    0x00000058 => 0x58,
    0x00000059 => 0x59,
    0x0000005a => 0x5a,
    0x0000005b => 0x5b,
    0x0000005c => 0x5c,
    0x0000005d => 0x5d,
    0x0000005e => 0x5e,
    0x0000005f => 0x5f,
    0x00000060 => 0x60,
    0x00000061 => 0x61,
    0x00000062 => 0x62,
    0x00000063 => 0x63,
    0x00000064 => 0x64,
    0x00000065 => 0x65,
    0x00000066 => 0x66,
    0x00000067 => 0x67,
    0x00000068 => 0x68,
    0x00000069 => 0x69,
    0x0000006a => 0x6a,
    0x0000006b => 0x6b,
    0x0000006c => 0x6c,
    0x0000006d => 0x6d,
    0x0000006e => 0x6e,
    0x0000006f => 0x6f,
    0x00000070 => 0x70,
    0x00000071 => 0x71,
    0x00000072 => 0x72,
    0x00000073 => 0x73,
    0x00000074 => 0x74,
    0x00000075 => 0x75,
    0x00000076 => 0x76,
    0x00000077 => 0x77,
    0x00000078 => 0x78,
    0x00000079 => 0x79,
    0x0000007a => 0x7a,
    0x0000007b => 0x7b,
    0x0000007c => 0x7c,
    0x0000007d => 0x7d,
    0x0000007e => 0x7e,
    0x0000007f => 0x7f,
    0x000000a0 => 0xff,
    0x000000a1 => 0xad,
    0x000000a2 => 0x9b,
    0x000000a3 => 0x9c,
    0x000000a5 => 0x9d,
    0x000000aa => 0xa6,
    0x000000ab => 0xae,
    0x000000ac => 0xaa,
    0x000000b1 => 0xf1,
    0x000000b2 => 0xfd,
    0x000000b7 => 0xf9,
    0x000000bb => 0xaf,
    0x000000bc => 0xac,
    0x000000bd => 0xab,
    0x000000bf => 0xa8,
    0x000000c1 => 0x8f,
    0x000000c4 => 0x8e,
    0x000000c6 => 0x92,
    0x000000c7 => 0x80,
    0x000000c9 => 0x90,
    0x000000cd => 0x8d,
    0x000000d1 => 0xa5,
    0x000000d3 => 0x95,
    0x000000d6 => 0x99,
    0x000000da => 0x97,
    0x000000dc => 0x9a,
    0x000000e0 => 0x85,
    0x000000e1 => 0xa0,
    0x000000e2 => 0x83,
    0x000000e4 => 0x84,
    0x000000e5 => 0x86,
    0x000000e6 => 0x91,
    0x000000e7 => 0x87,
    0x000000e8 => 0x8a,
    0x000000e9 => 0x82,
    0x000000ea => 0x88,
    0x000000eb => 0x89,
    0x000000ed => 0xa1,
    0x000000ee => 0x8c,
    0x000000ef => 0x8b,
    0x000000f1 => 0xa4,
    0x000000f3 => 0xa2,
    0x000000f6 => 0x94,
    0x000000f7 => 0xf6,
    0x000000fa => 0xa3,
    0x000000fc => 0x81,
    0x00000150 => 0xa7,
    0x00000151 => 0x93,
    0x00000170 => 0x98,
    0x00000171 => 0x96,
    0x00000393 => 0xe2,
    0x00000398 => 0xe9,
    0x000003a3 => 0xe4,
    0x000003a6 => 0xe8,
    0x000003a9 => 0xea,
    0x000003b1 => 0xe0,
    0x000003b2 => 0xe1,
    0x000003b4 => 0xeb,
    0x000003b5 => 0xee,
    0x000003bc => 0xe6,
    0x000003c0 => 0xe3,
    0x000003c3 => 0xe5,
    0x000003c4 => 0xe7,
    0x00002022 => 0xfa,
    0x0000207f => 0xfc,
    0x000020a7 => 0x9e,
    0x00002205 => 0xed,
    0x00002218 => 0xf8,
    0x0000221a => 0xfb,
    0x0000221e => 0xec,
    0x00002229 => 0xef,
    0x00002248 => 0xf7,
    0x00002261 => 0xf0,
    0x00002264 => 0xf3,
    0x00002265 => 0xf2,
    0x00002310 => 0xa9,
    0x00002320 => 0xf4,
    0x00002321 => 0xf5,
    0x00002500 => 0xc4,
    0x00002502 => 0xb3,
    0x0000250c => 0xda,
    0x00002510 => 0xbf,
    0x00002514 => 0xc0,
    0x00002518 => 0xd9,
    0x0000251c => 0xc3,
    0x00002524 => 0xb4,
    0x0000252c => 0xc2,
    0x00002534 => 0xc1,
    0x0000253c => 0xc5,
    0x00002550 => 0xcd,
    0x00002551 => 0xba,
    0x00002552 => 0xd5,
    0x00002553 => 0xd6,
    0x00002554 => 0xc9,
    0x00002555 => 0xb8,
    0x00002556 => 0xb7,
    0x00002557 => 0xbb,
    0x00002558 => 0xd4,
    0x00002559 => 0xd3,
    0x0000255a => 0xc8,
    0x0000255b => 0xbe,
    0x0000255c => 0xbd,
    0x0000255d => 0xbc,
    0x0000255e => 0xc6,
    0x0000255f => 0xc7,
    0x00002560 => 0xcc,
    0x00002561 => 0xb5,
    0x00002562 => 0xb6,
    0x00002563 => 0xb9,
    0x00002564 => 0xd1,
    0x00002565 => 0xd2,
    0x00002566 => 0xcb,
    0x00002567 => 0xcf,
    0x00002568 => 0xd0,
    0x00002569 => 0xca,
    0x0000256a => 0xd8,
    0x0000256b => 0xd7,
    0x0000256c => 0xce,
    0x00002580 => 0xdf,
    0x00002584 => 0xdc,
    0x00002588 => 0xdb,
    0x0000258c => 0xdd,
    0x00002590 => 0xde,
    0x00002591 => 0xb0,
    0x00002592 => 0xb1,
    0x00002593 => 0xb2,
    0x000025a0 => 0xfe,
    0x0000e01f => 0x9f,
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
  source: Computerworld Sza'mita'stechnika vol 3 issue 13 1988-06-29
 alias CWI-2
 alias CP-HU

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
    24 |  00000024 | DOLLAR SIGN
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
    41 |  00000041 | LATIN CAPITAL LETTER A
    42 |  00000042 | LATIN CAPITAL LETTER B
    43 |  00000043 | LATIN CAPITAL LETTER C
    44 |  00000044 | LATIN CAPITAL LETTER D
    45 |  00000045 | LATIN CAPITAL LETTER E
    46 |  00000046 | LATIN CAPITAL LETTER F
    47 |  00000047 | LATIN CAPITAL LETTER G
    48 |  00000048 | LATIN CAPITAL LETTER H
    49 |  00000049 | LATIN CAPITAL LETTER I
    4A |  0000004A | LATIN CAPITAL LETTER J
    4B |  0000004B | LATIN CAPITAL LETTER K
    4C |  0000004C | LATIN CAPITAL LETTER L
    4D |  0000004D | LATIN CAPITAL LETTER M
    4E |  0000004E | LATIN CAPITAL LETTER N
    4F |  0000004F | LATIN CAPITAL LETTER O
    50 |  00000050 | LATIN CAPITAL LETTER P
    51 |  00000051 | LATIN CAPITAL LETTER Q
    52 |  00000052 | LATIN CAPITAL LETTER R
    53 |  00000053 | LATIN CAPITAL LETTER S
    54 |  00000054 | LATIN CAPITAL LETTER T
    55 |  00000055 | LATIN CAPITAL LETTER U
    56 |  00000056 | LATIN CAPITAL LETTER V
    57 |  00000057 | LATIN CAPITAL LETTER W
    58 |  00000058 | LATIN CAPITAL LETTER X
    59 |  00000059 | LATIN CAPITAL LETTER Y
    5A |  0000005A | LATIN CAPITAL LETTER Z
    5B |  0000005B | LEFT SQUARE BRACKET
    5C |  0000005C | REVERSE SOLIDUS
    5D |  0000005D | RIGHT SQUARE BRACKET
    5E |  0000005E | CIRCUMFLEX ACCENT
    5F |  0000005F | LOW LINE
    60 |  00000060 | GRAVE ACCENT
    61 |  00000061 | LATIN SMALL LETTER A
    62 |  00000062 | LATIN SMALL LETTER B
    63 |  00000063 | LATIN SMALL LETTER C
    64 |  00000064 | LATIN SMALL LETTER D
    65 |  00000065 | LATIN SMALL LETTER E
    66 |  00000066 | LATIN SMALL LETTER F
    67 |  00000067 | LATIN SMALL LETTER G
    68 |  00000068 | LATIN SMALL LETTER H
    69 |  00000069 | LATIN SMALL LETTER I
    6A |  0000006A | LATIN SMALL LETTER J
    6B |  0000006B | LATIN SMALL LETTER K
    6C |  0000006C | LATIN SMALL LETTER L
    6D |  0000006D | LATIN SMALL LETTER M
    6E |  0000006E | LATIN SMALL LETTER N
    6F |  0000006F | LATIN SMALL LETTER O
    70 |  00000070 | LATIN SMALL LETTER P
    71 |  00000071 | LATIN SMALL LETTER Q
    72 |  00000072 | LATIN SMALL LETTER R
    73 |  00000073 | LATIN SMALL LETTER S
    74 |  00000074 | LATIN SMALL LETTER T
    75 |  00000075 | LATIN SMALL LETTER U
    76 |  00000076 | LATIN SMALL LETTER V
    77 |  00000077 | LATIN SMALL LETTER W
    78 |  00000078 | LATIN SMALL LETTER X
    79 |  00000079 | LATIN SMALL LETTER Y
    7A |  0000007A | LATIN SMALL LETTER Z
    7B |  0000007B | LEFT CURLY BRACKET
    7C |  0000007C | VERTICAL LINE
    7D |  0000007D | RIGHT CURLY BRACKET
    7E |  0000007E | TILDE
    7F |  0000007F | DELETE (DEL)
    80 |  000000C7 | LATIN CAPITAL LETTER C WITH CEDILLA
    81 |  000000FC | LATIN SMALL LETTER U WITH DIAERESIS
    82 |  000000E9 | LATIN SMALL LETTER E WITH ACUTE
    83 |  000000E2 | LATIN SMALL LETTER A WITH CIRCUMFLEX
    84 |  000000E4 | LATIN SMALL LETTER A WITH DIAERESIS
    85 |  000000E0 | LATIN SMALL LETTER A WITH GRAVE
    86 |  000000E5 | LATIN SMALL LETTER A WITH RING ABOVE
    87 |  000000E7 | LATIN SMALL LETTER C WITH CEDILLA
    88 |  000000EA | LATIN SMALL LETTER E WITH CIRCUMFLEX
    89 |  000000EB | LATIN SMALL LETTER E WITH DIAERESIS
    8A |  000000E8 | LATIN SMALL LETTER E WITH GRAVE
    8B |  000000EF | LATIN SMALL LETTER I WITH DIAERESIS
    8C |  000000EE | LATIN SMALL LETTER I WITH CIRCUMFLEX
    8D |  000000CD | LATIN CAPITAL LETTER I WITH ACUTE
    8E |  000000C4 | LATIN CAPITAL LETTER A WITH DIAERESIS
    8F |  000000C1 | LATIN CAPITAL LETTER A WITH ACUTE
    90 |  000000C9 | LATIN CAPITAL LETTER E WITH ACUTE
    91 |  000000E6 | LATIN SMALL LETTER AE
    92 |  000000C6 | LATIN CAPITAL LETTER AE
    93 |  00000151 | LATIN SMALL LETTER O WITH DOUBLE ACUTE
    94 |  000000F6 | LATIN SMALL LETTER O WITH DIAERESIS
    95 |  000000D3 | LATIN CAPITAL LETTER O WITH ACUTE
    96 |  00000171 | LATIN SMALL LETTER U WITH DOUBLE ACUTE
    97 |  000000DA | LATIN CAPITAL LETTER U WITH ACUTE
    98 |  00000170 | LATIN CAPITAL LETTER U WITH DOUBLE ACUTE
    99 |  000000D6 | LATIN CAPITAL LETTER O WITH DIAERESIS
    9A |  000000DC | LATIN CAPITAL LETTER U WITH DIAERESIS
    9B |  000000A2 | CENT SIGN
    9C |  000000A3 | POUND SIGN
    9D |  000000A5 | YEN SIGN
    9E |  000020A7 | PESETA SIGN
    9F |  0000E01F | HUNGARIAN FLORINTH (CWI_9F)
    A0 |  000000E1 | LATIN SMALL LETTER A WITH ACUTE
    A1 |  000000ED | LATIN SMALL LETTER I WITH ACUTE
    A2 |  000000F3 | LATIN SMALL LETTER O WITH ACUTE
    A3 |  000000FA | LATIN SMALL LETTER U WITH ACUTE
    A4 |  000000F1 | LATIN SMALL LETTER N WITH TILDE
    A5 |  000000D1 | LATIN CAPITAL LETTER N WITH TILDE
    A6 |  000000AA | FEMININE ORDINAL INDICATOR
    A7 |  00000150 | LATIN CAPITAL LETTER O WITH DOUBLE ACUTE
    A8 |  000000BF | INVERTED QUESTION MARK
    A9 |  00002310 | REVERSED NOT SIGN
    AA |  000000AC | NOT SIGN
    AB |  000000BD | VULGAR FRACTION ONE HALF
    AC |  000000BC | VULGAR FRACTION ONE QUARTER
    AD |  000000A1 | INVERTED EXCLAMATION MARK
    AE |  000000AB | LEFT-POINTING DOUBLE ANGLE QUOTATION MARK
    AF |  000000BB | RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK
    B0 |  00002591 | LIGHT SHADE
    B1 |  00002592 | MEDIUM SHADE
    B2 |  00002593 | DARK SHADE
    B3 |  00002502 | BOX DRAWINGS LIGHT VERTICAL
    B4 |  00002524 | BOX DRAWINGS LIGHT VERTICAL AND LEFT
    B5 |  00002561 | BOX DRAWINGS VERTICAL SINGLE AND LEFT DOUBLE
    B6 |  00002562 | BOX DRAWINGS VERTICAL DOUBLE AND LEFT SINGLE
    B7 |  00002556 | BOX DRAWINGS DOWN DOUBLE AND LEFT SINGLE
    B8 |  00002555 | BOX DRAWINGS DOWN SINGLE AND LEFT DOUBLE
    B9 |  00002563 | BOX DRAWINGS DOUBLE VERTICAL AND LEFT
    BA |  00002551 | BOX DRAWINGS DOUBLE VERTICAL
    BB |  00002557 | BOX DRAWINGS DOUBLE DOWN AND LEFT
    BC |  0000255D | BOX DRAWINGS DOUBLE UP AND LEFT
    BD |  0000255C | BOX DRAWINGS UP DOUBLE AND LEFT SINGLE
    BE |  0000255B | BOX DRAWINGS UP SINGLE AND LEFT DOUBLE
    BF |  00002510 | BOX DRAWINGS LIGHT DOWN AND LEFT
    C0 |  00002514 | BOX DRAWINGS LIGHT UP AND RIGHT
    C1 |  00002534 | BOX DRAWINGS LIGHT UP AND HORIZONTAL
    C2 |  0000252C | BOX DRAWINGS LIGHT DOWN AND HORIZONTAL
    C3 |  0000251C | BOX DRAWINGS LIGHT VERTICAL AND RIGHT
    C4 |  00002500 | BOX DRAWINGS LIGHT HORIZONTAL
    C5 |  0000253C | BOX DRAWINGS LIGHT VERTICAL AND HORIZONTAL
    C6 |  0000255E | BOX DRAWINGS VERTICAL SINGLE AND RIGHT DOUBLE
    C7 |  0000255F | BOX DRAWINGS VERTICAL DOUBLE AND RIGHT SINGLE
    C8 |  0000255A | BOX DRAWINGS DOUBLE UP AND RIGHT
    C9 |  00002554 | BOX DRAWINGS DOUBLE DOWN AND RIGHT
    CA |  00002569 | BOX DRAWINGS DOUBLE UP AND HORIZONTAL
    CB |  00002566 | BOX DRAWINGS DOUBLE DOWN AND HORIZONTAL
    CC |  00002560 | BOX DRAWINGS DOUBLE VERTICAL AND RIGHT
    CD |  00002550 | BOX DRAWINGS DOUBLE HORIZONTAL
    CE |  0000256C | BOX DRAWINGS DOUBLE VERTICAL AND HORIZONTAL
    CF |  00002567 | BOX DRAWINGS UP SINGLE AND HORIZONTAL DOUBLE
    D0 |  00002568 | BOX DRAWINGS UP DOUBLE AND HORIZONTAL SINGLE
    D1 |  00002564 | BOX DRAWINGS DOWN SINGLE AND HORIZONTAL DOUBLE
    D2 |  00002565 | BOX DRAWINGS DOWN DOUBLE AND HORIZONTAL SINGLE
    D3 |  00002559 | BOX DRAWINGS UP DOUBLE AND RIGHT SINGLE
    D4 |  00002558 | BOX DRAWINGS UP SINGLE AND RIGHT DOUBLE
    D5 |  00002552 | BOX DRAWINGS DOWN SINGLE AND RIGHT DOUBLE
    D6 |  00002553 | BOX DRAWINGS DOWN DOUBLE AND RIGHT SINGLE
    D7 |  0000256B | BOX DRAWINGS VERTICAL DOUBLE AND HORIZONTAL SINGLE
    D8 |  0000256A | BOX DRAWINGS VERTICAL SINGLE AND HORIZONTAL DOUBLE
    D9 |  00002518 | BOX DRAWINGS LIGHT UP AND LEFT
    DA |  0000250C | BOX DRAWINGS LIGHT DOWN AND RIGHT
    DB |  00002588 | FULL BLOCK
    DC |  00002584 | LOWER HALF BLOCK
    DD |  0000258C | LEFT HALF BLOCK
    DE |  00002590 | RIGHT HALF BLOCK
    DF |  00002580 | UPPER HALF BLOCK
    E0 |  000003B1 | GREEK SMALL LETTER ALPHA
    E1 |  000003B2 | GREEK SMALL LETTER BETA
    E2 |  00000393 | GREEK CAPITAL LETTER GAMMA
    E3 |  000003C0 | GREEK SMALL LETTER PI
    E4 |  000003A3 | GREEK CAPITAL LETTER SIGMA
    E5 |  000003C3 | GREEK SMALL LETTER SIGMA
    E6 |  000003BC | GREEK SMALL LETTER MU
    E7 |  000003C4 | GREEK SMALL LETTER TAU
    E8 |  000003A6 | GREEK CAPITAL LETTER PHI
    E9 |  00000398 | GREEK CAPITAL LETTER THETA
    EA |  000003A9 | GREEK CAPITAL LETTER OMEGA
    EB |  000003B4 | GREEK SMALL LETTER DELTA
    EC |  0000221E | INFINITY
    ED |  00002205 | EMPTY SET
    EE |  000003B5 | GREEK SMALL LETTER EPSILON
    EF |  00002229 | INTERSECTION
    F0 |  00002261 | IDENTICAL TO
    F1 |  000000B1 | PLUS-MINUS SIGN
    F2 |  00002265 | GREATER-THAN OR EQUAL TO
    F3 |  00002264 | LESS-THAN OR EQUAL TO
    F4 |  00002320 | TOP HALF INTEGRAL
    F5 |  00002321 | BOTTOM HALF INTEGRAL
    F6 |  000000F7 | DIVISION SIGN
    F7 |  00002248 | ALMOST EQUAL TO
    F8 |  00002218 | RING OPERATOR
    F9 |  000000B7 | MIDDLE DOT
    FA |  00002022 | BULLET
    FB |  0000221A | SQUARE ROOT
    FC |  0000207F | SUPERSCRIPT LATIN SMALL LETTER N
    FD |  000000B2 | SUPERSCRIPT TWO
    FE |  000025A0 | BLACK SQUARE
    FF |  000000A0 | NO-BREAK SPACE


=head1 AUTHOR

Copyright (C) 2002, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(http://www.imperia.net/).

=head1 SEE ALSO

Locale::IconvData(3), Locale::Iconv(3), perl(1)

