#! /usr/local/bin/perl -w # -*- perl -*-

# vim: tabstop=4
# $Id: Makefile.PL,v 1.10 2003/06/16 11:16:48 guido Exp $

# Makefile generator for libintl-perl.
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

use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

WriteMakefile(
    NAME		    => 'libintl-perl',
    VERSION_FROM	=> 'lib/Locale/TextDomain.pm',
    PREREQ_PM		=> {},
	AUTHOR          => 'Guido Flohr <guido@imperia.net>',
    ABSTRACT        => 'Uniform message translation for Perl',
	PL_FILES        => {},
);

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
