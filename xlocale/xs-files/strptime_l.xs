/*
# Perl binding for POSIX extended locale support.
# Copyright (C) 2002-2018 Guido Flohr <guido.flohr@cantanea.com>,
# all rights reserved.

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

void
strptime_l(buf, format, loc, endptr)
           char *          buf
           SV *            format
           locale_t        loc
           char *          endptr
    PPCODE:
            struct tm tm;
            GCC_DIAG_IGNORE(-Wformat-nonliteral);
            endptr = strptime_l(buf, SvPV_nolen(format), &tm, loc);
            GCC_DIAG_RESTORE;
            if (endptr) {
                XPUSHs(sv_2mortal(newSVpvn(endptr, strlen(endptr))));
                XPUSHs(sv_2mortal(newSVnv(tm.tm_sec)));
                XPUSHs(sv_2mortal(newSVnv(tm.tm_min)));
                XPUSHs(sv_2mortal(newSVnv(tm.tm_hour)));
                XPUSHs(sv_2mortal(newSVnv(tm.tm_mday)));
                XPUSHs(sv_2mortal(newSVnv(tm.tm_mon)));
                XPUSHs(sv_2mortal(newSVnv(tm.tm_year)));
                XPUSHs(sv_2mortal(newSVnv(tm.tm_wday)));
                XPUSHs(sv_2mortal(newSVnv(tm.tm_yday)));
                XPUSHs(sv_2mortal(newSVnv(tm.tm_isdst)));
            } else {
                /* Do nothing.  */
            }
