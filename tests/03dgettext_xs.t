#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 9;

use Locale::Messages qw (bindtextdomain dgettext);
require POSIX;
require File::Spec;

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

my $locale_dir = $0;
$locale_dir =~ s,[^/\\]+$,, or $locale_dir = '.';
$locale_dir = File::Spec->catdir ($locale_dir, "LocaleData");

$ENV{LANGUAGE} = $ENV{LC_ALL} = $ENV{LANG} = $ENV{LC_MESSAGES} = 'de_AT';
$ENV{OUTPUT_CHARSET} = 'iso-8859-1';

POSIX::setlocale (POSIX::LC_ALL() => '');

my $bound_dir = bindtextdomain existing => $locale_dir;
ok defined $bound_dir && $locale_dir eq $bound_dir;

$bound_dir = bindtextdomain additional => $locale_dir;
ok defined $bound_dir && $locale_dir eq $bound_dir;

ok 'Dezember' eq dgettext (existing => 'December');
ok  'September' eq dgettext (existing => 'September');
ok  'Not translated' eq dgettext (existing => 'Not translated');
ok 'J�nner' eq dgettext (existing => 'January');

ok 'Montag' eq dgettext (additional => 'Monday');
ok  'Not translated' eq dgettext (additional => 'Not translated');
ok 'Sonnabend' eq dgettext (additional => 'Saturday');

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
