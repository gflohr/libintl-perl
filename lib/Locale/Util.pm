#! /bin/false

# vim: set autoindent shiftwidth=4 tabstop=4:
# $Id: Util.pm,v 1.3 2007/02/06 13:41:26 guido Exp $

# Portable methods for locale handling.
# Copyright (C) 2002-2007 Guido Flohr <guido@imperia.net>,
# all rights reserved.

# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU Library General Public License as published
# by the Free Software Foundation; either version 2, or (at your option)
# any later version.
                                         
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Library General Public License for more details.

# You should have received a copy of the GNU Library General Public 
# License along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, 
# USA.

package Locale::Util;

use strict;

use constant DEBUG => 1;

use base qw (Exporter);

use vars qw (@EXPORT_OK);

@EXPORT_OK = qw (parse_http_accept_language
				 parse_http_accept_charset
				 set_locale);

# The following list maps languages to a rough guess of the country that
# is most likely to be meant if no locale info for the country alone is
# found.  I have assembled the list to the best of my knowledge, preferring
# the country that has the language as its official language, and in doubt
# listing the country that has the most speakers of that language.  Corrections
# are welcome.
use constant LANG2COUNTRY => {
    aa => 'ET', # Afar => Ethiopia
    ab => 'AB', # Abkhazian => Georgia
    # ae => '??', # Avestan => ??
    af => 'za',  # Afrikaans => South Africa
    am => 'ET', # Amharic => Ethiopia
    ar => 'EG', # Arabic => Egypt
    as => 'IN', # Assamese => India
    # ay => '??', # Aymara => ??
    az => 'AZ', # Azerbaijani => Azerbaijan
    ba => 'RU', # Bashkir => Russia
    be => 'BY', # Belarusian => Belarus
    bg => 'BG', # Bulgarian => Bulgaria
    bh => 'IN', # Bihari => India
    # bi => '??', # Bislama => ??
    bn => 'BD', # Bengali => Bangladesh
    bo => 'CN', # Tibetan => China
    br => 'FR', # Breton => France
    bs => 'BA', # Bosnian => Bosnia and Herzegovina
    ca => 'ES', # Catalan => Spain
    ce => 'RU', # Chechen => Russia
    # ch => '??', # Chamorro => ??
    co => 'FR', # Corsican => France
    cs => 'CZ', # Czech => Czech Republic
    # cu => '??', # Church Slavic
    # cv => '??', # Chuvash => ???
    cy => 'GB', # Welsh => United Kingdom
    da => 'DK', # Danish => Denmark
    de => 'DE', # German => Germany
    # dz => '??', # Dzongkha => ???
    en => 'US', # English => United States
    fa => 'IR', # Iran, Islamic Republic of
    fi => 'FI', # Finnish => Finland
    fj => 'FJ', # Fijian => Fiji
    fo => 'FO', # Faeroese => Faroe Islands
    fr => 'FR', # French => France
    fy => 'FY', # Frisian => Netherlands
    ga => 'IE', # Irish => Ireland
    gd => 'GB', # Gaelic (Scots) => United Kingdom
    gl => 'ES', # Gallegan => Spain
    # Where is volume 9 of my lexicon? A lot missing here ...
    # gn => '??', # Guarani => ??
    gu => 'IN', # Gujarati => IN
    gv => 'GB', # Manx => United Kingdom
    # ha => '??', # Hausa => ??
    he => 'IL', # Hebrew => Israel
    hi => 'IN', # Hindi => India
    # ho => '??', # Hiri Motu => ??
    hr => 'HR', # Croatian
    hu => 'HU', # Hungarian => Hungary
    hy => 'AM', # Armenian => Armenia
    # hz => '??', # Herero => ??
    # ia => '??', # Interlingua (aka "latino sine flexione") => ??
    id => 'ID', # Indonesian => Indonesia
    # ie => '??', # Interlingue => ???
    ik => 'US', # Inupiaq => United States
    is => 'IS', # Icelandic => Iceland
    it => 'IT', # Italian => Italy
    # iu => 'CA', # Inuktitut => Canada ???
    iw => 'IL', # Hebrew => Israel
    ja => 'JP', # Japanese => Japan
    jw => 'ID', # Javanese => Indonesia
    ka => 'GE', # Georgian => Georgia
    ki => 'KE', # Kikuyu => Kenya
    # kj => '??', # Kuanyama => ??
    kk => 'KZ', # Kazakh => Kazakhstan
    kl => 'GL', # Kalaallisut => Greenland
    km => 'KH', # Khmer => Cambodia
    kn => 'IN', # Kannada => India
    ko => 'KR', # Korean => Korea, Republic of (more speakers than North Korea)
    ks => 'IN', # Kashmiri => India
    ku => 'TR', # Kurdish => Turkey
    kv => 'RU', # Komi => Russia
    kw => 'GB', # Cornish => United Kingdom
    # ky => '??', # Kirghyz => What's the country code?
    la => 'VA', # Latin => Holy See (Vatican City State)
    lb => 'LU', # Letzeburgesch => Luxembourg
    # ln => '??', # Lingala => ??
    lo => 'LA', # Lao => Lao People's Democratic Republic
    lt => 'LT', # Lithuanian => Lithuania
    lv => 'LV', # Latvian => Latvia
    mg => 'MG', # Malagasy => Madagascar
    mh => 'MH', # Marshall => Marshall Islands
    mi => 'NZ', # Maori => New Zealand
    mk => 'MK', # Macedonian => Macedonia, the Former Yugoslav Republic of
    ml => 'IN', # Malayalam => India
    mn => 'MN', # Mongolian => Mongolia
    mr => 'IN', # Marathi => India
    ms => 'MY', # Malay => Malaysia (FIXME: not really sure ...)
    mt => 'MT', # Maltese => Malta
    my => 'MM', # Burmese => Myanmar
    na => 'NR', # Nauru => Nauru
    nb => 'NO', # Norwegian Bokmål => Norway
    nd => 'ZA', # Ndebele, North => South Africa
    ne => 'NP', # Nepali => Nepal
    # ng => '??', # Ndonga => ??
    nl => 'NL', # Dutch => Netherlands
    nn => 'NO', # Norwegian Nynorsk => Norway
    no => 'NO', # Norwegian => Norway
    nr => 'ZA', # Ndebele, South => South Africa
    nv => 'US', # Navajo => United States
    # ny => '??', # Chichewa; Nyanja => ??
    oc => 'FR', # Occitan (post 1500) => France
    om => 'ET', # Oromo => Ethiopia
    or => 'IN', # Oriya => India
    os => 'RU', # Ossetian; Ossetic => Russia (FIXME: Or Georgia?)
    pa => 'IN', # Panjabi => India
    pi => 'IN', # Pali => India (FIXME: Or Thailand, Sri Lanka, Myanmar,
                # Cambodia)
    pl => 'PL', # Polish => Poland
    # ps => '??', # Pushto => ??
    pt => 'PT', # Portuguese => Portugal (following our rules this should
                # actually be Brazil but that would be to unrealistic,
                # people from Brazil set their locale to pt_BR).
    qu => 'PE', # Quechua => Peru
    rm => 'CH', # Rhaeto-Romance => Switzerland
    rn => 'RW', # Rundi => Rwanda
    ro => 'RO', # Romanian => Romania
    ru => 'RU', # Russian => Russia
    # rw => '??', # Kinyarwanda => ??
    sa => 'IN', # Sanskrit => India
    sc => 'IT', # Sardinian => Italy
    sd => 'IN', # Sindhi => India
    # se => '??', # Sami => ??
    # sg => '??', # Sango => ??
    si => 'LK', # Sinhalese => Sri Lanka
    sk => 'SK', # Slovakian => Slovakia
    sl => 'SL', # Slovenian => Slovenia
    sm => 'WS', # Samoan => Samoa
    sh => 'ZW', # Shona => Zimbabwe (FIXME: Rather Mozambique?)
    so => 'SO', # Somali => Somalia
    sq => 'AL', # Albanian => Albania
    sr => 'YU', # Serbian => Yugoslavia
    # ss => '??', # Swati => ?? (Swaziland?)
    st => 'LS', # Sotho => Lesotho
    su => 'IN', # Sundanese => Indonesia
    sv => 'SE', # Swedish => Sweden
    sw => 'TZ', # Suaheli => Tanzania, United Republic of
    ta => 'LK', # Tamil => Sri Lanka
    te => 'IN', # Telugu => India
    tg => 'TJ', # Tajik => Tajikistan
    th => 'TH', # Thai => Thailand
    ti => 'ER', # Tigrinya => Eritrea
    tk => 'TM', # Turkmen => Turkmenistan
    tl => 'PH', # Tagalog => Philippines
    tn => 'BW', # Tswana => Botswana
    to => 'TO', # Tonga => Tonga
    tr => 'TR', # Turkish => Turkish
    tt => 'RU', # Tatar => Russia
    ## tw => '??', # Twi => ??
    ug => 'CN', # Uighur => China
    uk => 'UA', # Ukrainian => Ukraine
    ur => 'PK', # Urdu => Pakistan
    uz => 'UZ', # Uzbek => Uzbekistan
    vi => 'VN', # Vietnamese => Vietnam
    # vo => '??', # Volapük => Nowhere
    # wo => '??', # Wolof => ??
    xh => 'ZA', # Xhosa => South Africa
    yi => 'IL', # Yiddish => Israel (FIXME: Rather United States?)
    yo => 'NG', # Yoruba => Nigeria
    # za => '??', # Zhuang => ??
    zh => 'CN', # Chinese => China
    zu => 'ZA', # Zulu => South Africa
};

my $locale_cache;

sub parse_http_accept_language {
	my ($string) = @_;

	my @tokens = split / *, */, $string;
	
	my %retval;
	foreach my $token (@tokens) {
		my $quality = 1;
		# This RE is more forgiving than the standard.  It accepts
		# values greater than 1.0 and with more fractional digits
		# than 3.
		if ($token =~ s/ *; *q *= *([0-9]+(?:\.([0-9]+))?)$//) {
			$quality = $1;
		}
		$retval{$token} = $quality;
	}

	# RFC 2616 only allows 1-8 characters for language and country
	# but we are more forgiving.
	return grep { 
		/^[A-Za-z]+(?:-[A-Za-z]+)?$/
		} map {
			$_ = 'C' if $_ eq '*'; $_
		}	sort { 
			$retval{$b} <=> $retval{$a} 
		} keys %retval;
}

sub parse_http_accept_charset {
	my ($string) = @_;

	my @tokens = split / *, */, $string;
	
	my %retval;
	foreach my $token (@tokens) {
		my $quality = 1;
		# This RE is more forgiving than the standard.  It accepts
		# values greater than 1.0 and with more fractional digits
		# than 3.
		if ($token =~ s/ *; *q *= *([0-9]+(?:\.([0-9]+))?)$//) {
			$quality = $1;
		}
		$retval{$token} = $quality;
	}

	return grep { 
		# This is really allowed in character set names ...
		/^[-!\#\$\%\&\'\+\.0-9A-Z_\`a-z\|\~]+$/
		} map {
			$_ = undef if $_ eq '*'; $_
		}	sort { 
			$retval{$b} <=> $retval{$a} 
		} keys %retval;
}

sub set_locale {
	my ($category, $language, $country, $charset) = @_;
	
	require POSIX;

	my $set_locale;
	if (exists $locale_cache->{$language}->{$country}->{$charset}) {
		my $retval = $locale_cache->{$language}->{$country}->{$charset};
		return unless defined $retval;
		return;
	}
	# Initialize the cache with the undefined value so that we can do
	# error returns without setting it.
	$locale_cache->{$language}->{$country}->{$charset} = undef;

	my $windows = ($^O !~ /darwin/i && $^O =~ /win/i) ? 1 : 0;
$windows = 1;
	if ($windows) {
		return &__set_locale_windows;
	}
	
	my $set_language;
	
	# First we try to only use the language.
	my @languages = ($language);
	my @lc_languages = map { lc $_ } @languages;
	my @uc_languages = map { uc $_ } @languages;
	my %seen = ();

	foreach my $language (@languages, @lc_languages, @uc_languages) {
		next if $seen{$language}++;
		warn "Trying lingua only setlocale '$language'.\n" if DEBUG;
		my $result = POSIX::setlocale ($category, $language);
		if ($result) {
			$set_locale = $set_language = $result if $result;
			last;
		}
	}
	
	# Now try it with the country appended.
 COMBI: foreach my $language (@languages, @lc_languages, @uc_languages) {
		my @countries = defined $country && length $country ? ($country) : ();
		my @uc_countries = map { uc $_ } @countries;
		my @lc_countries = map { uc $_ } @countries;
		foreach my $country (@countries, @uc_countries, @lc_countries,
							 LANG2COUNTRY->{lc $language},
							 lc LANG2COUNTRY->{lc $language}) {
			next unless defined $country && length $country;
			my $try = $language . '_' . $country;
			next if $seen{$try}++;
			warn "Trying setlocale '$try'.\n" if DEBUG;
			my $result = POSIX::setlocale ($category, $try);
			if ($result) {
				$set_locale = $result;
				last COMBI;
			}
		}
	}

	# The trickiest part is the character set.  We give up our search
	# if we weren't successful so far.
	return unless defined $set_locale && length $set_locale;

	unless (defined $charset && length $charset) {
		$locale_cache->{$language}->{$country}->{$charset} = $set_locale;
		return $set_locale;
	}
	
	my @charsets = ($charset);
	my $cleaned = $charset;
	push @charsets, $cleaned if $cleaned =~ s/-//g;

	my @lc_charsets = map { lc $charset } @charsets;
	my @uc_charsets = map { uc $charset } @charsets;
	%seen = ();
	foreach my $charset (@charsets, @lc_charsets, @uc_charsets) {
		my $try = $set_locale . '.' . $charset;
		next if $seen{$try}++;
		warn "Trying setlocale '$try'.\n" if DEBUG;
		my $result = POSIX::setlocale ($category, $try);
		if ($result) {
			$set_locale = $result;
			last;
		}
	}

	return unless defined $set_locale && length $set_locale;

	$locale_cache->{$language}->{$country}->{$charset} = $set_locale;
	return $set_locale;
}

sub __set_locale_windows {
	my ($category, $language, $country, $charset) = @_;

	require Locale::Language;
	require Locale::Country;

	my $set_language;
	
	# First we try to only use the language.
	my $long_language = Locale::Language::code2language (lc $language);
	my @languages = ($long_language, $language);
	my %seen = ();
	foreach my $language (@languages) {
		next if $seen{$language}++;
		warn "Trying lingua only setlocale '$language'.\n" if DEBUG;
		my $result = POSIX::setlocale ($category, $language);
		if ($result) {
			$set_locale = $set_language = $result if $result;
			last;
		}
	}
	
	# Now try it with the country appended.
 COMBI: foreach my $language (@languages) {
	    my @short_countries = ($country, LANG2COUNTRY->{lc $language});
		my @countries = map { 
			Locale::Country::code2country ($_ } 
			} grep { defined $_ } @short_countries;
		foreach my $country (@countries) {
			next unless defined $country && length $country;
			my $try = $language . '_' . $country;
			next if $seen{$try}++;
			warn "Trying setlocale '$try'.\n" if DEBUG;
			my $result = POSIX::setlocale ($category, $try);
			if ($result) {
				$set_locale = $result;
				last COMBI;
			}
		}
	}


	die;
}

1;

__END__

=head1 NAME

Locale::Util - Portable l10n and i10n functions

=head1 SYNOPSIS

  use Locale::Util;

  my @linguas = parse_http_accept ($ENV{HTTP_ACCEPT_LANGUAGE});

=head1 DESCRIPTION

This module provides portable functions dealing with localization
(l10n) and internationalization(i10n).  It doesn't export anything
by default.  

=head1 FUNCTIONS

=over 4

=item B<parse_http_accept_language STRING>

Parses a string as passed in the HTTP header "Accept-Language".
It returns a list of tokens sorted by the quality value, see RFC 2616 
for details.

Example:

  parse_http_accept ("fr-fr, fr; q=0.7, de; q=0.3");

This means: Give me French for France with a quality value of 1.0
(the maximum).  Otherwise I will take any other French version 
(quality 0.7), German has a quality of 0.3 for me.

The function will return a list of tokens in the order of their quality
values, in this case "fr-fr", "fr" and "de".

The function is more forgiving than RFC 2616.  It accepts quality
values greater than 1.0 and with more than 3 decimal places.  It
also accepts languages and country names with more than 8 characters.
The language "*" is translated into "C".

=item B<parse_http_accept_charset STRING>

Parses a string as passed in the HTTP header "Accept-Charset".
It returns a list of tokens sorted by the quality value, see RFC 2616 
for details.

The special character set "*" (means all character sets) will be
translated to the undefined value.

=back

=head1 BUGS

If you think you have spotted a new bug, you can share it with others in
the bug tracking system at
http://rt.cpan.org/NoAuth/Bugs.html?Dist=Template-Plugin-Gettext.

=head1 AUTHOR

Copyright (C) 2002-2007, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(L<http://www.imperia.net/>).

=head1 SEE ALSO

Encode(3), iconv(3), iconv(1), recode(1), perl(1)

=cut
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
=cut
