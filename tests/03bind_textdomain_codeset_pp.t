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
$locale_dir .= '/LocaleData';

my $textdomain = 'existing';

Locale::Messages::nl_putenv ("LANGUAGE=de_AT");
Locale::Messages::nl_putenv ("LC_ALL=de_AT");
Locale::Messages::nl_putenv ("LANG=de_AT");
Locale::Messages::nl_putenv ("LC_MESSAGES=de_AT");
Locale::Messages::nl_putenv ("OUTPUT_CHARSET");
my $missing_locale = POSIX::setlocale (POSIX::LC_ALL() => '') ?
	'' : 'locale de_AT missing';

my $bound_dir = bindtextdomain $textdomain => $locale_dir;

ok defined $bound_dir &&
	File::Spec->catdir ($locale_dir) eq File::Spec->catdir ($bound_dir);

my $bound_domain = textdomain $textdomain;

ok  defined $bound_domain && $textdomain eq $bound_domain;

my $bound_codeset = bind_textdomain_codeset $textdomain => 'ISO-8859-1';

ok defined $bound_codeset && 'ISO-8859-1' eq uc $bound_codeset;

skip $missing_locale, 'Jänner' eq gettext ('January');
skip $missing_locale, 'März' eq gettext ('March');

# This will cause GNU gettext to re-load our catalog.
$bound_dir = bindtextdomain $textdomain => $locale_dir . '/../LocaleData';

ok defined $bound_dir && 
	File::Spec->catdir ("$locale_dir/../LocaleData") eq 
	File::Spec->catdir ($bound_dir);

$bound_codeset = bind_textdomain_codeset $textdomain => 'UTF-8';

ok defined $bound_codeset && 'UTF-8' eq uc $bound_codeset;

skip $missing_locale, 'JÃ¤nner' eq gettext ('January');
skip $missing_locale, 'MÃ¤rz' eq gettext ('March');

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
