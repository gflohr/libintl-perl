#! /bin/false
# vim: tabstop=4
# $Id: _Conversions.pm,v 1.5 2003/06/05 17:32:14 guido Exp $

# List of internally known conversions.
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

package Locale::Recode::_Conversions;

use strict;
use integer;
eval "use bytes;";

use constant CONVERSIONS => {
    'ASCII//' => {
		'INTERNAL' => 'ASCII',
		'UTF-8//' => 'ASCII',
    },
    'ASMO_449//' => {
		'INTERNAL' => 'ASMO_449',
		'UTF-8//' => 'ASMO_449',
    },
    'ATARI-ST-EURO//' => {
		'INTERNAL' => 'ATARI_ST_EURO',
		'UTF-8//' => 'ATARI_ST_EURO',
    },
    'ATARI-ST//' => {
		'INTERNAL' => 'ATARI_ST',
		'UTF-8//' => 'ATARI_ST',
    },
	'BIG-5//' => {
		'INTERNAL' => 'BIG_5',
	},
    'CP10007//' => {
		'INTERNAL' => 'CP10007',
		'UTF-8//' => 'CP10007',
    },
    'CP1250//' => {
		'INTERNAL' => 'CP1250',
		'UTF-8//' => 'CP1250',
    },
    'CP1251//' => {
		'INTERNAL' => 'CP1251',
		'UTF-8//' => 'CP1251',
    },
    'CP1252//' => {
		'INTERNAL' => 'CP1252',
		'UTF-8//' => 'CP1252',
    },
    'CP1253//' => {
		'INTERNAL' => 'CP1253',
		'UTF-8//' => 'CP1253',
    },
    'CP1254//' => {
		'INTERNAL' => 'CP1254',
		'UTF-8//' => 'CP1254',
    },
    'CP1256//' => {
		'INTERNAL' => 'CP1256',
		'UTF-8//' => 'CP1256',
    },
    'CP1257//' => {
		'INTERNAL' => 'CP1257',
		'UTF-8//' => 'CP1257',
    },
	'CP1361//' => {
		'INTERNAL' => 'CP1361',
	},
	'CP949//' => {
		'INTERNAL' => 'CP949',
	},
    'CSN_369103//' => {
		'INTERNAL' => 'CSN_369103',
		'UTF-8//' => 'CSN_369103',
    },
    'CWI//' => {
		'INTERNAL' => 'CWI',
		'UTF-8//' => 'CWI',
    },
    'DEC-MCS//' => {
		'INTERNAL' => 'DEC_MCS',
		'UTF-8//' => 'DEC_MCS',
    },
    'EBCDIC-AT-DE-A//' => {
		'INTERNAL' => 'EBCDIC_AT_DE_A',
		'UTF-8//' => 'EBCDIC_AT_DE_A',
    },
    'EBCDIC-AT-DE//' => {
		'INTERNAL' => 'EBCDIC_AT_DE',
		'UTF-8//' => 'EBCDIC_AT_DE',
    },
    'EBCDIC-CA-FR//' => {
		'INTERNAL' => 'EBCDIC_CA_FR',
		'UTF-8//' => 'EBCDIC_CA_FR',
    },
    'EBCDIC-DK-NO-A//' => {
		'INTERNAL' => 'EBCDIC_DK_NO_A',
		'UTF-8//' => 'EBCDIC_DK_NO_A',
    },
    'EBCDIC-DK-NO//' => {
		'INTERNAL' => 'EBCDIC_DK_NO',
		'UTF-8//' => 'EBCDIC_DK_NO',
    },
    'EBCDIC-ES-A//' => {
		'INTERNAL' => 'EBCDIC_ES_A',
		'UTF-8//' => 'EBCDIC_ES_A',
    },
    'EBCDIC-ES-S//' => {
		'INTERNAL' => 'EBCDIC_ES_S',
		'UTF-8//' => 'EBCDIC_ES_S',
    },
    'EBCDIC-ES//' => {
		'INTERNAL' => 'EBCDIC_ES',
		'UTF-8//' => 'EBCDIC_ES',
    },
    'EBCDIC-FI-SE-A//' => {
		'INTERNAL' => 'EBCDIC_FI_SE_A',
		'UTF-8//' => 'EBCDIC_FI_SE_A',
    },
    'EBCDIC-FI-SE//' => {
		'INTERNAL' => 'EBCDIC_FI_SE',
		'UTF-8//' => 'EBCDIC_FI_SE',
    },
    'EBCDIC-FR//' => {
		'INTERNAL' => 'EBCDIC_FR',
		'UTF-8//' => 'EBCDIC_FR',
    },
    'EBCDIC-IS-FRISS//' => {
		'INTERNAL' => 'EBCDIC_IS_FRISS',
		'UTF-8//' => 'EBCDIC_IS_FRISS',
    },
    'EBCDIC-IT//' => {
		'INTERNAL' => 'EBCDIC_IT',
		'UTF-8//' => 'EBCDIC_IT',
    },
    'EBCDIC-PT//' => {
		'INTERNAL' => 'EBCDIC_PT',
		'UTF-8//' => 'EBCDIC_PT',
    },
    'EBCDIC-UK//' => {
		'INTERNAL' => 'EBCDIC_UK',
		'UTF-8//' => 'EBCDIC_UK',
    },
    'EBCDIC-US//' => {
		'INTERNAL' => 'EBCDIC_US',
		'UTF-8//' => 'EBCDIC_US',
    },
    'ECMA-CYRILLIC//' => {
		'INTERNAL' => 'ECMA_CYRILLIC',
		'UTF-8//' => 'ECMA_CYRILLIC',
    },
    'EUC-JP//' => {
		'INTERNAL' => 'EUC_JP',
    },
    'EUC-KR//' => {
		'INTERNAL' => 'EUC_KR',
    },
    #'EUC-TW//' => {
	#	'INTERNAL' => 'EUC_TW',
    #},
    'GEORGIAN-ACADEMY//' => {
		'INTERNAL' => 'GEORGIAN_ACADEMY',
		'UTF-8//' => 'GEORGIAN_ACADEMY',
    },
    'GEORGIAN-PS//' => {
		'INTERNAL' => 'GEORGIAN_PS',
		'UTF-8//' => 'GEORGIAN_PS',
    },
    'GOST_19768-74//' => {
		'INTERNAL' => 'GOST_19768_74',
		'UTF-8//' => 'GOST_19768_74',
    },
    'GREEK-CCITT//' => {
		'INTERNAL' => 'GREEK_CCITT',
		'UTF-8//' => 'GREEK_CCITT',
    },
    'GREEK7-OLD//' => {
		'INTERNAL' => 'GREEK7_OLD',
		'UTF-8//' => 'GREEK7_OLD',
    },
    'GREEK7//' => {
		'INTERNAL' => 'GREEK7',
		'UTF-8//' => 'GREEK7',
    },
    'HP-ROMAN8//' => {
		'INTERNAL' => 'HP_ROMAN8',
		'UTF-8//' => 'HP_ROMAN8',
    },
    'IBM037//' => {
		'INTERNAL' => 'IBM037',
		'UTF-8//' => 'IBM037',
    },
    'IBM038//' => {
		'INTERNAL' => 'IBM038',
		'UTF-8//' => 'IBM038',
    },
    'IBM1004//' => {
		'INTERNAL' => 'IBM1004',
		'UTF-8//' => 'IBM1004',
    },
    'IBM1026//' => {
		'INTERNAL' => 'IBM1026',
		'UTF-8//' => 'IBM1026',
    },
    'IBM1047//' => {
		'INTERNAL' => 'IBM1047',
		'UTF-8//' => 'IBM1047',
    },
    'IBM256//' => {
		'INTERNAL' => 'IBM256',
		'UTF-8//' => 'IBM256',
    },
    'IBM273//' => {
		'INTERNAL' => 'IBM273',
		'UTF-8//' => 'IBM273',
    },
    'IBM274//' => {
		'INTERNAL' => 'IBM274',
		'UTF-8//' => 'IBM274',
    },
    'IBM275//' => {
		'INTERNAL' => 'IBM275',
		'UTF-8//' => 'IBM275',
    },
    'IBM277//' => {
		'INTERNAL' => 'IBM277',
		'UTF-8//' => 'IBM277',
    },
    'IBM278//' => {
		'INTERNAL' => 'IBM278',
		'UTF-8//' => 'IBM278',
    },
    'IBM280//' => {
		'INTERNAL' => 'IBM280',
		'UTF-8//' => 'IBM280',
    },
    'IBM281//' => {
		'INTERNAL' => 'IBM281',
		'UTF-8//' => 'IBM281',
    },
    'IBM284//' => {
		'INTERNAL' => 'IBM284',
		'UTF-8//' => 'IBM284',
    },
    'IBM285//' => {
		'INTERNAL' => 'IBM285',
		'UTF-8//' => 'IBM285',
    },
    'IBM290//' => {
		'INTERNAL' => 'IBM290',
		'UTF-8//' => 'IBM290',
    },
    'IBM297//' => {
		'INTERNAL' => 'IBM297',
		'UTF-8//' => 'IBM297',
    },
    'IBM420//' => {
		'INTERNAL' => 'IBM420',
		'UTF-8//' => 'IBM420',
    },
    'IBM423//' => {
		'INTERNAL' => 'IBM423',
		'UTF-8//' => 'IBM423',
    },
    'IBM424//' => {
		'INTERNAL' => 'IBM424',
		'UTF-8//' => 'IBM424',
    },
    'IBM437//' => {
		'INTERNAL' => 'IBM437',
		'UTF-8//' => 'IBM437',
    },
    'IBM500//' => {
		'INTERNAL' => 'IBM500',
		'UTF-8//' => 'IBM500',
    },
    'IBM850//' => {
		'INTERNAL' => 'IBM850',
		'UTF-8//' => 'IBM850',
    },
    'IBM851//' => {
		'INTERNAL' => 'IBM851',
		'UTF-8//' => 'IBM851',
    },
    'IBM852//' => {
		'INTERNAL' => 'IBM852',
		'UTF-8//' => 'IBM852',
    },
    'IBM855//' => {
		'INTERNAL' => 'IBM855',
		'UTF-8//' => 'IBM855',
    },
    'IBM857//' => {
		'INTERNAL' => 'IBM857',
		'UTF-8//' => 'IBM857',
    },
    'IBM860//' => {
		'INTERNAL' => 'IBM860',
		'UTF-8//' => 'IBM860',
    },
    'IBM861//' => {
		'INTERNAL' => 'IBM861',
		'UTF-8//' => 'IBM861',
    },
    'IBM862//' => {
		'INTERNAL' => 'IBM862',
		'UTF-8//' => 'IBM862',
    },
    'IBM863//' => {
		'INTERNAL' => 'IBM863',
		'UTF-8//' => 'IBM863',
    },
    'IBM864//' => {
		'INTERNAL' => 'IBM864',
		'UTF-8//' => 'IBM864',
    },
    'IBM865//' => {
		'INTERNAL' => 'IBM865',
		'UTF-8//' => 'IBM865',
    },
    'IBM866//' => {
		'INTERNAL' => 'IBM866',
		'UTF-8//' => 'IBM866',
    },
    'IBM868//' => {
		'INTERNAL' => 'IBM868',
		'UTF-8//' => 'IBM868',
    },
    'IBM869//' => {
		'INTERNAL' => 'IBM869',
		'UTF-8//' => 'IBM869',
    },
    'IBM870//' => {
		'INTERNAL' => 'IBM870',
		'UTF-8//' => 'IBM870',
    },
    'IBM871//' => {
		'INTERNAL' => 'IBM871',
		'UTF-8//' => 'IBM871',
    },
    'IBM874//' => {
		'INTERNAL' => 'IBM874',
		'UTF-8//' => 'IBM874',
    },
    'IBM875//' => {
		'INTERNAL' => 'IBM875',
		'UTF-8//' => 'IBM875',
    },
    'IBM880//' => {
		'INTERNAL' => 'IBM880',
		'UTF-8//' => 'IBM880',
    },
    'IBM891//' => {
		'INTERNAL' => 'IBM891',
		'UTF-8//' => 'IBM891',
    },
    'IBM903//' => {
		'INTERNAL' => 'IBM903',
		'UTF-8//' => 'IBM903',
    },
    'IBM904//' => {
		'INTERNAL' => 'IBM904',
		'UTF-8//' => 'IBM904',
    },
    'IBM905//' => {
		'INTERNAL' => 'IBM905',
		'UTF-8//' => 'IBM905',
    },
    'IBM918//' => {
		'INTERNAL' => 'IBM918',
		'UTF-8//' => 'IBM918',
    },
    'IEC_P27-1//' => {
		'INTERNAL' => 'IEC_P27_1',
		'UTF-8//' => 'IEC_P27_1',
    },
    'INIS-8//' => {
		'INTERNAL' => 'INIS_8',
		'UTF-8//' => 'INIS_8',
    },
    'INIS-CYRILLIC//' => {
		'INTERNAL' => 'INIS_CYRILLIC',
		'UTF-8//' => 'INIS_CYRILLIC',
    },
    'INIS//' => {
		'INTERNAL' => 'INIS',
		'UTF-8//' => 'INIS',
    },
    'INTERNAL' => {
		'ASCII//' => 'ASCII',
		'ASMO_449//' => 'ASMO_449',
		'ATARI-ST-EURO//' => 'ATARI_ST_EURO',
		'ATARI-ST//' => 'ATARI_ST',
		'BIG-5//' => 'BIG_5',
		'CP10007//' => 'CP10007',
		'CP1250//' => 'CP1250',
		'CP1251//' => 'CP1251',
		'CP1252//' => 'CP1252',
		'CP1253//' => 'CP1253',
		'CP1254//' => 'CP1254',
		'CP1256//' => 'CP1256',
		'CP1257//' => 'CP1257',
		'CP1361//' => 'CP1361',
		'CSN_369103//' => 'CSN_369103',
		'CWI//' => 'CWI',
		'DEC-MCS//' => 'DEC_MCS',
		'EBCDIC-AT-DE-A//' => 'EBCDIC_AT_DE_A',
		'EBCDIC-AT-DE//' => 'EBCDIC_AT_DE',
		'EBCDIC-CA-FR//' => 'EBCDIC_CA_FR',
		'EBCDIC-DK-NO-A//' => 'EBCDIC_DK_NO_A',
		'EBCDIC-DK-NO//' => 'EBCDIC_DK_NO',
		'EBCDIC-ES-A//' => 'EBCDIC_ES_A',
		'EBCDIC-ES-S//' => 'EBCDIC_ES_S',
		'EBCDIC-ES//' => 'EBCDIC_ES',
		'EBCDIC-FI-SE-A//' => 'EBCDIC_FI_SE_A',
		'EBCDIC-FI-SE//' => 'EBCDIC_FI_SE',
		'EBCDIC-FR//' => 'EBCDIC_FR',
		'EBCDIC-IS-FRISS//' => 'EBCDIC_IS_FRISS',
		'EBCDIC-IT//' => 'EBCDIC_IT',
		'EBCDIC-PT//' => 'EBCDIC_PT',
		'EBCDIC-UK//' => 'EBCDIC_UK',
		'EBCDIC-US//' => 'EBCDIC_US',
		'ECMA-CYRILLIC//' => 'ECMA_CYRILLIC',
		'EUC-JP//' => 'EUC_JP',
		'EUC-KR//' => 'EUC_KR',
		#'EUC-TW//' => 'EUC_TW',
		'GEORGIAN-ACADEMY//' => 'GEORGIAN_ACADEMY',
		'GEORGIAN-PS//' => 'GEORGIAN_PS',
		'GOST_19768-74//' => 'GOST_19768_74',
		'GREEK-CCITT//' => 'GREEK_CCITT',
		'GREEK7-OLD//' => 'GREEK7_OLD',
		'GREEK7//' => 'GREEK7',
		'HP-ROMAN8//' => 'HP_ROMAN8',
		'IBM037//' => 'IBM037',
		'IBM038//' => 'IBM038',
		'IBM1004//' => 'IBM1004',
		'IBM1026//' => 'IBM1026',
		'IBM1047//' => 'IBM1047',
		'IBM256//' => 'IBM256',
		'IBM273//' => 'IBM273',
		'IBM274//' => 'IBM274',
		'IBM275//' => 'IBM275',
		'IBM277//' => 'IBM277',
		'IBM278//' => 'IBM278',
		'IBM280//' => 'IBM280',
		'IBM281//' => 'IBM281',
		'IBM284//' => 'IBM284',
		'IBM285//' => 'IBM285',
		'IBM290//' => 'IBM290',
		'IBM297//' => 'IBM297',
		'IBM420//' => 'IBM420',
		'IBM423//' => 'IBM423',
		'IBM424//' => 'IBM424',
		'IBM437//' => 'IBM437',
		'IBM500//' => 'IBM500',
		'IBM850//' => 'IBM850',
		'IBM851//' => 'IBM851',
		'IBM852//' => 'IBM852',
		'IBM855//' => 'IBM855',
		'IBM857//' => 'IBM857',
		'IBM860//' => 'IBM860',
		'IBM861//' => 'IBM861',
		'IBM862//' => 'IBM862',
		'IBM863//' => 'IBM863',
		'IBM864//' => 'IBM864',
		'IBM865//' => 'IBM865',
		'IBM866//' => 'IBM866',
		'IBM868//' => 'IBM868',
		'IBM869//' => 'IBM869',
		'IBM870//' => 'IBM870',
		'IBM871//' => 'IBM871',
		'IBM874//' => 'IBM874',
		'IBM875//' => 'IBM875',
		'IBM880//' => 'IBM880',
		'IBM891//' => 'IBM891',
		'IBM903//' => 'IBM903',
		'IBM904//' => 'IBM904',
		'IBM905//' => 'IBM905',
		'IBM918//' => 'IBM918',
		'IEC_P27-1//' => 'IEC_P27_1',
		'INIS-8//' => 'INIS_8',
		'INIS-CYRILLIC//' => 'INIS_CYRILLIC',
		'INIS//' => 'INIS',
		'ISO-8859-1//' => 'ISO_8859_1',
		'ISO-8859-10//' => 'ISO_8859_10',
		'ISO-8859-11//' => 'ISO_8859_11',
		'ISO-8859-13//' => 'ISO_8859_13',
		'ISO-8859-14//' => 'ISO_8859_14',
		'ISO-8859-15//' => 'ISO_8859_15',
		'ISO-8859-16//' => 'ISO_8859_16',
		'ISO-8859-2//' => 'ISO_8859_2',
		'ISO-8859-3//' => 'ISO_8859_3',
		'ISO-8859-4//' => 'ISO_8859_4',
		'ISO-8859-5//' => 'ISO_8859_5',
		'ISO-8859-6//' => 'ISO_8859_6',
		'ISO-8859-7//' => 'ISO_8859_7',
		'ISO-8859-8//' => 'ISO_8859_8',
		'ISO-8859-9//' => 'ISO_8859_9',
		'ISO-IR-197//' => 'ISO_IR_197',
		'ISO-IR-209//' => 'ISO_IR_209',
		'ISO_10367-BOX//' => 'ISO_10367_BOX',
		'ISO_2033-1983//' => 'ISO_2033_1983',
		'ISO_5427-EXT//' => 'ISO_5427_EXT',
		'ISO_5427//' => 'ISO_5427',
		'ISO_5428//' => 'ISO_5428',
		'KOI-8//' => 'KOI_8',
		'KOI8-R//' => 'KOI8_R',
		'KOI8-T//' => 'KOI8_T',
		'KOI8-U//' => 'KOI8_U',
		'LATIN-GREEK-1//' => 'LATIN_GREEK_1',
		'LATIN-GREEK//' => 'LATIN_GREEK',
		'MAC-IS//' => 'MAC_IS',
		'MAC-SAMI//' => 'MAC_SAMI',
		'MAC-UK//' => 'MAC_UK',
		'MACINTOSH//' => 'MACINTOSH',
		'MS_KANJI//' => 'MS_KANJI',
		'NATS-DANO//' => 'NATS_DANO',
		'NATS-SEFI//' => 'NATS_SEFI',
		'TIS-620//' => 'TIS_620',
		'UTF-8//' => 'UTF_8',
		'VISCII//' => 'VISCII',
		'WIN-SAMI-2//' => 'SAMI_WS2',
    },
    'ISO-8859-1//' => {
		'INTERNAL' => 'ISO_8859_1',
		'UTF-8//' => 'ISO_8859_1',
    },
    'ISO-8859-10//' => {
		'INTERNAL' => 'ISO_8859_10',
		'UTF-8//' => 'ISO_8859_10',
    },
    'ISO-8859-11//' => {
		'INTERNAL' => 'ISO_8859_11',
		'UTF-8//' => 'ISO_8859_11',
    },
    'ISO-8859-13//' => {
		'INTERNAL' => 'ISO_8859_13',
		'UTF-8//' => 'ISO_8859_13',
    },
    'ISO-8859-14//' => {
		'INTERNAL' => 'ISO_8859_14',
		'UTF-8//' => 'ISO_8859_14',
    },
    'ISO-8859-15//' => {
		'INTERNAL' => 'ISO_8859_15',
		'UTF-8//' => 'ISO_8859_15',
    },
    'ISO-8859-16//' => {
		'INTERNAL' => 'ISO_8859_16',
		'UTF-8//' => 'ISO_8859_16',
    },
    'ISO-8859-2//' => {
		'INTERNAL' => 'ISO_8859_2',
		'UTF-8//' => 'ISO_8859_2',
    },
    'ISO-8859-3//' => {
		'INTERNAL' => 'ISO_8859_3',
		'UTF-8//' => 'ISO_8859_3',
    },
    'ISO-8859-4//' => {
		'INTERNAL' => 'ISO_8859_4',
		'UTF-8//' => 'ISO_8859_4',
    },
    'ISO-8859-5//' => {
		'INTERNAL' => 'ISO_8859_5',
		'UTF-8//' => 'ISO_8859_5',
    },
    'ISO-8859-6//' => {
		'INTERNAL' => 'ISO_8859_6',
		'UTF-8//' => 'ISO_8859_6',
    },
    'ISO-8859-7//' => {
		'INTERNAL' => 'ISO_8859_7',
		'UTF-8//' => 'ISO_8859_7',
    },
    'ISO-8859-8//' => {
		'INTERNAL' => 'ISO_8859_8',
		'UTF-8//' => 'ISO_8859_8',
    },
    'ISO-8859-9//' => {
		'INTERNAL' => 'ISO_8859_9',
		'UTF-8//' => 'ISO_8859_9',
    },
    'ISO-IR-197//' => {
		'INTERNAL' => 'ISO_IR_197',
		'UTF-8//' => 'ISO_IR_197',
    },
    'ISO-IR-209//' => {
		'INTERNAL' => 'ISO_IR_209',
		'UTF-8//' => 'ISO_IR_209',
    },
    'ISO_10367-BOX//' => {
		'INTERNAL' => 'ISO_10367_BOX',
		'UTF-8//' => 'ISO_10367_BOX',
    },
    'ISO_2033-1983//' => {
		'INTERNAL' => 'ISO_2033_1983',
		'UTF-8//' => 'ISO_2033_1983',
    },
    'ISO_5427-EXT//' => {
		'INTERNAL' => 'ISO_5427_EXT',
		'UTF-8//' => 'ISO_5427_EXT',
    },
    'ISO_5427//' => {
		'INTERNAL' => 'ISO_5427',
		'UTF-8//' => 'ISO_5427',
    },
    'ISO_5428//' => {
		'INTERNAL' => 'ISO_5428',
		'UTF-8//' => 'ISO_5428',
    },
    'KOI-8//' => {
		'INTERNAL' => 'KOI_8',
		'UTF-8//' => 'KOI_8',
    },
    'KOI8-R//' => {
		'INTERNAL' => 'KOI8_R',
		'UTF-8//' => 'KOI8_R',
    },
    'KOI8-T//' => {
		'INTERNAL' => 'KOI8_T',
		'UTF-8//' => 'KOI8_T',
    },
    'KOI8-U//' => {
		'INTERNAL' => 'KOI8_U',
		'UTF-8//' => 'KOI8_U',
    },
    'LATIN-GREEK-1//' => {
		'INTERNAL' => 'LATIN_GREEK_1',
		'UTF-8//' => 'LATIN_GREEK_1',
    },
    'LATIN-GREEK//' => {
		'INTERNAL' => 'LATIN_GREEK',
		'UTF-8//' => 'LATIN_GREEK',
    },
    'MAC-IS//' => {
		'INTERNAL' => 'MAC_IS',
		'UTF-8//' => 'MAC_IS',
    },
    'MAC-SAMI//' => {
		'INTERNAL' => 'MAC_SAMI',
		'UTF-8//' => 'MAC_SAMI',
    },
    'MAC-UK//' => {
		'INTERNAL' => 'MAC_UK',
		'UTF-8//' => 'MAC_UK',
    },
    'MACINTOSH//' => {
		'INTERNAL' => 'MACINTOSH',
		'UTF-8//' => 'MACINTOSH',
    },
    'MS_KANJI//' => {
		'INTERNAL' => 'MS_KANJI',
    },
    'NATS-DANO//' => {
		'INTERNAL' => 'NATS_DANO',
		'UTF-8//' => 'NATS_DANO',
    },
    'NATS-SEFI//' => {
		'INTERNAL' => 'NATS_SEFI',
		'UTF-8//' => 'NATS_SEFI',
    },
    'TIS-620//' => {
		'INTERNAL' => 'TIS_620',
		'UTF-8//' => 'TIS_620',
    },
    'UTF-8//' => {
		'INTERNAL' => 'UTF_8',
    },
    'VISCII//' => {
		'INTERNAL' => 'VISCII',
		'UTF-8//' => 'VISCII',
    },
    'WIN-SAMI-2//' => {
		'INTERNAL' => 'SAMI_WS2',
		'UTF-8//' => 'SAMI_WS2',
    },
};

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

Locale::Recode::_Conversions

=head1 SYNOPSIS

use Locale::Recode::_Conversions

This module is internal to libintl.  Do not use directly!

=head1 DESCRIPTION

Contains a list of codeset aliases that are known internally to
libintl.  The original version has been generated from the output
of C<iconv_no_i18n -l> contained in libiconv version 1.8.

=head1 CONSTANTS

=over 4

=item CONVERSIONS

The constant B<Locale::Recode::_Conversions::CONVERSIONS> contains a hash 
reference the keys of which are internally known official codeset names all in 
uppercase.  All codeset names that are not internal are followed by a 
double slash ('//').

The value is another hash reference that maps the target of the conversion
to a particular module name under the module hierarchy  'Locale::RecodeData::'.

=back

=head1 BUGS

The format of the lookup table will most probably change, do not rely
on the current format!

=head1 AUTHOR

Copyright (C) 2002-2003, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(http://www.imperia.net/).

=head1 SEE ALSO

Locale::Recode(3), perl(1)
