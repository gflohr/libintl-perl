#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 9;

use Locale::Messages qw (bindtextdomain textdomain bind_textdomain_codeset 
						 gettext);
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
$locale_dir =~ s,[^\\/]+$,, or $locale_dir = '.';
$locale_dir = File::Spec->catdir ($locale_dir, "LocaleData");

my $textdomain = 'existing';

$ENV{LANGUAGE} = $ENV{LC_ALL} = $ENV{LANG} = $ENV{LC_MESSAGES} = 'de_AT';
delete $ENV{OUTPUT_CHARSET};
POSIX::setlocale (POSIX::LC_ALL() => '');

my $bound_dir = bindtextdomain $textdomain => $locale_dir;

ok defined $bound_dir && $locale_dir eq $bound_dir;

my $bound_domain = textdomain $textdomain;

ok  defined $bound_domain && $textdomain eq $bound_domain;

my $bound_codeset = bind_textdomain_codeset $textdomain => 'ISO-8859-1';

ok defined $bound_codeset && 'ISO-8859-1' eq uc $bound_codeset;

ok 'Jänner' eq gettext ('January');
ok 'März' eq gettext ('March');

# This will cause GNU gettext to re-load our catalog.
$bound_dir = bindtextdomain $textdomain => $locale_dir . '/../LocaleData';

ok defined $bound_dir && "$locale_dir/../LocaleData" eq $bound_dir;

$bound_codeset = bind_textdomain_codeset $textdomain => 'UTF-8';

ok defined $bound_codeset && 'UTF-8' eq uc $bound_codeset;

ok 'JÃ¤nner' eq gettext ('January');
ok 'MÃ¤rz' eq gettext ('March');

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
