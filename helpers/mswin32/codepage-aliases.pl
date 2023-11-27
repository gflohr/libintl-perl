#! /usr/bin/env perl

use strict;
use v5.10;

use Data::Dump qw(dump);

my @iconv_charsets = split /\n/, `iconv --list`;
my %aliases;
foreach my $line (@iconv_charsets) {
	chomp $line;
	my @charsets = map { lc $_ } split ' ', $line;
	foreach my $charset (@charsets) {
		if ($charset =~ /^cp([0-9]+)$/) {
			my $codepage = $1;
			$aliases{$charset} = $codepage;
			@aliases{@charsets} = ($codepage) x @charsets;
		}
	}
}

dump \%aliases;