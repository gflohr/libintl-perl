#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 88;

use Locale::Messages qw (bindtextdomain textdomain ngettext);
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

Locale::Messages::nl_putenv ("LANGUAGE=C");
Locale::Messages::nl_putenv ("LC_ALL=C");
Locale::Messages::nl_putenv ("LANG=C");
Locale::Messages::nl_putenv ("LC_MESSAGES=C");
Locale::Messages::nl_putenv ("OUTPUT_CHARSET=iso-8859-1");

POSIX::setlocale (POSIX::LC_ALL() => '');

my $locale_dir = $0;
$locale_dir =~ s,[^\\/]+$,, or $locale_dir = '.';
$locale_dir .= '/LocaleData';

bindtextdomain not_here => $locale_dir;
textdomain 'not_here';

my @strings = qw (Singular Plural);
for (0 .. 9) {
	# Prototype checking fails here if you pass the list @strings.
	my $translation = ngettext ($strings[0], $strings[1], $_);
	my $expected = $_ == 1 ? 'Singular' : 'Plural';
	ok $translation, $expected;
}

my $textdomain = 'existing';
Locale::Messages::nl_putenv ("LANGUAGE=C");
Locale::Messages::nl_putenv ("LC_ALL=C");
Locale::Messages::nl_putenv ("LANG=C");
Locale::Messages::nl_putenv ("LC_MESSAGES=C");

POSIX::setlocale (POSIX::LC_ALL() => '');

my $bound_dir = bindtextdomain $textdomain => $locale_dir;

ok defined $bound_dir;
ok (File::Spec->catdir ($bound_dir), File::Spec->catdir ($locale_dir));

my $bound_domain = textdomain $textdomain;

ok  defined $bound_domain && $textdomain eq $bound_domain;

for (0 .. 9) {
	my $translation = ngettext ($strings[0], $strings[1], $_);
	my $expected = $_ == 1 ? 'Singular' : 'Plural';
	ok $translation, $expected;
}

Locale::Messages::nl_putenv ("LANGUAGE=de_AT");
Locale::Messages::nl_putenv ("LC_ALL=de_AT");
Locale::Messages::nl_putenv ("LANG=de_AT");
Locale::Messages::nl_putenv ("LC_MESSAGES=de_AT");

my $missing_locale = 'locale de_AT missing';
my $setlocale = POSIX::setlocale (POSIX::LC_ALL() => '');
if ($setlocale && $setlocale =~ /(?:austria|at)/i) {
	$missing_locale = '';
} else {
	require Locale::Util;
	
	$setlocale = Locale::Util::set_locale (POSIX::LC_ALL(), 'de', 'AT');
	if ($setlocale && $setlocale =~ /(?:austria|at)/i) {
		$missing_locale = '';
	}
}

for (0 .. 9) {
	my $translation = ngettext ($strings[0], $strings[1], $_);
	my $expected = $_ == 1 ? 'Einzahl' : 'Mehrzahl';
	ok $translation, $expected;
}

$textdomain = 'additional';
Locale::Messages::nl_putenv ("LANGUAGE=C");
Locale::Messages::nl_putenv ("LC_ALL=C");
Locale::Messages::nl_putenv ("LANG=C");
Locale::Messages::nl_putenv ("LC_MESSAGES=C");

POSIX::setlocale (POSIX::LC_ALL() => '');

$bound_dir = bindtextdomain $textdomain => $locale_dir;

ok defined $bound_dir;
ok (File::Spec->catdir ($bound_dir), File::Spec->catdir ($bound_dir));

$bound_domain = textdomain $textdomain;

ok defined $bound_domain;
ok $bound_domain, $textdomain;

for (0 .. 9) {
	my $translation = ngettext ($strings[0], $strings[1], $_);
	my $expected = $_ == 1 ? 'Singular' : 'Plural';
	ok $translation, $expected;
}

Locale::Messages::nl_putenv ("LANGUAGE=de_AT");
Locale::Messages::nl_putenv ("LC_ALL=de_AT");
Locale::Messages::nl_putenv ("LANG=de_AT");
Locale::Messages::nl_putenv ("LC_MESSAGES=de_AT");

POSIX::setlocale (POSIX::LC_ALL() => $setlocale) unless $missing_locale; 

for (0 .. 40) {
	my $translation = ngettext ($strings[0], $strings[1], $_);
	my $plural = ($_ == 1 ? 0 : 
				  $_ % 10 == 2 ? 1 : 
				  $_ % 10 == 3 || $_ %10 == 4 ? 2 : 3);
	ok $translation, "Numerus $plural";
}

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

