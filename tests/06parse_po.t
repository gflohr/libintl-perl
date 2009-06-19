#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use Locale::TextDomain qw (libintl-perl);
use Locale::POFile;

use constant NUM_TESTS => 19;
use constant NUM_MESSAGES => 3;

BEGIN {
	plan tests => NUM_TESTS;
}

my $po_dir = __FILE__;
$po_dir =~ s{06parse_po.t$}{po/parser/};

my $po_file = $po_dir . 'basic.de.po';

eval "require Locale::POFile";
ok !$@;

my $bad_po = Locale::POFile->new;
ok $bad_po;
ok !$bad_po->parse($po_file . 'not.there');
ok 1 == $bad_po->numberOfErrors;
ok 0 == $bad_po->numberOfMessages;
ok $bad_po->numberOfMessages == $bad_po->messages;

my $po = Locale::POFile->new;
ok $po;
ok $po->parse($po_file);
ok 0 == $po->numberOfErrors;
ok NUM_MESSAGES ==$po->numberOfMessages;
ok $po->numberOfMessages == $po->messages;

open POFILE, "<$po_file" or die "Cannot open '$po_file': $!";
ok $po->parse(\*POFILE);
ok 0 == $po->numberOfErrors;
ok NUM_MESSAGES ==$po->numberOfMessages;
ok $po->numberOfMessages == $po->messages;

open POFILE, "<$po_file" or die "Cannot open '$po_file': $!";
my $content = join '', <POFILE>;
ok $po->parse(\$content);
ok 0 == $po->numberOfErrors;
ok NUM_MESSAGES ==$po->numberOfMessages;
ok $po->numberOfMessages == $po->messages;

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
