/* -*- C -*- */
/* $Id: gettext_xs.xs,v 1.1 2003/09/15 08:21:46 guido Exp $ */
/*
# Perl binding for Uniforum message translation.
# Copyright (C) 2002-2003 Guido Flohr <guido@imperia.net>,
# all rights reserved.

# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU Library General Public License as published
# by the Free Software Foundation; either version 2, or (at your option)
# any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Library General Public License for more details.

# You should have received a copy of the GNU Library General Public
# License along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
# USA.  */

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <string.h>

MODULE = Locale::gettext_xs	PACKAGE = Locale::gettext_xs

PROTOTYPES: ENABLE

double
LC_CTYPE ()
     CODE:
          RETVAL = (double) LC_CTYPE;
     OUTPUT:
          RETVAL

double
LC_NUMERIC ()
     CODE:
          RETVAL = (double) LC_NUMERIC;
     OUTPUT:
          RETVAL

double
LC_TIME ()
     CODE:
          RETVAL = (double) LC_TIME;
     OUTPUT:
          RETVAL

double
LC_COLLATE ()
     CODE:
          RETVAL = (double) LC_COLLATE;
     OUTPUT:
          RETVAL

double
LC_MONETARY ()
     CODE:
          RETVAL = (double) LC_MONETARY;
     OUTPUT:
          RETVAL

double
LC_MESSAGES ()
     CODE:
          RETVAL = (double) LC_MESSAGES;
     OUTPUT:
          RETVAL

double
LC_ALL ()
     CODE:
          RETVAL = (double) LC_ALL;
     OUTPUT:
          RETVAL

char*
gettext (msgid)
     char* msgid
     PROTOTYPE: $
     CODE:
    	  RETVAL = (char*) gettext (msgid);
     OUTPUT:
	  RETVAL

char*
dgettext (domainname, msgid)
	char* domainname
	char* msgid
    PROTOTYPE: $$
    CODE:
	RETVAL = (char*) dgettext (domainname, msgid);
    OUTPUT:
	RETVAL

char* 
dcgettext (domainname, msgid, category)
	char* domainname
	char* msgid
	int category
    PROTOTYPE: $$$
    CODE:
	RETVAL = (char*) dcgettext (domainname, msgid, category);
    OUTPUT:
	RETVAL

char*
ngettext (msgid1, msgid2, n)
	char* msgid1
	char* msgid2
	unsigned long n
    PROTOTYPE: $$$
    CODE:
	RETVAL = (char*) ngettext (msgid1, msgid2, n);
    OUTPUT:
	RETVAL

char*
dngettext (domainname, msgid1, msgid2, n)
	char* domainname
	char* msgid1
	char* msgid2
	unsigned long n
    PROTOTYPE: $$$$
    CODE:
	RETVAL = (char*) dngettext (domainname, msgid1, msgid2, n);
    OUTPUT:
	RETVAL

char*
dcngettext (domainname, msgid1, msgid2, n, category)
	char* domainname
	char* msgid1
	char* msgid2
	unsigned long n
	int category
    PROTOTYPE: $$$$$
    CODE:
	RETVAL = (char*) dcngettext (domainname, msgid1, msgid2, n, category);
    OUTPUT:
	RETVAL

char*
textdomain (domain)
	char* domain
    PROTOTYPE: ;$
    CODE:
	/* Treat empty or undefined strings as NULL.  */
	if (!domain || domain[0] == '\000')
		domain = NULL;
	RETVAL = (char*) textdomain (domain);
	if (!RETVAL || RETVAL[0] == '\000') {
		XSRETURN_UNDEF;
	}
    OUTPUT:
	RETVAL

char*
bindtextdomain (domain = NULL, dirname = NULL)
	char* domain
	char* dirname
    PROTOTYPE: $;$
    CODE:
	/* Treat empty or undefined strings as NULL.  */
	if (!domain || domain[0] == '\000')
		domain = NULL;
	if (!dirname || dirname[0] == '\000')
		dirname = NULL;
	RETVAL = (char*) bindtextdomain (domain, dirname);
	if (!RETVAL || RETVAL[0] == '\000') {
		XSRETURN_UNDEF;
	}

    OUTPUT:
	RETVAL


char*
bind_textdomain_codeset (domainname, codeset)
	char* domainname
	char* codeset
    PROTOTYPE: $;$
    CODE:
	/* Treat empty or undefined strings as NULL.  */
	if (!domainname || domainname[0] == '\000')
		domainname = NULL;
	if (!codeset || codeset[0] == '\000')
		codeset = NULL;
	RETVAL = (char*) bind_textdomain_codeset (domainname, codeset);
	if (!RETVAL || RETVAL[0] == '\000') {
		XSRETURN_UNDEF;
	}

    OUTPUT:
	RETVAL
