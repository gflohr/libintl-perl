#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;
use POSIX;

my $

BEGIN {
	plan tests => NUM_TESTS;
}

use Locale::Type;

my $global_lt = Locale::Type::LC_GLOBAL_LOCALE();
ok $global_lt;

my $lt = Locale::Type->new(Locale::Type::LC_MESSAGES_MASK(), "de_DE.utf-8");
