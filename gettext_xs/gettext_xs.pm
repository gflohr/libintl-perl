#! /bin/false

# vim: tabstop=4
# $Id: gettext_xs.pm,v 1.1 2003/09/15 08:21:46 guido Exp $

# Pure Perl implementation of Uniforum message translation.
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
# USA.

# This module is based on work done by Phillip Vandry <vandry@Mlink.NET>,
# done for Locale::gettext.

package Locale::gettext_xs;

require DynaLoader;
require Exporter;

use vars qw (%EXPORT_TAGS @EXPORT_OK @ISA);

%EXPORT_TAGS = (locale_h => [ qw (
								  gettext
								  dgettext
								  dcgettext
								  ngettext
								  dngettext
								  dcngettext
								  textdomain
								  bindtextdomain
								  bind_textdomain_codeset
								  )
							  ],
				libintl_h => [ qw (LC_CTYPE
								   LC_NUMERIC
								   LC_TIME
								   LC_COLLATE
								   LC_MONETARY
								   LC_MESSAGES
								   LC_ALL)
							   ],
				);

@EXPORT_OK = qw (gettext
				 dgettext
				 dcgettext
				 ngettext
				 dngettext
				 dcngettext
				 textdomain
				 bindtextdomain
				 bind_textdomain_codeset
				 LC_CTYPE
				 LC_NUMERIC
				 LC_TIME
				 LC_COLLATE
				 LC_MONETARY
				 LC_MESSAGES
				 LC_ALL);
@ISA = qw (Exporter DynaLoader);

bootstrap Locale::gettext_xs;

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

