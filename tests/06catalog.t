#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 16;

use Locale::Catalog;

BEGIN {
	plan tests => NUM_TESTS;
}

my $catalog = Locale::Catalog->new;

ok defined $catalog;

# Parse method must die because it is a pure virtual method.
eval { $catalog->parse("/etc/passwd") };
ok $@;
ok !$catalog->slurpErrors;

# Likewise for the dump function.
eval { $catalog->dump };
ok $@;
ok !$catalog->slurpErrors;

# This is bad practice.  Users of the class should, of course, not call
# protected methods.
ok !$catalog->_pushErrors("one message\n");
ok !$catalog->_pushErrors("two\n", "messages");
my @errors = $catalog->errors;
ok 3 == @errors;
ok $errors[0], "one message\n";
ok $errors[1], "two\n";
ok $errors[2], "messages\n";
ok $catalog->clearErrors;
ok !$catalog->errors;
ok !$catalog->_pushErrors("one", "two", "three");
ok 3 == $catalog->slurpErrors;
ok !$catalog->errors;

my $msg1 = Locale::Catalog::Message->new(msgid => 'simple',
                                         msgstr => 'einfach');
my $msg2 = Locale::Catalog::Message->new(msgid => 'hard',
                                         msgstr => 'schwierig');
ok $catalog->add($msg1, $msg2);
my @messages = $catalog->messages;
ok 2 == @messages;
ok 'simple' eq $messages[0]->msgid;
ok 'einfach' eq $messages[0]->msgstr;
ok 'hard' eq $messages[1]->msgid;
ok 'schwierig' eq $messages[1]->msgstr;
