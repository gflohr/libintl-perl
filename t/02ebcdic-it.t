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

my $cd_int = Locale::Recode->new (from => 'EBCDIC-IT',
			     		  		 to => 'INTERNAL');
ok !$cd_int->getError;

my $cd_utf8 = Locale::Recode->new (from => 'EBCDIC-IT',
								  to => 'UTF-8');
ok !$cd_utf8->getError;

my $cd_rev = Locale::Recode->new (from => 'INTERNAL',
								 to => 'EBCDIC-IT');
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
							   to => 'EBCDIC-IT',
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
		return pack ("C2", 
			(0xc0 | (($ucs4 >> 6) & 0x1f)),
			(0x80 | ($ucs4 & 0x3f)));
    } elsif ($ucs4 <= 0xffff) {
		return pack ("C3", 
			(0xe0 | (($ucs4 >> 12) & 0xf)),
			(0x80 | (($ucs4 >> 6) & 0x3f)),
			(0x80 | ($ucs4 & 0x3f)));
    } elsif ($ucs4 <= 0x1fffff) {
		return pack ("C4", 
			(0xf0 | (($ucs4 >> 18) & 0x7)),
			(0x80 | (($ucs4 >> 12) & 0x3f)),
			(0x80 | (($ucs4 >> 6) & 0x3f)),
			(0x80 | ($ucs4 & 0x3f)));
    } elsif ($ucs4 <= 0x3ffffff) {
		return pack ("C5", 
			(0xf0 | (($ucs4 >> 24) & 0x3)),
			(0x80 | (($ucs4 >> 18) & 0x3f)),
			(0x80 | (($ucs4 >> 12) & 0x3f)),
			(0x80 | (($ucs4 >> 6) & 0x3f)),
			(0x80 | ($ucs4 & 0x3f)));
    } else {
		return pack ("C6", 
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
0x04	0x009C
0x05	0x0009
0x06	0x0086
0x07	0x007F
0x08	0x0097
0x09	0x008D
0x10	0x0010
0x11	0x0011
0x12	0x0012
0x13	0x0013
0x14	0x009D
0x15	0x0085
0x16	0x0008
0x17	0x0087
0x18	0x0018
0x19	0x0019
0x20	0x0080
0x21	0x0081
0x22	0x0082
0x23	0x0083
0x24	0x0084
0x25	0x000A
0x26	0x0017
0x27	0x001B
0x28	0x0088
0x29	0x0089
0x30	0x0090
0x31	0x0091
0x32	0x0016
0x33	0x0093
0x34	0x0094
0x35	0x0095
0x36	0x0096
0x37	0x0004
0x38	0x0098
0x39	0x0099
0x40	0x0020
0x50	0x0026
0x60	0x002D
0x61	0x002F
0x79	0x00F9
0x81	0x0061
0x82	0x0062
0x83	0x0063
0x84	0x0064
0x85	0x0065
0x86	0x0066
0x87	0x0067
0x88	0x0068
0x89	0x0069
0x91	0x006A
0x92	0x006B
0x93	0x006C
0x94	0x006D
0x95	0x006E
0x96	0x006F
0x97	0x0070
0x98	0x0071
0x99	0x0072
