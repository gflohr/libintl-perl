#! /usr/local/bin/perl -w

# vim: tabstop=4
# $Id$

# Portable character conversion for Perl.
# Copyright (C) 2002-2009 Guido Flohr <guido@imperia.net>,
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

# This is a safe wrapper for systems that lack a POSIX shell or have
# a too low limit on the length of the command line.

use strict;
use File::Basename;
use Test::Harness;
use File::Spec;

sub test_harness;

my $here = dirname ($0);
my $test_dir = $here . '/tests';
my @lib_dirs = ($here . '/blib/lib', $here . '/blib/arch');
local *DIR;
opendir DIR, $test_dir or die "cannot open test directory '$test_dir': $!";
@ARGV = sort map $test_dir . '/' . $_, grep /\.t$/, readdir DIR;
closedir DIR;

eval {
	require Encode;
};

unless ($@) {
    print "# Encode revision used is $Encode::VERSION.\n";
}

test_harness ($ENV{TEST_HARNESS} || 0, @lib_dirs);

sub test_harness
{
    $Test::Harness::verbose = shift;
	
    local @INC = @INC;
    unshift @INC, map { File::Spec->rel2abs($_) } @_;
	my $name = $0;
	$name =~ s,test\.pl$,xs_disabled,;
	local *HANDLE;
	open HANDLE, "<$name" or die "cannot open '$name': $!";
	my $xs_disabled = <HANDLE>;
	if ($xs_disabled) {
		Test::Harness::runtests (grep { ! /_xs.t$/ } sort 
			{lc $a cmp lc $b } @ARGV);
	} else {
		Test::Harness::runtests (sort {lc $a cmp lc $b } @ARGV);
	}
}

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

