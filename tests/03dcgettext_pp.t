#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 9;

use Locale::Messages qw (bindtextdomain dcgettext LC_MESSAGES);
require POSIX;

BEGIN {
	my $package;
	if ($0 =~ /_pp\.t$/) {
		$package = 'gettext_pp';
	} else {
		$package = 'gettext';
	}
		
	my $selected = Locale::Messages->select_package ($package);
	if ($selected ne $package && 'gettext' eq $package) {
		print "1..0 # Skip: Locale::$package not available here.\n";
		exit 0;
	}
	plan tests => NUM_TESTS;
}

my $locale_dir = $0;
$locale_dir =~ s,[^\\/]+$,, or $locale_dir = '.';
$locale_dir .= '/locale';

$ENV{LANGUAGE} = $ENV{LC_ALL} = $ENV{LANG} = $ENV{LC_MESSAGES} = 'de_AT';
delete $ENV{OUTPUT_CHARSET};

POSIX::setlocale (POSIX::LC_ALL() => 'de_AT');

my $bound_dir = bindtextdomain existing => $locale_dir;
ok defined $bound_dir && $locale_dir eq $bound_dir;

$bound_dir = bindtextdomain additional => $locale_dir;
ok defined $bound_dir && $locale_dir eq $bound_dir;

ok 'Dezember' eq dcgettext (existing => 'December', LC_MESSAGES);
ok  'September' eq dcgettext (existing => 'September', LC_MESSAGES);
ok  'Not translated' eq dcgettext (existing => 'Not translated', LC_MESSAGES);
ok 'J�nner' eq dcgettext (existing => 'January', LC_MESSAGES);

ok 'Montag' eq dcgettext (additional => 'Monday', LC_MESSAGES);
ok  'Not translated' eq dcgettext (additional => 'Not translated', LC_MESSAGES);
ok 'Sonnabend' eq dcgettext (additional => 'Saturday', LC_MESSAGES);

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
