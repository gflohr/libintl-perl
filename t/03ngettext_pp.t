#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 85;

use Locale::Messages qw (bindtextdomain textdomain ngettext);
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

$ENV{LANGUAGE} = $ENV{LC_ALL} = $ENV{LANG} = $ENV{LC_MESSAGES} = 'C';
delete $ENV{OUTPUT_CHARSET};

POSIX::setlocale (POSIX::LC_ALL() => 'C');

my $locale_dir = $0;
$locale_dir =~ s,/[^/]+$,, or $locale_dir = '.';
$locale_dir .= '/locale';

bindtextdomain not_here => $locale_dir;
textdomain 'not_here';

my @strings = qw (Singular Plural);
for (0 .. 9) {
	my $translation = ngettext (@strings, $_);
	ok $_ == 1 ? 'Singular' eq $translation : 'Plural' eq $translation;
}

my $textdomain = 'existing';
$ENV{LANGUAGE} = $ENV{LC_ALL} = $ENV{LANG} = $ENV{LC_MESSAGES} = 'C';

POSIX::setlocale (POSIX::LC_ALL() => 'C');

my $bound_dir = bindtextdomain $textdomain => $locale_dir;

ok defined $bound_dir && $locale_dir eq $bound_dir;

my $bound_domain = textdomain $textdomain;

ok  defined $bound_domain && $textdomain eq $bound_domain;

for (0 .. 9) {
	my $translation = ngettext (@strings, $_);
	ok $_ == 1 ? 'Singular' eq $translation : 'Plural' eq $translation;
}

$ENV{LANGUAGE} = $ENV{LC_ALL} = $ENV{LANG} = $ENV{LC_MESSAGES} = 'de_AT';

POSIX::setlocale (POSIX::LC_ALL() => 'de_AT');

for (0 .. 9) {
	my $translation = ngettext (@strings, $_);
	ok $_ == 1 ? 'Einzahl' eq $translation : 'Mehrzahl' eq $translation;
}

$textdomain = 'additional';
$ENV{LANGUAGE} = $ENV{LC_ALL} = $ENV{LANG} = $ENV{LC_MESSAGES} = 'C';

POSIX::setlocale (POSIX::LC_ALL() => 'C');

$bound_dir = bindtextdomain $textdomain => $locale_dir;

ok defined $bound_dir && $locale_dir eq $bound_dir;

$bound_domain = textdomain $textdomain;

ok  defined $bound_domain && $textdomain eq $bound_domain;

for (0 .. 9) {
	my $translation = ngettext (@strings, $_);
	ok $_ == 1 ? 'Singular' eq $translation : 'Plural' eq $translation;
}

$ENV{LANGUAGE} = $ENV{LC_ALL} = $ENV{LANG} = $ENV{LC_MESSAGES} = 'de_AT';

POSIX::setlocale (POSIX::LC_ALL() => 'de_AT');

for (0 .. 40) {
	my $translation = ngettext (@strings, $_);
	my $plural = ($_ == 1 ? 0 : 
				  $_ % 10 == 2 ? 1 : 
				  $_ % 10 == 3 || $_ %10 == 4 ? 2 : 3);
	ok "Numerus $plural" eq $translation;
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

