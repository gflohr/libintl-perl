#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 10;

use Locale::Messages qw (bindtextdomain dcgettext dcpgettext LC_MESSAGES);
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
$locale_dir .= '/LocaleData';

Locale::Messages::nl_putenv ("LANGUAGE=de_AT");
Locale::Messages::nl_putenv ("LC_ALL=de_AT");
Locale::Messages::nl_putenv ("LANG=de_AT");
Locale::Messages::nl_putenv ("LC_MESSAGES=de_AT");
Locale::Messages::nl_putenv ("OUTPUT_CHARSET=iso-8859-1");

my $bound_dir = bindtextdomain existing => $locale_dir;
ok defined $bound_dir;
ok (File::Spec->catdir ($locale_dir), File::Spec->catdir ($bound_dir));

$bound_dir = bindtextdomain additional => $locale_dir;
ok defined $bound_dir;
ok (File::Spec->catdir ($locale_dir), File::Spec->catdir ($bound_dir));

# make sure dgettext and dpgettext return diff values
ok 'Anzeigen', dcgettext (existing => 'View', LC_MESSAGES);
ok 'Ansicht', dcpgettext (existing => 'Which folder would you like to view?','View', LC_MESSAGES);
ok 'Not translated', dcpgettext (existing => 'none', 'Not translated', LC_MESSAGES);

ok 'Ein weiterer Blick', dcpgettext (additional => 'Context', 'Another View', LC_MESSAGES);
ok 'Not translated', dcpgettext (additional => 'none', 'Not translated', LC_MESSAGES);
ok 'Ein weiterer Blick', dcpgettext (additional => 'Context', 'Another View', LC_MESSAGES);

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
