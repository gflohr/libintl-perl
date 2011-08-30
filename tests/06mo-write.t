#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 3;

use Locale::Catalog::Format::MO;
use Locale::Catalog::Message;

BEGIN {
	plan tests => NUM_TESTS;
}

my $catalog = Locale::Catalog::Format::MO->new;
ok defined $catalog;

my $message;
$message = Locale::Catalog::Message->new(msgid => 'simple',
                                         msgstr => '');
ok $catalog->add($message);
ok '' eq $catalog->dump;
