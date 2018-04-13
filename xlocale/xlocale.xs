/* -*- C -*- */
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

#define PERL_NO_GET_CONTEXT

#include "config.h"

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "const-c.inc"

struct foobar {
        int foo;
        int bar;
        int baz;
};

typedef struct foobar Foobar;

MODULE = Locale::xlocale    PACKAGE = Locale::xlocale    PREFIX=locale_t_

PROTOTYPES: ENABLE

INCLUDE: const-xs.inc

char*
__xlocale_version ()
        CODE:
	        RETVAL = (VERSION);
        OUTPUT:
	        RETVAL

locale_t
newlocale (mask, locale, base=NULL)
        int mask
        const char *locale
        locale_t base
    PROTOTYPE: $$;$

void
locale_t_DESTROY (loc)
        locale_t loc
    CODE:
        printf("destroying locale pointer\n");
        freelocale(loc);

SV *
nl_langinfo_l (item, loc)
               int item
               locale_t loc
        PROTOTYPE: $$
        CODE:
                if (item < 0) {
#ifdef LIBINTL_PERL_HAS_NL_LANGINFO_L
                        SETERRNO(EINVAL, LIB_INVARG);
                        RETVAL = &PL_sv_undef;
                } else {
                        RETVAL = newSVpv(nl_langinfo_l(item, loc), 0);
                }
#else
                croak("nl_langinfo_l() not implemented on this architecture");
#endif
        OUTPUT:
                RETVAL
