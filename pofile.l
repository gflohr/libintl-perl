/* $Id $ */
/*
 * This file is part of libintl-perl.
 * Copyright (C) 2002-2009 Guido Flohr <guido@imperia.net>,
 * all rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify it
 *under the terms of the GNU Library General Public License as published
 *by the Free Software Foundation; either version 2, or (at your option)
 *any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
 * USA.
 */
%{
use strict;

use Locale::POFile::Parser qw (:yyterminals);
%}
%%
#.*					return $^N, COMMENT
msgid_plural(?=[ \t\r\n\"]|\z)          return $^N, MSGID_PLURAL
msgid(?=[ \t\r\n\"]|\z)                 return $^N, MSGID
msgstr(?=[\[ \t\r\n\"]|\z)              return $^N, MSGSTR
domain(?=[ \t\r\n\"]|\z)                return $^N, DOMAIN
msgctxt(?=[ \t\r\n\"]|\z)               return $^N, MSGCTXT
"([^\\"]*(?:(?:\\"|\\)[^\\"]*)*)"       return $_[1], DQSTRING
[^ \t\r\n]+                             return $^N
[ \t\r\n]+
(.|\n)					return $^N
%%
