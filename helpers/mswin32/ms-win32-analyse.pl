#! /usr/bin/env perl

use strict;
use v5.10;

use POSIX qw(setlocale LC_ALL);
use Encode;
use Locale::Codes;

binmode STDOUT, 'encoding(utf8)';

my ($listfile) = @ARGV or die "usage: $0 LOCALE-LIST";

open my $fh, '<', $listfile
    or die "$listfile: $!";
my %locales;

my %variants = (
    Cyrl => {
        unix => 'cyrillic',
        name => 'Cyrillic',
    },
    Latn => {
        unix => 'latin',
        name => 'Latin',
    },
    Hans => {
        unix => '???', # Codeset ...
        name => 'Simplified',
    },
    Hant => {
        unix => '???', # Codeset ...
        name => 'Traditional',
    },
    Vaii => {
        unix => '???',
        name => 'Vai',
    },
    Tfng => {
        unix => '???',
        name => 'Tifinagh',
    },
    Guru => {
        unix => '???',
        name => 'Gurmukhi',
    },
    Mong => {
        unix => '???',
        name => 'Mongolian',
    }
);

my %regions = (
    VALENCIA => 'Valencian', # e.g. CA-ES-VALENCIA
    POSIX => 'Computer', # e.g. en-US-POSIX
);

say "Name;English Name;Language;Language Code;ISO Language;Language-X;Country;Country Code;ISO Country;Country X;Variant;Country Code;Region;Locale ID;Locale;Code Page";
while (my $line = <$fh>) {
    chomp $line;
    next if $line =~ /^#/;
    my ($name, $english_name) = split /:/, $line;

    my $language = $english_name;
    my $country;

    if ($language =~ s/ \((.*)\)$//) {
        $country = $1;
    }

    my @code = split /-/, $name;
    my $language_code = shift @code;
    my $variant;
    if (exists $variants{$code[0]}) {
        my $variant_code = shift @code;
        $variant = $variants{$variant_code}->{name};
        $country =~ s/^$variant(?:, )?//;
    }
    my ($country_code, $region);
    if (@code) {
        $country_code = shift @code;
    }
    if (@code) {
        $region = shift @code;
    }

    my $locale_id = $language;
    $locale_id .= " ($variant)" if defined $variant;
    $locale_id .= '_' . $country if defined $country && length $country;

    my $locale = setlocale LC_ALL, $locale_id;

    my $codepage;
    if ($locale =~ s/(?:\.(.+))$//) {
        $codepage = $1;
    }

    my $language_codeset = 2 == length $language_code ? 'alpha-2' : 'alpha-3';
    my $lc = Locale::Codes->new('language');
    my $iso_language = $lc->code2name($language_code, $language_codeset);
    my $language_x = $language ne $iso_language;

    my $country_codeset = 2 == length $country_code ? 'alpha-2' : 'alpha-3';
    my $cc = Locale::Codes->new('country');
    my $iso_country = $cc->code2name($country_code, $country_codeset);
    my $country_x = $country ne $iso_country;
    say "$name;$english_name;$language;$language_code;$iso_language;$language_x;$country;$country_code;$iso_country;$country_x;$variant;$country_code;$region;$locale_id;$locale;$codepage";
}
