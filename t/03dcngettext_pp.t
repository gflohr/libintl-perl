#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 83;

use Locale::Messages qw (bindtextdomain dcngettext LC_MESSAGES);
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
$locale_dir =~ s,[^\\/]+$,, or $locale_dir = '.';
$locale_dir .= '/locale';

bindtextdomain not_here => $locale_dir;

my @strings = qw (Singular Plural);
for (0 .. 9) {
	my $translation = dcngettext (not_here => @strings, $_, LC_MESSAGES);
	ok $_ == 1 ? 'Singular' eq $translation : 'Plural' eq $translation;
}

$ENV{LANGUAGE} = $ENV{LC_ALL} = $ENV{LANG} = $ENV{LC_MESSAGES} = 'C';

POSIX::setlocale (POSIX::LC_ALL() => 'C');

my $bound_dir = bindtextdomain existing => $locale_dir;

ok defined $bound_dir && $locale_dir eq $bound_dir;

for (0 .. 9) {
	my $translation = dcngettext (existing => @strings, $_, LC_MESSAGES);
	ok $_ == 1 ? 'Singular' eq $translation : 'Plural' eq $translation;
}

$ENV{LANGUAGE} = $ENV{LC_ALL} = $ENV{LANG} = $ENV{LC_MESSAGES} = 'de_AT';

POSIX::setlocale (POSIX::LC_ALL() => 'de_AT');

for (0 .. 9) {
	my $translation = dcngettext (existing => @strings, $_, LC_MESSAGES);
	ok $_ == 1 ? 'Einzahl' eq $translation : 'Mehrzahl' eq $translation;
}

$ENV{LANGUAGE} = $ENV{LC_ALL} = $ENV{LANG} = $ENV{LC_MESSAGES} = 'C';

POSIX::setlocale (POSIX::LC_ALL() => 'C');

$bound_dir = bindtextdomain additional => $locale_dir;

ok defined $bound_dir && $locale_dir eq $bound_dir;

for (0 .. 9) {
	my $translation = dcngettext (additional => @strings, $_, LC_MESSAGES);
	ok $_ == 1 ? 'Singular' eq $translation : 'Plural' eq $translation;
}

$ENV{LANGUAGE} = $ENV{LC_ALL} = $ENV{LANG} = $ENV{LC_MESSAGES} = 'de_AT';

POSIX::setlocale (POSIX::LC_ALL() => 'de_AT');

for (0 .. 40) {
	my $translation = dcngettext (additional => @strings, $_, LC_MESSAGES);
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

