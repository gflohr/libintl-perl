#! /usr/local/bin/perl -w

# vim: tabstop=4
# $Id: Makefile.PL,v 1.14 2003/09/15 08:21:45 guido Exp $

# Makefile generator for libintl-perl.
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
# USA.use ExtUtils::MakeMaker;

use 5.004;
use ExtUtils::MakeMaker;

# Make standard channels unbuffered.
select STDERR; $| = 1;
select STDOUT; $| = 1; 

# Now try to compile and link a simple test program that uses all
# gettext facilities we need.  Failure of the test is not fatal
# since the pure Perl implementation will provide the same functionality.
# However, any help on making this test more portable would be
# highly appreciated!

use Config;

my $c_code = <<'EOF';
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
EOF

my $cc = $Config{cc};

print STDERR "Checking whether we can compile the XS version ... ";
local *HANDLE;
open HANDLE, ">gettest.c" or die "cannot create file 'gettest.c': $!\n";
print HANDLE $c_code;
close HANDLE or die "cannot close file 'gettest.c': $!\n";

my @cmd = $cc;
push @cmd, $Config{ccflags};
push @cmd, $Config{libs};
push @cmd, "-o", "gettest.exe", "gettest.c";

my $cmd = join ' ', @cmd;

my $result = system $cmd;
unless ($result == 0) {
	$cmd .= " -lintl";
	$result = system $cmd;
}
unless ($result == 0) {
	$cmd .= "-lintl -liconv";
	$result = system $cmd;
}

unless ($result == 0) {
	print STDERR <<EOF;
Cannot build the XS version of libintl-perl.  This is harmless!
EOF
} else {
	print STDERR "ok\n";
	print STDERR "Building the XS version of libintl-perl.\n";
}
unlink "gettest.c", "gettest.exe";

package MY;

# FIXME: This is really a hack! Problem: Depending on the build system,
# we may or may not build and install the XS version.  If the XS version
# is being built, the directory blib/arch will be populated, if it is
# not being built, blib/arch will be empty.  Unfortunately, if blib/arch
# is not empty, *all* library files will be installed in the architecture
# dependent locations, if it is empty, they will be installed in the
# architecture independent tree.
#
# Unfortunately, ExtUtils::MakeMaker does not take care of uninstalling
# files from previous installations.  Consequently, we cannot determine
# which version of the library will be loaded, since this depends on the
# current value of @INC.
#
# The solution does not really make me happy.  The Makefile will be patched,
# so that instead of ExtUtils::Install a custom module MyInstall.pm will
# be used.  This custom module overwrites the subroutine that detects
# whether a directory is empty in ExtUtils::Install, and will lie if that
# directory happens to be "blib/arch".  This little hack effectively disables 
# the annoying behavior of ExtUtils::Install (and I sincerely hope that
# this is portable).
sub libscan 
{
	my ($self, $file) = @_;

	return if 'MyInstall.pm' eq $file;

	$self->SUPER::libscan ($file);	
}

sub tools_other 
{
	my $self = shift;

	my $fragment = $self->SUPER::tools_other (@_);

	$fragment =~ s/^MOD_INSTALL\s*=\s*(.*?)-MExtUtils::Install
		/MOD_INSTALL =$1-MMyInstall/msx;

	return $fragment;
}

package main;

WriteMakefile (
    NAME		    => 'libintl-perl',
	VERSION_FROM	=> 'lib/Locale/TextDomain.pm',
    ($] >= 5.005 ?
		(ABSTRACT	=> 'High-Level Interface to Uniforum Message Translation',
	 	 AUTHOR		=> 'Guido Flohr <guido@imperia.net>',
		 ) : (),
	),
	PL_FILES        => {},
	DIR		=> [$result == 0 ? ('gettext_xs') : ()],
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
