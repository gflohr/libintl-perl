#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 4;

use Locale::Messages qw (bindtextdomain textdomain gettext);
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
Locale::Messages::nl_putenv ("LANGUAGE=ab_CD:ef_GH:de_AT:de");
Locale::Messages::nl_putenv ("OUTPUT_CHARSET=iso-8859-1");

my $bound_dir = bindtextdomain $textdomain => $locale_dir;

ok defined $bound_dir &&
	File::Spec->catdir ($locale_dir) eq File::Spec->catdir ($bound_dir);

my $bound_domain = textdomain $textdomain;

ok  defined $bound_domain && $textdomain eq $bound_domain;

# Austrian German has precedence.
ok 'Jänner' eq gettext ('January');

Locale::Messages::nl_putenv ("LANGUAGE=ab_CD:ef_GH:de:de_AT");
ok 'Februar' eq gettext ('February'); # not 'Feber'!

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
