#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 6;

use Locale::Messages qw (bindtextdomain textdomain gettext nl_putenv);
use Locale::gettext_pp;
use POSIX;
use File::Spec;

BEGIN {
    my $selected = Locale::Messages->select_package ('gettext_dumb');
    if (!$selected || $selected ne 'gettext_dumb') {
    #my $selected = Locale::Messages->select_package ('gettext_xs');
    #if (!$selected || $selected ne 'gettext_xs') {
        print "1..1\nnot ok # Locale::gettext_dumb does not compile: $@!\n";
	exit 111;
    }
    plan tests => NUM_TESTS;
}

my $locale_dir = $0;
$locale_dir =~ s,[^\\/]+$,, or $locale_dir = '.';
$locale_dir .= '/LocaleData';

my $textdomain = 'existing';
my $bound_dir = bindtextdomain $textdomain => $locale_dir;

ok defined $bound_dir;
ok (File::Spec->catdir ($bound_dir), File::Spec->catdir ($locale_dir));

my $bound_domain = textdomain $textdomain;

ok defined $bound_domain;
ok $bound_domain, $textdomain;

nl_putenv "LANGUAGE=fr_FR";
ok gettext "January", "Janvier";

# there is only fr_FR in the catalogs, test if there is a fallback to fr_FR
nl_putenv "LANGUAGE=fr";
ok gettext "January", "Janvier";

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
