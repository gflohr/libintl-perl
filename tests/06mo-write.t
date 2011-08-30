#! /usr/local/bin/perl -w

# vim: syntax=perl
# vim: tabstop=4

use strict;

use Test;

use constant NUM_TESTS => 3;

use Locale::Catalog::Format::MO;
use Locale::Catalog::Message;

BEGIN {
	plan tests => NUM_TESTS;
}

sub read_mo_file;

my $mo_directory = __FILE__;
$mo_directory =~ s{[^\\/]+$}{} or $mo_directory = '.'; # /
$mo_directory .= '/mo';

my $catalog = Locale::Catalog::Format::MO->new;
ok defined $catalog;
ok '' eq $catalog->dump;

my $message = Locale::Catalog::Message->new(msgid => 'simple',
                                            msgstr => 'einfach');
ok $catalog->add($message);
# Our test mo files were written on little endian machines.
ok 'V', $catalog->byteOrder('V');
my $dump = $catalog->dump;
ok '' ne $dump;
my $simple_mo = read_mo_file 'simple.mo';
ok $simple_mo, $dump;

sub read_mo_file {
    my ($file) = @_;
    
    my $path = $mo_directory . '/' . $file;
    
    open HANDLE, "<$path" or die "Cannot open '$path': $!\n";
    local $/;
    return <HANDLE>;
}
