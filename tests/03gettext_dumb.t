#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 12;

use Locale::Messages qw (bindtextdomain textdomain gettext nl_putenv);
use Locale::gettext_pp;
use POSIX;
use File::Spec;

BEGIN {
    my $selected = Locale::Messages->select_package ('gettext_dumb');
    if (!$selected || $selected ne 'gettext_dumb') {
        print "1..1\nnot ok # Locale::gettext_dumb does not compile: $@!\n";
	exit 111;
    }
    plan tests => NUM_TESTS;
}

ok Locale::gettext_dumb::LC_CTYPE(), Locale::gettext_pp::LC_CTYPE();
ok Locale::gettext_dumb::LC_NUMERIC(), Locale::gettext_pp::LC_NUMERIC();
ok Locale::gettext_dumb::LC_TIME(), Locale::gettext_pp::LC_TIME();
ok Locale::gettext_dumb::LC_COLLATE(), Locale::gettext_pp::LC_COLLATE();
ok Locale::gettext_dumb::LC_MONETARY(), Locale::gettext_pp::LC_MONETARY();
ok Locale::gettext_dumb::LC_MESSAGES(), Locale::gettext_pp::LC_MESSAGES();
ok Locale::gettext_dumb::LC_ALL(), Locale::gettext_pp::LC_ALL();

# Unset all environment variables and reset the locale to POSIX.
nl_putenv "MESSAGE_CATALOG";
nl_putenv "LANGUAGE";
nl_putenv "LANG";
nl_putenv "LC_ALL";
nl_putenv "LC_MESSAGES";

POSIX::setlocale (POSIX::LC_ALL(), "POSIX");

my $locale_dir = $0;
$locale_dir =~ s,[^\\/]+$,, or $locale_dir = '.';
$locale_dir .= '/LocaleData';

my $textdomain = 'existing';
my $bound_dir = bindtextdomain $textdomain => $locale_dir;

ok defined $bound_dir;
ok (File::Spec->catdir ($bound_dir), File::Spec->catdir ($bound_dir));

# No translation.
ok gettext "December", "December";

# Point to an explicit file.
my $path_sep;
if ($^O !~ /darwin/i && $^O =~ /win/i) {
    $path_sep = ';';
} else {
    $path_sep = ':';
}

my $message_catalogs = "$locale_dir/xy_XY/LC_MESSAGES/existing.mo";
$message_catalogs .= "$path_sep$locale_dir/xy/LC_MESSAGES/existing.mo";
nl_putenv "MESSAGE_CATALOGS=$message_catalogs";

ok gettext "December", "Dezember";
# Make sure that the first path takes precedence.
ok gettext "February", "Feber";

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
