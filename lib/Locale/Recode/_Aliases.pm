#! /bin/false

# vim: tabstop=4
# $Id: _Aliases.pm,v 1.5 2003/06/15 14:51:57 guido Exp $

# Internally known aliases for charsets.
# Copyright (C) 2002-2003 Guido Flohr <guido@imperia.net>,
# all rights reserved.

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

package Locale::Recode::_Aliases;

use constant ALIASES => {
	'ANSI_X3.4-1986' => 'ANSI_X3.4-1968',
	'ASCII' => 'ANSI_X3.4-1968',
	'ASMO-708' => 'ARABIC',
	'BIG-FIVE' => 'BIG-5',
	'BIG-FIVE-ETEN' => 'BIG-5',
	'BIG5' => 'BIG-5',
	'BIG5-ETEN' => 'BIG-5',
	'BIG5HKSCS' => 'BIG5-HKSCS',
	'BIGFIVE' => 'BIG-5',
	'BIGFIVE-ETEN' => 'BIG-5',
	'CN-BIG5' => 'BIG-5',
	'CN-BIG5' => 'BIG-5',
	'CP-GR' => '869',
	'CP-IS' => '861',
	'CP367' => 'ANSI_X3.4-1968',
	'CP437' => '437',
	'CP850' => '850',
	'CP852' => '852',
	'CP855' => '855',
	'CP857' => '857',
	'CP860' => '860',
	'CP861' => '861',
	'CP862' => '862',
	'CP863' => '863',
	'CP865' => '865',
	'CP866' => '866',
	'CP869' => '869',
	'CSASCII' => 'ANSI_X3.4-1968',
	'CSBIG5' => 'BIG-5',
	'CSEUCKR' => 'EUC-KR',
	'CSEUCPKDFMTJAPANESE' => 'EUC-JP',
	'CSEUCTW' => 'EUC-TW',
	'CSGB2312' => 'CN-GB',
	'CSHALFWIDTHKATAKANA' => 'JISX0201-1976',
	'CSHPROMAN8' => 'HP-ROMAN8',
	'CSIBM1161' => 'CP1161',
	'CSIBM1162' => 'CP1162',
	'CSIBM1163' => 'CP1163',
	'CSIBM855' => '855',
	'CSIBM857' => '857',
	'CSIBM860' => '860',
	'CSIBM861' => '861',
	'CSIBM863' => '863',
	'CSIBM864' => 'CP864',
	'CSIBM865' => '865',
	'CSIBM866' => '866',
	'CSIBM869' => '869',
	'CSISO14JISC6220RO' => 'ISO-IR-14',
	'CSISO159JISX02121990' => 'ISO-IR-159',
	'CSISO2022CN' => 'ISO-2022-CN',
	'CSISO2022JP' => 'ISO-2022-JP',
	'CSISO2022JP2' => 'ISO-2022-JP-2',
	'CSISO2022KR' => 'ISO-2022-KR',
	'CSISO57GB1988' => 'CN',
	'CSISO58GB231280' => 'CHINESE',
	'CSISO87JISX0208' => 'ISO-IR-87',
	'CSISOLATIN1' => 'CP819',
	'CSISOLATIN2' => 'ISO-8859-2',
	'CSISOLATIN3' => 'ISO-8859-3',
	'CSISOLATIN4' => 'ISO-8859-4',
	'CSISOLATIN5' => 'ISO-8859-9',
	'CSISOLATIN6' => 'ISO-8859-10',
	'CSISOLATINARABIC' => 'ARABIC',
	'CSISOLATINCYRILLIC' => 'CYRILLIC',
	'CSISOLATINGREEK' => 'ECMA-118',
	'CSISOLATINHEBREW' => 'HEBREW',
	'CSKOI8R' => 'KOI8-R',
	'CSKSC56011987' => 'ISO-IR-149',
	'CSMACINTOSH' => 'MAC',
	'CSPC775BALTIC' => 'CP775',
	'CSPC850MULTILINGUAL' => '850',
	'CSPC862LATINHEBREW' => '862',
	'CSPC8CODEPAGE437' => '437',
	'CSPCP852' => '852',
	'CSSHIFTJIS' => 'MS_KANJI',
	'CSUCS4' => 'ISO-10646-UCS-4',
	'CSUNICODE' => 'ISO-10646-UCS-2',
	'CSUNICODE11' => 'UCS-2BE',
	'CSUNICODE11UTF7' => 'UNICODE-1-1-UTF-7',
	'CSVISCII' => 'VISCII',
	'ECMA-114' => 'ARABIC',
	'ELOT_928' => 'ECMA-118',
	'EUC-CN' => 'CN-GB',
	'EUCCN' => 'CN-GB',
	'EUCJP' => 'EUC-JP',
	'EUCKR' => 'EUC-KR',
	'EUCTW' => 'EUC-TW',
	'EXTENDED_UNIX_CODE_PACKED_FORMAT_FOR_JAPANESE' => 'EUC-JP',
	'GB2312' => 'CN-GB',
	'GBK' => 'CP936',
	'GB_1988-80' => 'CN',
	'GB_2312-80' => 'CHINESE',
	'GREEK' => 'ECMA-118',
	'GREEK8' => 'ECMA-118',
	'HZ-GB-2312' => 'HZ',
	'IBM-1161' => 'CP1161',
	'IBM-1162' => 'CP1162',
	'IBM-1163' => 'CP1163',
	'IBM-CP1133' => 'CP1133',
	'IBM1161' => 'CP1161',
	'IBM1162' => 'CP1162',
	'IBM1163' => 'CP1163',
	'IBM367' => 'ANSI_X3.4-1968',
	'IBM437' => '437',
	'IBM775' => 'CP775',
	'IBM819' => 'CP819',
	'IBM850' => '850',
	'IBM852' => '852',
	'IBM855' => '855',
	'IBM857' => '857',
	'IBM860' => '860',
	'IBM861' => '861',
	'IBM862' => '862',
	'IBM863' => '863',
	'IBM864' => 'CP864',
	'IBM865' => '865',
	'IBM866' => '866',
	'IBM869' => '869',
	'ISO-8859-1' => 'CP819',
	'ISO-8859-5' => 'CYRILLIC',
	'ISO-8859-6' => 'ARABIC',
	'ISO-8859-7' => 'ECMA-118',
	'ISO-8859-8' => 'HEBREW',
	'ISO-CELTIC' => 'ISO-8859-14',
	'ISO-IR-100' => 'CP819',
	'ISO-IR-101' => 'ISO-8859-2',
	'ISO-IR-109' => 'ISO-8859-3',
	'ISO-IR-110' => 'ISO-8859-4',
	'ISO-IR-126' => 'ECMA-118',
	'ISO-IR-127' => 'ARABIC',
	'ISO-IR-138' => 'HEBREW',
	'ISO-IR-144' => 'CYRILLIC',
	'ISO-IR-148' => 'ISO-8859-9',
	'ISO-IR-157' => 'ISO-8859-10',
	'ISO-IR-165' => 'CN-GB-ISOIR165',
	'ISO-IR-179' => 'ISO-8859-13',
	'ISO-IR-199' => 'ISO-8859-14',
	'ISO-IR-203' => 'ISO-8859-15',
	'ISO-IR-226' => 'ISO-8859-16',
	'ISO-IR-57' => 'CN',
	'ISO-IR-58' => 'CHINESE',
	'ISO-IR-6' => 'ANSI_X3.4-1968',
	'ISO646-CN' => 'CN',
	'ISO646-JP' => 'ISO-IR-14',
	'ISO646-US' => 'ANSI_X3.4-1968',
	'ISO_646.IRV:1991' => 'ANSI_X3.4-1968',
	'ISO_8859-1' => 'CP819',
	'ISO_8859-10' => 'ISO-8859-10',
	'ISO_8859-10:1992' => 'ISO-8859-10',
	'ISO_8859-13' => 'ISO-8859-13',
	'ISO_8859-14' => 'ISO-8859-14',
	'ISO_8859-14:1998' => 'ISO-8859-14',
	'ISO_8859-15' => 'ISO-8859-15',
	'ISO_8859-15:1998' => 'ISO-8859-15',
	'ISO_8859-16' => 'ISO-8859-16',
	'ISO_8859-16:2000' => 'ISO-8859-16',
	'ISO_8859-1:1987' => 'CP819',
	'ISO_8859-2' => 'ISO-8859-2',
	'ISO_8859-2:1987' => 'ISO-8859-2',
	'ISO_8859-3' => 'ISO-8859-3',
	'ISO_8859-3:1988' => 'ISO-8859-3',
	'ISO_8859-4' => 'ISO-8859-4',
	'ISO_8859-4:1988' => 'ISO-8859-4',
	'ISO_8859-5' => 'CYRILLIC',
	'ISO_8859-5:1988' => 'CYRILLIC',
	'ISO_8859-6' => 'ARABIC',
	'ISO_8859-6:1987' => 'ARABIC',
	'ISO_8859-7' => 'ECMA-118',
	'ISO_8859-7:1987' => 'ECMA-118',
	'ISO_8859-8' => 'HEBREW',
	'ISO_8859-8:1988' => 'HEBREW',
	'ISO_8859-9' => 'ISO-8859-9',
	'ISO_8859-9:1989' => 'ISO-8859-9',
	'JIS0208' => 'ISO-IR-87',
	'JIS_C6220-1969-RO' => 'ISO-IR-14',
	'JIS_C6226-1983' => 'ISO-IR-87',
	'JIS_X0201' => 'JISX0201-1976',
	'JIS_X0208' => 'ISO-IR-87',
	'JIS_X0208-1983' => 'ISO-IR-87',
	'JIS_X0208-1990' => 'ISO-IR-87',
	'JIS_X0212' => 'ISO-IR-159',
	'JIS_X0212-1990' => 'ISO-IR-159',
	'JIS_X0212.1990-0' => 'ISO-IR-159',
	'JOHAB' => 'CP1361',
	'JP' => 'ISO-IR-14',
	'KOREAN' => 'ISO-IR-149',
	'KSC_5601' => 'ISO-IR-149',
	'KS_C_5601-1987' => 'ISO-IR-149',
	'KS_C_5601-1989' => 'ISO-IR-149',
	'L1' => 'CP819',
	'L2' => 'ISO-8859-2',
	'L3' => 'ISO-8859-3',
	'L4' => 'ISO-8859-4',
	'L5' => 'ISO-8859-9',
	'L6' => 'ISO-8859-10',
	'L7' => 'ISO-8859-13',
	'L8' => 'ISO-8859-14',
	'LATIN1' => 'CP819',
	'LATIN2' => 'ISO-8859-2',
	'LATIN3' => 'ISO-8859-3',
	'LATIN4' => 'ISO-8859-4',
	'LATIN5' => 'ISO-8859-9',
	'LATIN6' => 'ISO-8859-10',
	'LATIN7' => 'ISO-8859-13',
	'LATIN8' => 'ISO-8859-14',
	'MACINTOSH' => 'MAC',
	'MACROMAN' => 'MAC',
	'MS-ANSI' => 'CP1252',
	'MS-ARAB' => 'CP1256',
	'MS-CYRL' => 'CP1251',
	'MS-EE' => 'CP1250',
	'MS-GREEK' => 'CP1253',
	'MS-HEBR' => 'CP1255',
	'MS-TURK' => 'CP1254',
	'R8' => 'HP-ROMAN8',
	'ROMAN8' => 'HP-ROMAN8',
	'SHIFT-JIS' => 'MS_KANJI',
	'SHIFT_JIS' => 'MS_KANJI',
	'SJIS' => 'MS_KANJI',
	'TCVN-5712' => 'TCVN',
	'TCVN5712-1' => 'TCVN',
	'TCVN5712-1:1993' => 'TCVN',
	'TDS565' => 'ISO-IR-230',
	'TIS-620' => 'ISO-IR-166',
	'TIS620' => 'ISO-IR-166',
	'TIS620-0' => 'ISO-IR-166',
	'TIS620.2529-1' => 'ISO-IR-166',
	'TIS620.2533-0' => 'ISO-IR-166',
	'TIS620.2533-1' => 'ISO-IR-166',
	'UCS-2' => 'ISO-10646-UCS-2',
	'UCS-4' => 'ISO-10646-UCS-4',
	'UHC' => 'CP949',
	'UNICODE-1-1' => 'UCS-2BE',
	'UNICODEBIG' => 'UCS-2BE',
	'UNICODELITTLE' => 'UCS-2LE',
	'US' => 'ANSI_X3.4-1968',
	'US-ASCII' => 'ANSI_X3.4-1968',
	'UTF-7' => 'UNICODE-1-1-UTF-7',
	'VISCII1.1-1' => 'VISCII',
	'WINBALTRIM' => 'CP1257',
	'WINDOWS-1250' => 'CP1250',
	'WINDOWS-1251' => 'CP1251',
	'WINDOWS-1252' => 'CP1252',
	'WINDOWS-1253' => 'CP1253',
	'WINDOWS-1254' => 'CP1254',
	'WINDOWS-1255' => 'CP1255',
	'WINDOWS-1256' => 'CP1256',
	'WINDOWS-1257' => 'CP1257',
	'WINDOWS-1258' => 'CP1258',
	'WINDOWS-874' => 'CP874',
	'WINDOWS-SAMI2' => 'WIN-SAMI-2',
	'WINSAMI2' => 'WIN-SAMI-2',
	'WS2' => 'WIN-SAMI-2',
	'X-ATARI-ST' => 'ATARI-ST',
	'X-ATARIST' => 'ATARI-ST',
	'X-ATARI-ST-EURO' => 'ATARI-ST-EURO',
	'X-ATARIST-EURO' => 'ATARI-ST-EURO',
	'X0201' => 'JISX0201-1976',
	'X0208' => 'ISO-IR-87',
	'X0212' => 'ISO-IR-159',
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
cperl-indent-level: 4
cperl-continued-statement-offset: 2
tab-width: 4
End:

=head1 NAME

Locale::Recode::_Aliases

=head1 SYNOPSIS

use Locale::Recode::_Aliases

This module is internal to libintl.  Do not use directly!

=head1 DESCRIPTION

Contains a list of codeset aliases that are known internally to
libintl.  The original version has been generated from the output
of C<iconv_no_i18n -l> contained in libiconv version 1.8.

=head1 CONSTANTS

=over 4

=item ALIASES

The constant B<Locale::Recode::_Aliases::ALIASES> contains a hash reference
the keys of which are internally known charset alias names all in 
uppercase.  The corresponding value is the canonical name of the charset.

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



