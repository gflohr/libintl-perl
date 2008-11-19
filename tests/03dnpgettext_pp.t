#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 93;

use Locale::Messages qw (bindtextdomain dnpgettext);
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

# make sure it works with distinct key (where context doesn't matter)
my $context3 = "Context here (3)";
my @strings3 = ("Singular 3", "Plural 3");
for (0 .. 9) {
	# Prototype checking fails here if you pass the list @strings.
	my $translation = dnpgettext (not_here => $context3, $strings3[0], $strings3[1], $_);
	ok $_ == 1 ? 'Singular 3' eq $translation : 'Plural 3' eq $translation;
}

# not try a msgid that matches existing one
my $context = "Context here (2)";
my @strings = qw (Singular Plural);
for (0 .. 9) {
	# Prototype checking fails here if you pass the list @strings.
	my $translation = dnpgettext (not_here => $context, $strings[0], $strings[1], $_);
	ok $_ == 1 ? 'Singular' eq $translation : 'Plural' eq $translation;
}

Locale::Messages::nl_putenv ("LANGUAGE=C");
Locale::Messages::nl_putenv ("LC_ALL=C");
Locale::Messages::nl_putenv ("LANG=C");
Locale::Messages::nl_putenv ("LC_MESSAGES=C");

POSIX::setlocale (POSIX::LC_ALL() => '');

my $bound_dir = bindtextdomain existing => $locale_dir;

ok defined $bound_dir &&
	File::Spec->catdir ($locale_dir) eq File::Spec->catdir ($bound_dir);

for (0 .. 9) {
	my $translation = dnpgettext (existing => $context, $strings[0], $strings[1], $_);
	ok $_ == 1 ? 'Singular' eq $translation : 'Plural' eq $translation;
}

Locale::Messages::nl_putenv ("LANGUAGE=de_AT");
Locale::Messages::nl_putenv ("LC_ALL=de_AT");
Locale::Messages::nl_putenv ("LANG=de_AT");
Locale::Messages::nl_putenv ("LC_MESSAGES=de_AT");
my $missing_locale = POSIX::setlocale (POSIX::LC_ALL() => '') ?
    '' : 'locale de_AT missing';

for (0 .. 9) {
	my $translation = dnpgettext (existing => $context, $strings[0], $strings[1], $_);
	skip $missing_locale,
		$_ == 1 ? 'Einzahl 2' eq $translation : 'Mehrzahl 2' eq $translation;
}

Locale::Messages::nl_putenv ("LANGUAGE=C");
Locale::Messages::nl_putenv ("LC_ALL=C");
Locale::Messages::nl_putenv ("LANG=C");
Locale::Messages::nl_putenv ("LC_MESSAGES=C");

POSIX::setlocale (POSIX::LC_ALL() => '');

$bound_dir = bindtextdomain additional => $locale_dir;

ok defined $bound_dir &&
	File::Spec->catdir ($locale_dir) eq File::Spec->catdir ($bound_dir);

for (0 .. 9) {
	my $translation = dnpgettext (additional => $context, $strings[0], $strings[1], $_);
	ok $_ == 1 ? 'Singular' eq $translation : 'Plural' eq $translation;
}

Locale::Messages::nl_putenv ("LANGUAGE=de_AT");
Locale::Messages::nl_putenv ("LC_ALL=de_AT");
Locale::Messages::nl_putenv ("LANG=de_AT");
Locale::Messages::nl_putenv ("LC_MESSAGES=de_AT");

POSIX::setlocale (POSIX::LC_ALL() => '');

for (0 .. 40) {
	my $translation = dnpgettext (additional => $context, $strings[0], $strings[1], $_);
	my $plural = ($_ == 1 ? 0 : 
				  $_ % 10 == 2 ? 1 : 
				  $_ % 10 == 3 || $_ %10 == 4 ? 2 : 3);
	skip $missing_locale, "Numerus 2:$plural" eq $translation;
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

