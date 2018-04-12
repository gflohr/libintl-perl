#! /usr/local/bin/perl -w # -*- perl -*-

# vim: tabstop=4

# Makefile generator for libintl-perl.
# Copyright (C) 2002-2017 Guido Flohr <guido.flohr@cantanea.com>, 
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
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1335,
# USA.use ExtUtils::MakeMaker;

use 5.004;
use ExtUtils::MakeMaker;
use ExtUtils::Constant 0.23;

WriteMakefile (
    NAME		    => 'Locale::xlocale',
    VERSION_FROM	=> '../lib/Locale/Messages.pm',
    ($] >= 5.005 ?
		(ABSTRACT	=> 'XS Interface To POSIX Extended Locale Support',
	 	 AUTHOR		=> 'Guido Flohr <guido.flohr@cantanea.com>',
    ) : (),
    ),
    PREREQ_PM => { File::Spec => 0 },
	PL_FILES        => {},
	LIBS => [],
);

# Taken from I18N::Langinfo:
#
# Some older versions of glibc use only enums, no defines, hence all this
# hassle (so old glibc that the define is GNU_LIBRARY, not GLIBC):
my @names = 'CODESET'; # CODESET isn't an enum in old glibc's langinfo.h
push @names,           # This lot are always enums in old langinfo.h:
    {name=>$_, type=>"IV",
     macro=>["#if defined($_) || (defined(__GNU_LIBRARY__) && defined(_NL_ITEM))\n",
             "#endif\n"]}
      foreach qw (ABDAY_1 ABDAY_2 ABDAY_3 ABDAY_4 ABDAY_5 ABDAY_6 ABDAY_7
                  ABMON_1 ABMON_10 ABMON_11 ABMON_12 ABMON_2 ABMON_3 ABMON_4
                  ABMON_5 ABMON_6 ABMON_7 ABMON_8 ABMON_9 ALT_DIGITS AM_STR
                  DAY_1 DAY_2 DAY_3 DAY_4 DAY_5 DAY_6 DAY_7 D_FMT D_T_FMT ERA
                  ERA_D_FMT ERA_D_T_FMT ERA_T_FMT MON_1 MON_10 MON_11 MON_12
                  MON_2 MON_3 MON_4 MON_5 MON_6 MON_7 MON_8 MON_9 NOEXPR NOSTR
                  PM_STR T_FMT T_FMT_AMPM YESEXPR YESSTR);
push @names,           # This lot are only enums for __SVR4_I386_ABI_L1__:
    {name=>$_, type=>"IV",
     macro=>["#if defined($_) || (defined(__GNU_LIBRARY__) && defined(_NL_ITEM) && defined(__SVR4_I386_ABI_L1__))\n",
             "#endif\n"]}
      foreach qw (CRNCYSTR THOUSEP RADIXCHAR);

push @names, {
        name => $_,
        type => "IV"}
    foreach qw(LC_COLLATE_MASK LC_CTYPE_MASK LC_MESSAGES_MASK LC_MONETARY_MASK
               LC_NUMERIC_MASK LC_TIME_MASK LC_ADDRESS_MASK 
               LC_IDENTIFICATION_MASK LC_MEASUREMENT_MASK LC_NAME_MASK
               LC_PAPER_MASK LC_TELEPHONE_MASK LC_ALL_MASK);

ExtUtils::Constant::WriteConstants(
				   PROXYSUBS => {autoload => 1},
				   NAME => 'Locale::xlocale',
				   NAMES => \@names,
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
