#! /bin/false
# -*- perl -*-
# $Id: IBM420.pm,v 1.1.1.1 2002/07/08 19:19:59 guido Exp $

# Conversion routines for IBM420.
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

package Locale::IconvData::IBM420;

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
    0x000000a0,
    0x00000651,
    0x0000fe7d,
    0x00000640,
    undef,
    0x00000621,
    0x00000622,
    0x0000fe82,
    0x00000623,
    0x000000a2,
    0x0000002e,
    0x0000003c,
    0x00000028,
    0x0000002b,
    0x0000007c,
    0x00000026,
    0x0000fe84,
    0x00000624,
    undef,
    undef,
    0x00000626,
    0x00000627,
    0x0000fe8e,
    0x00000628,
    0x0000fe91,
    0x00000021,
    0x00000024,
    0x0000002a,
    0x00000029,
    0x0000003b,
    0x000000ac,
    0x0000002d,
    0x0000002f,
    0x00000629,
    0x0000062a,
    0x0000fe97,
    0x0000062b,
    0x0000fe9b,
    0x0000062c,
    0x0000fe9f,
    0x0000062d,
    0x000000a6,
    0x0000002c,
    0x00000025,
    0x0000005f,
    0x0000003e,
    0x0000003f,
    0x0000fea3,
    0x0000062e,
    0x0000fea7,
    0x0000062f,
    0x00000630,
    0x00000631,
    0x00000632,
    0x00000633,
    0x0000feb3,
    0x0000060c,
    0x0000003a,
    0x00000023,
    0x00000040,
    0x00000027,
    0x0000003d,
    0x00000022,
    0x00000634,
    0x00000061,
    0x00000062,
    0x00000063,
    0x00000064,
    0x00000065,
    0x00000066,
    0x00000067,
    0x00000068,
    0x00000069,
    0x0000feb7,
    0x00000635,
    0x0000febb,
    0x00000636,
    0x0000febf,
    0x00000637,
    0x00000638,
    0x0000006a,
    0x0000006b,
    0x0000006c,
    0x0000006d,
    0x0000006e,
    0x0000006f,
    0x00000070,
    0x00000071,
    0x00000072,
    0x00000639,
    0x0000feca,
    0x0000fecb,
    0x0000fecc,
    0x0000063a,
    0x0000fece,
    0x0000fecf,
    0x000000f7,
    0x00000073,
    0x00000074,
    0x00000075,
    0x00000076,
    0x00000077,
    0x00000078,
    0x00000079,
    0x0000007a,
    0x0000fed0,
    0x00000641,
    0x0000fed3,
    0x00000642,
    0x0000fed7,
    0x00000643,
    0x0000fedb,
    0x00000644,
    0x0000fef5,
    0x0000fef6,
    0x0000fef7,
    0x0000fef8,
    undef,
    undef,
    0x0000fefb,
    0x0000fefc,
    0x0000fedf,
    0x00000645,
    0x0000fee3,
    0x00000646,
    0x0000fee7,
    0x00000647,
    0x0000061b,
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
    0x0000feeb,
    undef,
    0x0000feec,
    undef,
    0x00000648,
    0x0000061f,
    0x0000004a,
    0x0000004b,
    0x0000004c,
    0x0000004d,
    0x0000004e,
    0x0000004f,
    0x00000050,
    0x00000051,
    0x00000052,
    0x00000649,
    0x0000fef0,
    0x0000064a,
    0x0000fef2,
    0x0000fef3,
    0x00000660,
    0x000000d7,
    undef,
    0x00000053,
    0x00000054,
    0x00000055,
    0x00000056,
    0x00000057,
    0x00000058,
    0x00000059,
    0x0000005a,
    0x00000661,
    0x00000662,
    undef,
    0x00000663,
    0x00000664,
    0x00000665,
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
    0x00000666,
    0x00000667,
    0x00000668,
    0x00000669,
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
    "\xc2\xa0",
    "\xd9\x91",
    "\xef\xb9\xbd",
    "\xd9\x80",
    undef,
    "\xd8\xa1",
    "\xd8\xa2",
    "\xef\xba\x82",
    "\xd8\xa3",
    "\xc2\xa2",
    "\x2e",
    "\x3c",
    "\x28",
    "\x2b",
    "\x7c",
    "\x26",
    "\xef\xba\x84",
    "\xd8\xa4",
    undef,
    undef,
    "\xd8\xa6",
    "\xd8\xa7",
    "\xef\xba\x8e",
    "\xd8\xa8",
    "\xef\xba\x91",
    "\x21",
    "\x24",
    "\x2a",
    "\x29",
    "\x3b",
    "\xc2\xac",
    "\x2d",
    "\x2f",
    "\xd8\xa9",
    "\xd8\xaa",
    "\xef\xba\x97",
    "\xd8\xab",
    "\xef\xba\x9b",
    "\xd8\xac",
    "\xef\xba\x9f",
    "\xd8\xad",
    "\xc2\xa6",
    "\x2c",
    "\x25",
    "\x5f",
    "\x3e",
    "\x3f",
    "\xef\xba\xa3",
    "\xd8\xae",
    "\xef\xba\xa7",
    "\xd8\xaf",
    "\xd8\xb0",
    "\xd8\xb1",
    "\xd8\xb2",
    "\xd8\xb3",
    "\xef\xba\xb3",
    "\xd8\x8c",
    "\x3a",
    "\x23",
    "\x40",
    "\x27",
    "\x3d",
    "\x22",
    "\xd8\xb4",
    "\x61",
    "\x62",
    "\x63",
    "\x64",
    "\x65",
    "\x66",
    "\x67",
    "\x68",
    "\x69",
    "\xef\xba\xb7",
    "\xd8\xb5",
    "\xef\xba\xbb",
    "\xd8\xb6",
    "\xef\xba\xbf",
    "\xd8\xb7",
    "\xd8\xb8",
    "\x6a",
    "\x6b",
    "\x6c",
    "\x6d",
    "\x6e",
    "\x6f",
    "\x70",
    "\x71",
    "\x72",
    "\xd8\xb9",
    "\xef\xbb\x8a",
    "\xef\xbb\x8b",
    "\xef\xbb\x8c",
    "\xd8\xba",
    "\xef\xbb\x8e",
    "\xef\xbb\x8f",
    "\xc3\xb7",
    "\x73",
    "\x74",
    "\x75",
    "\x76",
    "\x77",
    "\x78",
    "\x79",
    "\x7a",
    "\xef\xbb\x90",
    "\xd9\x81",
    "\xef\xbb\x93",
    "\xd9\x82",
    "\xef\xbb\x97",
    "\xd9\x83",
    "\xef\xbb\x9b",
    "\xd9\x84",
    "\xef\xbb\xb5",
    "\xef\xbb\xb6",
    "\xef\xbb\xb7",
    "\xef\xbb\xb8",
    undef,
    undef,
    "\xef\xbb\xbb",
    "\xef\xbb\xbc",
    "\xef\xbb\x9f",
    "\xd9\x85",
    "\xef\xbb\xa3",
    "\xd9\x86",
    "\xef\xbb\xa7",
    "\xd9\x87",
    "\xd8\x9b",
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
    "\xef\xbb\xab",
    undef,
    "\xef\xbb\xac",
    undef,
    "\xd9\x88",
    "\xd8\x9f",
    "\x4a",
    "\x4b",
    "\x4c",
    "\x4d",
    "\x4e",
    "\x4f",
    "\x50",
    "\x51",
    "\x52",
    "\xd9\x89",
    "\xef\xbb\xb0",
    "\xd9\x8a",
    "\xef\xbb\xb2",
    "\xef\xbb\xb3",
    "\xd9\xa0",
    "\xc3\x97",
    undef,
    "\x53",
    "\x54",
    "\x55",
    "\x56",
    "\x57",
    "\x58",
    "\x59",
    "\x5a",
    "\xd9\xa1",
    "\xd9\xa2",
    undef,
    "\xd9\xa3",
    "\xd9\xa4",
    "\xd9\xa5",
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
    "\xd9\xa6",
    "\xd9\xa7",
    "\xd9\xa8",
    "\xd9\xa9",
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
    0x00000024 => 0x5b,
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
    0x000000a0 => 0x41,
    0x000000a2 => 0x4a,
    0x000000a6 => 0x6a,
    0x000000ac => 0x5f,
    0x000000ad => 0xca,
    0x000000d7 => 0xe0,
    0x000000f7 => 0xa1,
    0x0000060c => 0x79,
    0x0000061b => 0xc0,
    0x0000061f => 0xd0,
    0x00000621 => 0x46,
    0x00000622 => 0x47,
    0x00000623 => 0x49,
    0x00000624 => 0x52,
    0x00000626 => 0x55,
    0x00000627 => 0x56,
    0x00000628 => 0x58,
    0x00000629 => 0x62,
    0x0000062a => 0x63,
    0x0000062b => 0x65,
    0x0000062c => 0x67,
    0x0000062d => 0x69,
    0x0000062e => 0x71,
    0x0000062f => 0x73,
    0x00000630 => 0x74,
    0x00000631 => 0x75,
    0x00000632 => 0x76,
    0x00000633 => 0x77,
    0x00000634 => 0x80,
    0x00000635 => 0x8b,
    0x00000636 => 0x8d,
    0x00000637 => 0x8f,
    0x00000638 => 0x90,
    0x00000639 => 0x9a,
    0x0000063a => 0x9e,
    0x00000640 => 0x44,
    0x00000641 => 0xab,
    0x00000642 => 0xad,
    0x00000643 => 0xaf,
    0x00000644 => 0xb1,
    0x00000645 => 0xbb,
    0x00000646 => 0xbd,
    0x00000647 => 0xbf,
    0x00000648 => 0xcf,
    0x00000649 => 0xda,
    0x0000064a => 0xdc,
    0x00000651 => 0x42,
    0x00000660 => 0xdf,
    0x00000661 => 0xea,
    0x00000662 => 0xeb,
    0x00000663 => 0xed,
    0x00000664 => 0xee,
    0x00000665 => 0xef,
    0x00000666 => 0xfb,
    0x00000667 => 0xfc,
    0x00000668 => 0xfd,
    0x00000669 => 0xfe,
    0x0000fe7d => 0x43,
    0x0000fe82 => 0x48,
    0x0000fe84 => 0x51,
    0x0000fe8e => 0x57,
    0x0000fe91 => 0x59,
    0x0000fe97 => 0x64,
    0x0000fe9b => 0x66,
    0x0000fe9f => 0x68,
    0x0000fea3 => 0x70,
    0x0000fea7 => 0x72,
    0x0000feb3 => 0x78,
    0x0000feb7 => 0x8a,
    0x0000febb => 0x8c,
    0x0000febf => 0x8e,
    0x0000feca => 0x9b,
    0x0000fecb => 0x9c,
    0x0000fecc => 0x9d,
    0x0000fece => 0x9f,
    0x0000fecf => 0xa0,
    0x0000fed0 => 0xaa,
    0x0000fed3 => 0xac,
    0x0000fed7 => 0xae,
    0x0000fedb => 0xb0,
    0x0000fedf => 0xba,
    0x0000fee3 => 0xbc,
    0x0000fee7 => 0xbe,
    0x0000feeb => 0xcb,
    0x0000feec => 0xcd,
    0x0000fef0 => 0xdb,
    0x0000fef2 => 0xdd,
    0x0000fef3 => 0xde,
    0x0000fef5 => 0xb2,
    0x0000fef6 => 0xb3,
    0x0000fef7 => 0xb4,
    0x0000fef8 => 0xb5,
    0x0000fefb => 0xb8,
    0x0000fefc => 0xb9,
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
  source: IBM NLS RM Vol2 SE09-8002-01, March 1990
  IBM NLS RM p 11-11
 alias CP420
 alias EBCDIC-CP-AR1

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
    41 |  000000A0 | NO-BREAK SPACE
    42 |  00000651 | ARABIC SHADDA
    43 |  0000FE7D | ARABIC SHADDA MEDIAL FORM
    44 |  00000640 | ARABIC TATWEEL
    46 |  00000621 | ARABIC LETTER HAMZA
    47 |  00000622 | ARABIC LETTER ALEF WITH MADDA ABOVE
    48 |  0000FE82 | ARABIC LETTER ALEF WITH MADDA ABOVE FINAL FORM
    49 |  00000623 | ARABIC LETTER ALEF WITH HAMZA ABOVE
    4A |  000000A2 | CENT SIGN
    4B |  0000002E | FULL STOP
    4C |  0000003C | LESS-THAN SIGN
    4D |  00000028 | LEFT PARENTHESIS
    4E |  0000002B | PLUS SIGN
    4F |  0000007C | VERTICAL LINE
    50 |  00000026 | AMPERSAND
    51 |  0000FE84 | ARABIC LETTER ALEF WITH HAMZA ABOVE FINAL FORM
    52 |  00000624 | ARABIC LETTER WAW WITH HAMZA ABOVE
    55 |  00000626 | ARABIC LETTER YEH WITH HAMZA ABOVE
    56 |  00000627 | ARABIC LETTER ALEF
    57 |  0000FE8E | ARABIC LETTER ALEF FINAL FORM
    58 |  00000628 | ARABIC LETTER BEH
    59 |  0000FE91 | ARABIC LETTER BEH INITIAL FORM
    5A |  00000021 | EXCLAMATION MARK
    5B |  00000024 | DOLLAR SIGN
    5C |  0000002A | ASTERISK
    5D |  00000029 | RIGHT PARENTHESIS
    5E |  0000003B | SEMICOLON
    5F |  000000AC | NOT SIGN
    60 |  0000002D | HYPHEN-MINUS
    61 |  0000002F | SOLIDUS
    62 |  00000629 | ARABIC LETTER TEH MARBUTA
    63 |  0000062A | ARABIC LETTER TEH
    64 |  0000FE97 | ARABIC LETTER TEH INITIAL FORM
    65 |  0000062B | ARABIC LETTER THEH
    66 |  0000FE9B | ARABIC LETTER THEH INITIAL FORM
    67 |  0000062C | ARABIC LETTER JEEM
    68 |  0000FE9F | ARABIC LETTER JEEM INITIAL FORM
    69 |  0000062D | ARABIC LETTER HAH
    6A |  000000A6 | BROKEN BAR
    6B |  0000002C | COMMA
    6C |  00000025 | PERCENT SIGN
    6D |  0000005F | LOW LINE
    6E |  0000003E | GREATER-THAN SIGN
    6F |  0000003F | QUESTION MARK
    70 |  0000FEA3 | ARABIC LETTER HAH INITIAL FORM
    71 |  0000062E | ARABIC LETTER KHAH
    72 |  0000FEA7 | ARABIC LETTER KHAH INITIAL FORM
    73 |  0000062F | ARABIC LETTER DAL
    74 |  00000630 | ARABIC LETTER THAL
    75 |  00000631 | ARABIC LETTER REH
    76 |  00000632 | ARABIC LETTER ZAIN
    77 |  00000633 | ARABIC LETTER SEEN
    78 |  0000FEB3 | ARABIC LETTER SEEN INITIAL FORM
    79 |  0000060C | ARABIC COMMA
    7A |  0000003A | COLON
    7B |  00000023 | NUMBER SIGN
    7C |  00000040 | COMMERCIAL AT
    7D |  00000027 | APOSTROPHE
    7E |  0000003D | EQUALS SIGN
    7F |  00000022 | QUOTATION MARK
    80 |  00000634 | ARABIC LETTER SHEEN
    81 |  00000061 | LATIN SMALL LETTER A
    82 |  00000062 | LATIN SMALL LETTER B
    83 |  00000063 | LATIN SMALL LETTER C
    84 |  00000064 | LATIN SMALL LETTER D
    85 |  00000065 | LATIN SMALL LETTER E
    86 |  00000066 | LATIN SMALL LETTER F
    87 |  00000067 | LATIN SMALL LETTER G
    88 |  00000068 | LATIN SMALL LETTER H
    89 |  00000069 | LATIN SMALL LETTER I
    8A |  0000FEB7 | ARABIC LETTER SHEEN INITIAL FORM
    8B |  00000635 | ARABIC LETTER SAD
    8C |  0000FEBB | ARABIC LETTER SAD INITIAL FORM
    8D |  00000636 | ARABIC LETTER DAD
    8E |  0000FEBF | ARABIC LETTER DAD INITIAL FORM
    8F |  00000637 | ARABIC LETTER TAH
    90 |  00000638 | ARABIC LETTER ZAH
    91 |  0000006A | LATIN SMALL LETTER J
    92 |  0000006B | LATIN SMALL LETTER K
    93 |  0000006C | LATIN SMALL LETTER L
    94 |  0000006D | LATIN SMALL LETTER M
    95 |  0000006E | LATIN SMALL LETTER N
    96 |  0000006F | LATIN SMALL LETTER O
    97 |  00000070 | LATIN SMALL LETTER P
    98 |  00000071 | LATIN SMALL LETTER Q
    99 |  00000072 | LATIN SMALL LETTER R
    9A |  00000639 | ARABIC LETTER AIN
    9B |  0000FECA | ARABIC LETTER AIN FINAL FORM
    9C |  0000FECB | ARABIC LETTER AIN INITIAL FORM
    9D |  0000FECC | ARABIC LETTER AIN MEDIAL FORM
    9E |  0000063A | ARABIC LETTER GHAIN
    9F |  0000FECE | ARABIC LETTER GHAIN FINAL FORM
    A0 |  0000FECF | ARABIC LETTER GHAIN INITIAL FORM
    A1 |  000000F7 | DIVISION SIGN
    A2 |  00000073 | LATIN SMALL LETTER S
    A3 |  00000074 | LATIN SMALL LETTER T
    A4 |  00000075 | LATIN SMALL LETTER U
    A5 |  00000076 | LATIN SMALL LETTER V
    A6 |  00000077 | LATIN SMALL LETTER W
    A7 |  00000078 | LATIN SMALL LETTER X
    A8 |  00000079 | LATIN SMALL LETTER Y
    A9 |  0000007A | LATIN SMALL LETTER Z
    AA |  0000FED0 | ARABIC LETTER GHAIN MEDIAL FORM
    AB |  00000641 | ARABIC LETTER FEH
    AC |  0000FED3 | ARABIC LETTER FEH INITIAL FORM
    AD |  00000642 | ARABIC LETTER QAF
    AE |  0000FED7 | ARABIC LETTER QAF INITIAL FORM
    AF |  00000643 | ARABIC LETTER KAF
    B0 |  0000FEDB | ARABIC LETTER KAF INITIAL FORM
    B1 |  00000644 | ARABIC LETTER LAM
    B2 |  0000FEF5 | ARABIC LIGATURE LAM WITH ALEF WITH MADDA ABOVE ISOLATED FORM
    B3 |  0000FEF6 | ARABIC LIGATURE LAM WITH ALEF WITH MADDA ABOVE FINAL FORM
    B4 |  0000FEF7 | ARABIC LIGATURE LAM WITH ALEF WITH HAMZA ABOVE ISOLATED FORM
    B5 |  0000FEF8 | ARABIC LIGATURE LAM WITH ALEF WITH HAMZA ABOVE FINAL FORM
    B8 |  0000FEFB | ARABIC LIGATURE LAM WITH ALEF ISOLATED FORM
    B9 |  0000FEFC | ARABIC LIGATURE LAM WITH ALEF FINAL FORM
    BA |  0000FEDF | ARABIC LETTER LAM INITIAL FORM
    BB |  00000645 | ARABIC LETTER MEEM
    BC |  0000FEE3 | ARABIC LETTER MEEM INITIAL FORM
    BD |  00000646 | ARABIC LETTER NOON
    BE |  0000FEE7 | ARABIC LETTER NOON INITIAL FORM
    BF |  00000647 | ARABIC LETTER HEH
    C0 |  0000061B | ARABIC SEMICOLON
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
    CB |  0000FEEB | ARABIC LETTER HEH INITIAL FORM
    CD |  0000FEEC | ARABIC LETTER HEH MEDIAL FORM
    CF |  00000648 | ARABIC LETTER WAW
    D0 |  0000061F | ARABIC QUESTION MARK
    D1 |  0000004A | LATIN CAPITAL LETTER J
    D2 |  0000004B | LATIN CAPITAL LETTER K
    D3 |  0000004C | LATIN CAPITAL LETTER L
    D4 |  0000004D | LATIN CAPITAL LETTER M
    D5 |  0000004E | LATIN CAPITAL LETTER N
    D6 |  0000004F | LATIN CAPITAL LETTER O
    D7 |  00000050 | LATIN CAPITAL LETTER P
    D8 |  00000051 | LATIN CAPITAL LETTER Q
    D9 |  00000052 | LATIN CAPITAL LETTER R
    DA |  00000649 | ARABIC LETTER ALEF MAKSURA
    DB |  0000FEF0 | ARABIC LETTER ALEF MAKSURA FINAL FORM
    DC |  0000064A | ARABIC LETTER YEH
    DD |  0000FEF2 | ARABIC LETTER YEH FINAL FORM
    DE |  0000FEF3 | ARABIC LETTER YEH INITIAL FORM
    DF |  00000660 | ARABIC-INDIC DIGIT ZERO
    E0 |  000000D7 | MULTIPLICATION SIGN
    E2 |  00000053 | LATIN CAPITAL LETTER S
    E3 |  00000054 | LATIN CAPITAL LETTER T
    E4 |  00000055 | LATIN CAPITAL LETTER U
    E5 |  00000056 | LATIN CAPITAL LETTER V
    E6 |  00000057 | LATIN CAPITAL LETTER W
    E7 |  00000058 | LATIN CAPITAL LETTER X
    E8 |  00000059 | LATIN CAPITAL LETTER Y
    E9 |  0000005A | LATIN CAPITAL LETTER Z
    EA |  00000661 | ARABIC-INDIC DIGIT ONE
    EB |  00000662 | ARABIC-INDIC DIGIT TWO
    ED |  00000663 | ARABIC-INDIC DIGIT THREE
    EE |  00000664 | ARABIC-INDIC DIGIT FOUR
    EF |  00000665 | ARABIC-INDIC DIGIT FIVE
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
    FB |  00000666 | ARABIC-INDIC DIGIT SIX
    FC |  00000667 | ARABIC-INDIC DIGIT SEVEN
    FD |  00000668 | ARABIC-INDIC DIGIT EIGHT
    FE |  00000669 | ARABIC-INDIC DIGIT NINE
    FF |  0000009F | APPLICATION PROGRAM COMMAND (APC)


=head1 AUTHOR

Copyright (C) 2002, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(http://www.imperia.net/).

=head1 SEE ALSO

Locale::IconvData(3), Locale::Iconv(3), perl(1)

