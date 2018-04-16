#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test::More;

use Locale qw(':libintl_h');

my $loc = Locale->new(LC_ALL_MASK, "C");

ok $loc;

done_testing();

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
