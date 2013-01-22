#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 7;

use Locale::Messages;
use Locale::gettext_pp;

BEGIN {
    my $selected = Locale::Messages->select_package ('gettext_dumb');
    if (!$selected || $selected ne 'gettext_dumb') {
        print "1..1\nnot ok # Locale::gettext_dumb does not compile: $@!\n";
	exit 111;
    }
    plan tests => NUM_TESTS;
}

ok Locale::gettext_dumb::LC_CTYPE(), Locale::gettext_pp::LC_CTYPE();
ok Locale::gettext_dumb::LC_NUMERIC(), Locale::gettext_pp::LC_NUMERIC();
ok Locale::gettext_dumb::LC_TIME(), Locale::gettext_pp::LC_TIME();
ok Locale::gettext_dumb::LC_COLLATE(), Locale::gettext_pp::LC_COLLATE();
ok Locale::gettext_dumb::LC_MONETARY(), Locale::gettext_pp::LC_MONETARY();
ok Locale::gettext_dumb::LC_MESSAGES(), Locale::gettext_pp::LC_MESSAGES();
ok Locale::gettext_dumb::LC_ALL(), Locale::gettext_pp::LC_ALL();

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
