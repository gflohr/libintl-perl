/* vim: tabstop=4
   $Id: gettest.c,v 1.1 2003/09/10 18:29:13 guido Exp $

   Tests for sufficient gettext implementation.
   Copyright (C) 2002-2003 Guido Flohr <guido@imperia.net>, 
   all rights reserved.

   This program is free software; you can redistribute it and/or modify it
   under the terms of the GNU Library General Public License as published
   by the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Library General Public 
   License along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, 
   USA.  */

/* The following code only compiles if the interface to gettext is
   complete.  */

#include <libintl.h>
#include <locale.h>

int
main (argc, argv)
	int argc;
    char* argv[];
{
	textdomain ("dummy");
	bindtextdomain ("dummy", ".");
	bind_textdomain_codeset ("dummy", "us-ascii");

	gettext ("msgid");
    dgettext ("dummy", "msgid");
    dcgettext ("dummy", "msgid", LC_MESSAGES);
	ngettext ("msgid", "msgid_plural", 1);
	dngettext ("dummy", "msgid", "msgid_plural", 1);
	dcngettext ("dummy", "msgid", "msgid_plural", 1, LC_MESSAGES);

    return 0;
}
