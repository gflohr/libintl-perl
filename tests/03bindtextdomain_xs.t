#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 12;

use Locale::Messages qw (bindtextdomain);

BEGIN {
	my $package;
	if ($0 =~ /_pp\.t$/) {
		$package = 'gettext_pp';
	} else {
		$package = 'gettext_xs';
	}
		
	my $selected = Locale::Messages->select_package ($package);
	if ($selected ne $package && 'gettext_xs' eq $package) {
		print "1..0 # Skip: Locale::$package not available here.\n";
		exit 0;
	}
	plan tests => NUM_TESTS;
}

my $bound_domain = bindtextdomain 'existing';
ok defined $bound_domain;
ok length $bound_domain;

$bound_domain = bindtextdomain 'existing', '.';
ok defined $bound_domain;
ok $bound_domain, '.';

$bound_domain = bindtextdomain 'existing';
ok defined $bound_domain;
ok $bound_domain, '.';

$bound_domain = bindtextdomain 'not_existing';
ok defined $bound_domain;
ok length $bound_domain;

$bound_domain = bindtextdomain 'not_existing', '.';
ok defined $bound_domain;
ok $bound_domain, '.';

$bound_domain = bindtextdomain 'not_existing';
ok defined $bound_domain;
ok $bound_domain, '.';

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
