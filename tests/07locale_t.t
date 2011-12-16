#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 1;

BEGIN {
	plan tests => NUM_TESTS;
}

use Locale::Type;

ok Locale::Type::LC_GLOBAL_LOCALE();

