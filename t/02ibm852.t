#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

BEGIN {
	plan tests => 7;
}

use Locale::Recode;

sub int2utf8;

my $codes = {};
while (<DATA>) {
	my ($code, $ucs4, undef) = split /\s+/, $_;
	$codes->{oct $code} = oct $ucs4;
}

my $cd_int = Locale::Recode->new (from => 'IBM852',
			     		  		 to => 'INTERNAL');
ok !$cd_int->getError;

my $cd_utf8 = Locale::Recode->new (from => 'IBM852',
								  to => 'UTF-8');
ok !$cd_utf8->getError;

my $cd_rev = Locale::Recode->new (from => 'INTERNAL',
								 to => 'IBM852');
ok !$cd_rev->getError;

# Convert into internal representation.
my $result_int = 1;
while (my ($code, $ucs4) = each %$codes) {
	my $outbuf = chr $code;
	my $result = $cd_int->recode ($outbuf);
	unless ($result && $outbuf->[0] == $ucs4) {
		$result_int = 0;
		last;
	}
}
ok $result_int;

# Convert to UTF-8.
my $result_utf8 = 1;
while (my ($code, $ucs4) = each %$codes) {
    my $outbuf = chr $code;
    my $result = $cd_utf8->recode ($outbuf);
    unless ($result && $outbuf eq int2utf8 $ucs4) {
        $result_utf8 = 0;
        last;
    }
}
ok $result_utf8;

# Convert from internal representation.
my $result_rev = 1;
while (my ($code, $ucs4) = each %$codes) {
    my $outbuf = [ $ucs4 ];
    my $result = $cd_rev->recode ($outbuf);
    unless ($result && $code == ord $outbuf) {
        $result_int = 0;
        last;
    }
}
ok $result_int;

# Check handling of unknown characters.  This assumes that the 
# character set is a subset of US-ASCII.
my $test_string1 = [ unpack 'c*', ' Supergirl ' ];
$test_string1->[0] = 0xad0be;
$test_string1->[-1] = 0xbeefbabe;
my $test_string2 = [ unpack 'c*', 'Supergirl' ];

$cd_utf8 = Locale::Recode->new (from => 'INTERNAL',
							   to => 'IBM852',
							   unknown => 0x2a,  # Asterisk!
							  );
my $asterisk = [ (0x2a) ]; # Asterisk!
$result_utf8 = $cd_utf8->recode ($test_string1) &&
	$cd_utf8->recode ($test_string2) &&
		$cd_utf8->recode ($asterisk);
$test_string2 = $asterisk . $test_string2 . $asterisk;
ok $test_string1 eq $test_string2;

sub int2utf8
{
    my $ucs4 = shift;

    if ($ucs4 <= 0x7f) {
		return chr $ucs4;
    } elsif ($ucs4 <= 0x7ff) {
		return pack ("c2", 
			(0xc0 | (($ucs4 >> 6) & 0x1f)),
			(0x80 | ($ucs4 & 0x3f)));
    } elsif ($ucs4 <= 0xffff) {
		return pack ("c3", 
			(0xe0 | (($ucs4 >> 12) & 0xf)),
			(0x80 | (($ucs4 >> 6) & 0x3f)),
			(0x80 | ($ucs4 & 0x3f)));
    } elsif ($ucs4 <= 0x1fffff) {
		return pack ("c4", 
			(0xf0 | (($ucs4 >> 18) & 0x7)),
			(0x80 | (($ucs4 >> 12) & 0x3f)),
			(0x80 | (($ucs4 >> 6) & 0x3f)),
			(0x80 | ($ucs4 & 0x3f)));
    } elsif ($ucs4 <= 0x3ffffff) {
		return pack ("c5", 
			(0xf0 | (($ucs4 >> 24) & 0x3)),
			(0x80 | (($ucs4 >> 18) & 0x3f)),
			(0x80 | (($ucs4 >> 12) & 0x3f)),
			(0x80 | (($ucs4 >> 6) & 0x3f)),
			(0x80 | ($ucs4 & 0x3f)));
    } else {
		return pack ("c6", 
			(0xf0 | (($ucs4 >> 30) & 0x3)),
			(0x80 | (($ucs4 >> 24) & 0x1)),
			(0x80 | (($ucs4 >> 18) & 0x3f)),
			(0x80 | (($ucs4 >> 12) & 0x3f)),
			(0x80 | (($ucs4 >> 6) & 0x3f)),
			(0x80 | ($ucs4 & 0x3f)));
    }
}

# Local Variables:
# mode: perl
# perl-indent-level: 4
# perl-continued-statement-offset: 4
# perl-continued-brace-offset: 0
# perl-brace-offset: -4
# perl-brace-imaginary-offset: 0
# perl-label-offset: -4
# cperl-indent-level: 4
# cperl-continued-statement-offset: 2
# tab-width: 4
# End:

__DATA__
0x00	0x0000
0x01	0x0001
0x02	0x0002
0x03	0x0003
0x04	0x0004
0x05	0x0005
0x06	0x0006
0x07	0x0007
0x08	0x0008
0x09	0x0009
0x10	0x0010
0x11	0x0011
0x12	0x0012
0x13	0x0013
0x14	0x0014
0x15	0x0015
0x16	0x0016
0x17	0x0017
0x18	0x0018
0x19	0x0019
0x20	0x0020
0x21	0x0021
0x22	0x0022
0x23	0x0023
0x24	0x0024
0x25	0x0025
0x26	0x0026
0x27	0x0027
0x28	0x0028
0x29	0x0029
0x30	0x0030
0x31	0x0031
0x32	0x0032
0x33	0x0033
0x34	0x0034
0x35	0x0035
0x36	0x0036
0x37	0x0037
0x38	0x0038
0x39	0x0039
0x40	0x0040
0x41	0x0041
0x42	0x0042
0x43	0x0043
0x44	0x0044
0x45	0x0045
0x46	0x0046
0x47	0x0047
0x48	0x0048
0x49	0x0049
0x50	0x0050
0x51	0x0051
0x52	0x0052
0x53	0x0053
0x54	0x0054
0x55	0x0055
0x56	0x0056
0x57	0x0057
0x58	0x0058
0x59	0x0059
0x60	0x0060
0x61	0x0061
0x62	0x0062
0x63	0x0063
0x64	0x0064
0x65	0x0065
0x66	0x0066
0x67	0x0067
0x68	0x0068
0x69	0x0069
0x70	0x0070
0x71	0x0071
0x72	0x0072
0x73	0x0073
0x74	0x0074
0x75	0x0075
0x76	0x0076
0x77	0x0077
0x78	0x0078
0x79	0x0079
0x80	0x00C7
0x81	0x00FC
0x82	0x00E9
0x83	0x00E2
0x84	0x00E4
0x85	0x016F
0x86	0x0107
0x87	0x00E7
0x88	0x0142
0x89	0x00EB
0x90	0x00C9
0x91	0x0139
0x92	0x013A
0x93	0x00F4
0x94	0x00F6
0x95	0x013D
0x96	0x013E
0x97	0x015A
0x98	0x015B
0x99	0x00D6