#! /bin/false
# vim: syntax=perl
# vim: tabstop=4
# -*- perl -*-
# $Id: IBM868.pm,v 1.1 2002/08/16 10:09:43 guido Exp $

# Conversion routines for IBM868.
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

package Locale::RecodeData::IBM868;

use base Locale::RecodeData;

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
    0x00000660,
    0x00000661,
    0x00000662,
    0x00000663,
    0x00000664,
    0x00000665,
    0x00000666,
    0x00000667,
    0x00000668,
    0x00000669,
    0x0000060c,
    0x0000061b,
    0x0000061f,
    0x00000622,
    0x00000627,
    0x0000fe8e,
    0x0000e016,
    0x00000628,
    0x0000fe91,
    0x0000067e,
    undef,
    0x00000629,
    0x0000062a,
    0x0000fe97,
    undef,
    undef,
    0x0000062b,
    0x0000fe9b,
    0x0000062c,
    0x0000fe9f,
    undef,
    undef,
    0x0000062d,
    0x0000fea3,
    0x0000062e,
    0x0000fea7,
    0x0000062f,
    undef,
    0x00000630,
    0x00000631,
    undef,
    0x00000632,
    undef,
    0x00000633,
    0x0000feb3,
    0x00000634,
    0x000000ab,
    0x000000bb,
    0x0000feb7,
    0x00000635,
    0x00002591,
    0x00002592,
    0x00002593,
    0x00002502,
    0x00002524,
    0x0000febb,
    0x00000636,
    0x0000febf,
    0x00000637,
    0x00002563,
    0x00002551,
    0x00002557,
    0x0000255d,
    0x00000638,
    0x00000639,
    0x00002510,
    0x00002514,
    0x00002534,
    0x0000252c,
    0x0000251c,
    0x00002500,
    0x0000253c,
    0x0000feca,
    0x0000fecb,
    0x0000255a,
    0x00002554,
    0x00002569,
    0x00002566,
    0x00002560,
    0x00002550,
    0x0000256c,
    0x0000fecc,
    0x0000063a,
    0x0000fece,
    0x0000fecf,
    0x0000fed0,
    0x00000641,
    0x0000fed3,
    0x00000642,
    0x0000fed7,
    0x0000feda,
    0x00002518,
    0x0000250c,
    0x00002588,
    0x00002580,
    0x0000fedb,
    undef,
    0x00002584,
    undef,
    0x00000644,
    0x0000fede,
    0x0000fee0,
    0x00000645,
    0x0000fee3,
    undef,
    0x00000646,
    0x0000fee7,
    undef,
    0x00000648,
    undef,
    undef,
    undef,
    undef,
    0x00000621,
    0x000000ad,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    0x00000651,
    0x0000fe7d,
    undef,
    0x000025a0,
    0x000000a0,
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
    "\xd9\xa0",
    "\xd9\xa1",
    "\xd9\xa2",
    "\xd9\xa3",
    "\xd9\xa4",
    "\xd9\xa5",
    "\xd9\xa6",
    "\xd9\xa7",
    "\xd9\xa8",
    "\xd9\xa9",
    "\xd8\x8c",
    "\xd8\x9b",
    "\xd8\x9f",
    "\xd8\xa2",
    "\xd8\xa7",
    "\xef\xba\x8e",
    "\xee\x80\x96",
    "\xd8\xa8",
    "\xef\xba\x91",
    "\xd9\xbe",
    undef,
    "\xd8\xa9",
    "\xd8\xaa",
    "\xef\xba\x97",
    undef,
    undef,
    "\xd8\xab",
    "\xef\xba\x9b",
    "\xd8\xac",
    "\xef\xba\x9f",
    undef,
    undef,
    "\xd8\xad",
    "\xef\xba\xa3",
    "\xd8\xae",
    "\xef\xba\xa7",
    "\xd8\xaf",
    undef,
    "\xd8\xb0",
    "\xd8\xb1",
    undef,
    "\xd8\xb2",
    undef,
    "\xd8\xb3",
    "\xef\xba\xb3",
    "\xd8\xb4",
    "\xc2\xab",
    "\xc2\xbb",
    "\xef\xba\xb7",
    "\xd8\xb5",
    "\xe2\x96\x91",
    "\xe2\x96\x92",
    "\xe2\x96\x93",
    "\xe2\x94\x82",
    "\xe2\x94\xa4",
    "\xef\xba\xbb",
    "\xd8\xb6",
    "\xef\xba\xbf",
    "\xd8\xb7",
    "\xe2\x95\xa3",
    "\xe2\x95\x91",
    "\xe2\x95\x97",
    "\xe2\x95\x9d",
    "\xd8\xb8",
    "\xd8\xb9",
    "\xe2\x94\x90",
    "\xe2\x94\x94",
    "\xe2\x94\xb4",
    "\xe2\x94\xac",
    "\xe2\x94\x9c",
    "\xe2\x94\x80",
    "\xe2\x94\xbc",
    "\xef\xbb\x8a",
    "\xef\xbb\x8b",
    "\xe2\x95\x9a",
    "\xe2\x95\x94",
    "\xe2\x95\xa9",
    "\xe2\x95\xa6",
    "\xe2\x95\xa0",
    "\xe2\x95\x90",
    "\xe2\x95\xac",
    "\xef\xbb\x8c",
    "\xd8\xba",
    "\xef\xbb\x8e",
    "\xef\xbb\x8f",
    "\xef\xbb\x90",
    "\xd9\x81",
    "\xef\xbb\x93",
    "\xd9\x82",
    "\xef\xbb\x97",
    "\xef\xbb\x9a",
    "\xe2\x94\x98",
    "\xe2\x94\x8c",
    "\xe2\x96\x88",
    "\xe2\x96\x80",
    "\xef\xbb\x9b",
    undef,
    "\xe2\x96\x84",
    undef,
    "\xd9\x84",
    "\xef\xbb\x9e",
    "\xef\xbb\xa0",
    "\xd9\x85",
    "\xef\xbb\xa3",
    undef,
    "\xd9\x86",
    "\xef\xbb\xa7",
    undef,
    "\xd9\x88",
    undef,
    undef,
    undef,
    undef,
    "\xd8\xa1",
    "\xc2\xad",
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    undef,
    "\xd9\x91",
    "\xef\xb9\xbd",
    undef,
    "\xe2\x96\xa0",
    "\xc2\xa0",
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
    0x00000021 => "\x21",
    0x00000022 => "\x22",
    0x00000023 => "\x23",
    0x00000024 => "\x24",
    0x00000025 => "\x25",
    0x00000026 => "\x26",
    0x00000027 => "\x27",
    0x00000028 => "\x28",
    0x00000029 => "\x29",
    0x0000002a => "\x2a",
    0x0000002b => "\x2b",
    0x0000002c => "\x2c",
    0x0000002d => "\x2d",
    0x0000002e => "\x2e",
    0x0000002f => "\x2f",
    0x00000030 => "\x30",
    0x00000031 => "\x31",
    0x00000032 => "\x32",
    0x00000033 => "\x33",
    0x00000034 => "\x34",
    0x00000035 => "\x35",
    0x00000036 => "\x36",
    0x00000037 => "\x37",
    0x00000038 => "\x38",
    0x00000039 => "\x39",
    0x0000003a => "\x3a",
    0x0000003b => "\x3b",
    0x0000003c => "\x3c",
    0x0000003d => "\x3d",
    0x0000003e => "\x3e",
    0x0000003f => "\x3f",
    0x00000040 => "\x40",
    0x00000041 => "\x41",
    0x00000042 => "\x42",
    0x00000043 => "\x43",
    0x00000044 => "\x44",
    0x00000045 => "\x45",
    0x00000046 => "\x46",
    0x00000047 => "\x47",
    0x00000048 => "\x48",
    0x00000049 => "\x49",
    0x0000004a => "\x4a",
    0x0000004b => "\x4b",
    0x0000004c => "\x4c",
    0x0000004d => "\x4d",
    0x0000004e => "\x4e",
    0x0000004f => "\x4f",
    0x00000050 => "\x50",
    0x00000051 => "\x51",
    0x00000052 => "\x52",
    0x00000053 => "\x53",
    0x00000054 => "\x54",
    0x00000055 => "\x55",
    0x00000056 => "\x56",
    0x00000057 => "\x57",
    0x00000058 => "\x58",
    0x00000059 => "\x59",
    0x0000005a => "\x5a",
    0x0000005b => "\x5b",
    0x0000005c => "\x5c",
    0x0000005d => "\x5d",
    0x0000005e => "\x5e",
    0x0000005f => "\x5f",
    0x00000060 => "\x60",
    0x00000061 => "\x61",
    0x00000062 => "\x62",
    0x00000063 => "\x63",
    0x00000064 => "\x64",
    0x00000065 => "\x65",
    0x00000066 => "\x66",
    0x00000067 => "\x67",
    0x00000068 => "\x68",
    0x00000069 => "\x69",
    0x0000006a => "\x6a",
    0x0000006b => "\x6b",
    0x0000006c => "\x6c",
    0x0000006d => "\x6d",
    0x0000006e => "\x6e",
    0x0000006f => "\x6f",
    0x00000070 => "\x70",
    0x00000071 => "\x71",
    0x00000072 => "\x72",
    0x00000073 => "\x73",
    0x00000074 => "\x74",
    0x00000075 => "\x75",
    0x00000076 => "\x76",
    0x00000077 => "\x77",
    0x00000078 => "\x78",
    0x00000079 => "\x79",
    0x0000007a => "\x7a",
    0x0000007b => "\x7b",
    0x0000007c => "\x7c",
    0x0000007d => "\x7d",
    0x0000007e => "\x7e",
    0x0000007f => "\x7f",
    0x000000a0 => "\xff",
    0x000000ab => "\xae",
    0x000000ad => "\xf2",
    0x000000bb => "\xaf",
    0x0000060c => "\x8a",
    0x0000061b => "\x8b",
    0x0000061f => "\x8c",
    0x00000621 => "\xf1",
    0x00000622 => "\x8d",
    0x00000627 => "\x8e",
    0x00000628 => "\x91",
    0x00000629 => "\x95",
    0x0000062a => "\x96",
    0x0000062b => "\x9a",
    0x0000062c => "\x9c",
    0x0000062d => "\xa0",
    0x0000062e => "\xa2",
    0x0000062f => "\xa4",
    0x00000630 => "\xa6",
    0x00000631 => "\xa7",
    0x00000632 => "\xa9",
    0x00000633 => "\xab",
    0x00000634 => "\xad",
    0x00000635 => "\xb1",
    0x00000636 => "\xb8",
    0x00000637 => "\xba",
    0x00000638 => "\xbf",
    0x00000639 => "\xc0",
    0x0000063a => "\xd2",
    0x00000641 => "\xd6",
    0x00000642 => "\xd8",
    0x00000644 => "\xe3",
    0x00000645 => "\xe6",
    0x00000646 => "\xe9",
    0x00000648 => "\xec",
    0x00000651 => "\xfb",
    0x00000660 => "\x80",
    0x00000661 => "\x81",
    0x00000662 => "\x82",
    0x00000663 => "\x83",
    0x00000664 => "\x84",
    0x00000665 => "\x85",
    0x00000666 => "\x86",
    0x00000667 => "\x87",
    0x00000668 => "\x88",
    0x00000669 => "\x89",
    0x0000067e => "\x93",
    0x00002500 => "\xc6",
    0x00002502 => "\xb5",
    0x0000250c => "\xdc",
    0x00002510 => "\xc1",
    0x00002514 => "\xc2",
    0x00002518 => "\xdb",
    0x0000251c => "\xc5",
    0x00002524 => "\xb6",
    0x0000252c => "\xc4",
    0x00002534 => "\xc3",
    0x0000253c => "\xc7",
    0x00002550 => "\xcf",
    0x00002551 => "\xbc",
    0x00002554 => "\xcb",
    0x00002557 => "\xbd",
    0x0000255a => "\xca",
    0x0000255d => "\xbe",
    0x00002560 => "\xce",
    0x00002563 => "\xbb",
    0x00002566 => "\xcd",
    0x00002569 => "\xcc",
    0x0000256c => "\xd0",
    0x00002580 => "\xde",
    0x00002584 => "\xe1",
    0x00002588 => "\xdd",
    0x00002591 => "\xb2",
    0x00002592 => "\xb3",
    0x00002593 => "\xb4",
    0x000025a0 => "\xfe",
    0x0000e016 => "\x90",
    0x0000fe7d => "\xfc",
    0x0000fe8e => "\x8f",
    0x0000fe91 => "\x92",
    0x0000fe97 => "\x97",
    0x0000fe9b => "\x9b",
    0x0000fe9f => "\x9d",
    0x0000fea3 => "\xa1",
    0x0000fea7 => "\xa3",
    0x0000feb3 => "\xac",
    0x0000feb7 => "\xb0",
    0x0000febb => "\xb7",
    0x0000febf => "\xb9",
    0x0000feca => "\xc8",
    0x0000fecb => "\xc9",
    0x0000fecc => "\xd1",
    0x0000fece => "\xd3",
    0x0000fecf => "\xd4",
    0x0000fed0 => "\xd5",
    0x0000fed3 => "\xd7",
    0x0000fed7 => "\xd9",
    0x0000feda => "\xda",
    0x0000fedb => "\xdf",
    0x0000fede => "\xe4",
    0x0000fee0 => "\xe5",
    0x0000fee3 => "\xe7",
    0x0000fee7 => "\xea",
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

Locale::RecodeData::IBM868

=head1 SYNOPSIS

This module is internal to libintl.  Do not use directly!

=head1 DESCRIPTION

This module is generated and contains the conversion tables and
routines for IBM868.

=head1 COMMENTS

The following comments have been extracted from the original charmap:

 version: 1.0
  source: IBM NLS RM Vol2 SE09-8002-01, March 1990
 alias CP868
 alias CP-AR

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
    80 |  00000660 | ARABIC-INDIC DIGIT ZERO
    81 |  00000661 | ARABIC-INDIC DIGIT ONE
    82 |  00000662 | ARABIC-INDIC DIGIT TWO
    83 |  00000663 | ARABIC-INDIC DIGIT THREE
    84 |  00000664 | ARABIC-INDIC DIGIT FOUR
    85 |  00000665 | ARABIC-INDIC DIGIT FIVE
    86 |  00000666 | ARABIC-INDIC DIGIT SIX
    87 |  00000667 | ARABIC-INDIC DIGIT SEVEN
    88 |  00000668 | ARABIC-INDIC DIGIT EIGHT
    89 |  00000669 | ARABIC-INDIC DIGIT NINE
    8A |  0000060C | ARABIC COMMA
    8B |  0000061B | ARABIC SEMICOLON
    8C |  0000061F | ARABIC QUESTION MARK
    8D |  00000622 | ARABIC LETTER ALEF WITH MADDA ABOVE
    8E |  00000627 | ARABIC LETTER ALEF
    8F |  0000FE8E | ARABIC LETTER ALEF FINAL FORM
    90 |  0000E016 | ARABIC LETTER ALEF FINAL FORM COMPATIBILITY E<lt>IBM868_90E<gt>
    91 |  00000628 | ARABIC LETTER BEH
    92 |  0000FE91 | ARABIC LETTER BEH INITIAL FORM
    93 |  0000067E | ARABIC LETTER PEH
    95 |  00000629 | ARABIC LETTER TEH MARBUTA
    96 |  0000062A | ARABIC LETTER TEH
    97 |  0000FE97 | ARABIC LETTER TEH INITIAL FORM
    9A |  0000062B | ARABIC LETTER THEH
    9B |  0000FE9B | ARABIC LETTER THEH INITIAL FORM
    9C |  0000062C | ARABIC LETTER JEEM
    9D |  0000FE9F | ARABIC LETTER JEEM INITIAL FORM
    A0 |  0000062D | ARABIC LETTER HAH
    A1 |  0000FEA3 | ARABIC LETTER HAH INITIAL FORM
    A2 |  0000062E | ARABIC LETTER KHAH
    A3 |  0000FEA7 | ARABIC LETTER KHAH INITIAL FORM
    A4 |  0000062F | ARABIC LETTER DAL
    A6 |  00000630 | ARABIC LETTER THAL
    A7 |  00000631 | ARABIC LETTER REH
    A9 |  00000632 | ARABIC LETTER ZAIN
    AB |  00000633 | ARABIC LETTER SEEN
    AC |  0000FEB3 | ARABIC LETTER SEEN INITIAL FORM
    AD |  00000634 | ARABIC LETTER SHEEN
    AE |  000000AB | LEFT-POINTING DOUBLE ANGLE QUOTATION MARK
    AF |  000000BB | RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK
    B0 |  0000FEB7 | ARABIC LETTER SHEEN INITIAL FORM
    B1 |  00000635 | ARABIC LETTER SAD
    B2 |  00002591 | LIGHT SHADE
    B3 |  00002592 | MEDIUM SHADE
    B4 |  00002593 | DARK SHADE
    B5 |  00002502 | BOX DRAWINGS LIGHT VERTICAL
    B6 |  00002524 | BOX DRAWINGS LIGHT VERTICAL AND LEFT
    B7 |  0000FEBB | ARABIC LETTER SAD INITIAL FORM
    B8 |  00000636 | ARABIC LETTER DAD
    B9 |  0000FEBF | ARABIC LETTER DAD INITIAL FORM
    BA |  00000637 | ARABIC LETTER TAH
    BB |  00002563 | BOX DRAWINGS DOUBLE VERTICAL AND LEFT
    BC |  00002551 | BOX DRAWINGS DOUBLE VERTICAL
    BD |  00002557 | BOX DRAWINGS DOUBLE DOWN AND LEFT
    BE |  0000255D | BOX DRAWINGS DOUBLE UP AND LEFT
    BF |  00000638 | ARABIC LETTER ZAH
    C0 |  00000639 | ARABIC LETTER AIN
    C1 |  00002510 | BOX DRAWINGS LIGHT DOWN AND LEFT
    C2 |  00002514 | BOX DRAWINGS LIGHT UP AND RIGHT
    C3 |  00002534 | BOX DRAWINGS LIGHT UP AND HORIZONTAL
    C4 |  0000252C | BOX DRAWINGS LIGHT DOWN AND HORIZONTAL
    C5 |  0000251C | BOX DRAWINGS LIGHT VERTICAL AND RIGHT
    C6 |  00002500 | BOX DRAWINGS LIGHT HORIZONTAL
    C7 |  0000253C | BOX DRAWINGS LIGHT VERTICAL AND HORIZONTAL
    C8 |  0000FECA | ARABIC LETTER AIN FINAL FORM
    C9 |  0000FECB | ARABIC LETTER AIN INITIAL FORM
    CA |  0000255A | BOX DRAWINGS DOUBLE UP AND RIGHT
    CB |  00002554 | BOX DRAWINGS DOUBLE DOWN AND RIGHT
    CC |  00002569 | BOX DRAWINGS DOUBLE UP AND HORIZONTAL
    CD |  00002566 | BOX DRAWINGS DOUBLE DOWN AND HORIZONTAL
    CE |  00002560 | BOX DRAWINGS DOUBLE VERTICAL AND RIGHT
    CF |  00002550 | BOX DRAWINGS DOUBLE HORIZONTAL
    D0 |  0000256C | BOX DRAWINGS DOUBLE VERTICAL AND HORIZONTAL
    D1 |  0000FECC | ARABIC LETTER AIN MEDIAL FORM
    D2 |  0000063A | ARABIC LETTER GHAIN
    D3 |  0000FECE | ARABIC LETTER GHAIN FINAL FORM
    D4 |  0000FECF | ARABIC LETTER GHAIN INITIAL FORM
    D5 |  0000FED0 | ARABIC LETTER GHAIN MEDIAL FORM
    D6 |  00000641 | ARABIC LETTER FEH
    D7 |  0000FED3 | ARABIC LETTER FEH INITIAL FORM
    D8 |  00000642 | ARABIC LETTER QAF
    D9 |  0000FED7 | ARABIC LETTER QAF INITIAL FORM
    DA |  0000FEDA | ARABIC LETTER KAF FINAL FORM
    DB |  00002518 | BOX DRAWINGS LIGHT UP AND LEFT
    DC |  0000250C | BOX DRAWINGS LIGHT DOWN AND RIGHT
    DD |  00002588 | FULL BLOCK
    DE |  00002580 | UPPER HALF BLOCK
    DF |  0000FEDB | ARABIC LETTER KAF INITIAL FORM
    E1 |  00002584 | LOWER HALF BLOCK
    E3 |  00000644 | ARABIC LETTER LAM
    E4 |  0000FEDE | ARABIC LETTER LAM FINAL FORM
    E5 |  0000FEE0 | ARABIC LETTER LAM MEDIAL FORM
    E6 |  00000645 | ARABIC LETTER MEEM
    E7 |  0000FEE3 | ARABIC LETTER MEEM INITIAL FORM
    E9 |  00000646 | ARABIC LETTER NOON
    EA |  0000FEE7 | ARABIC LETTER NOON INITIAL FORM
    EC |  00000648 | ARABIC LETTER WAW
    F1 |  00000621 | ARABIC LETTER HAMZA
    F2 |  000000AD | SOFT HYPHEN
    FB |  00000651 | ARABIC SHADDA
    FC |  0000FE7D | ARABIC SHADDA MEDIAL FORM
    FE |  000025A0 | BLACK SQUARE
    FF |  000000A0 | NO-BREAK SPACE


=head1 AUTHOR

Copyright (C) 2002, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(http://www.imperia.net/).

=head1 SEE ALSO

Locale::RecodeData(3), Locale::Recode(3), perl(1)

