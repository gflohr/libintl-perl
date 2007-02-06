#! /bin/false

# vim: set autoindent shiftwidth=4 tabstop=4:
# $Id: Util.pm,v 1.7 2007/02/06 18:43:39 guido Exp $

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

use constant DEBUG => 0;

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

# Source: http://msdn.microsoft.com/library/default.asp?url=/library/en-us/vclib/html/_crt_language_strings.asp
use constant WIN32LANGUAGE => {
    aa => "Afar",
    ab => "Abkhazian",
    ae => "Avestan",
    af => "Afrikaans",
    am => "Amharic",
    ar => "Arabic",
    as => "Assamese",
    ay => "Aymara",
    az => "Azerbaijani",
    ba => "Bashkir",
    be => "Belarusian",
    bg => "Bulgarian",
    bh => "Bihari",
    bi => "Bislama",
    bn => "Bengali",
    bo => "Tibetan",
    br => "Breton",
    bs => "Bosnian",
    ca => "Catalan",
    ce => "Chechen",
    ch => "Chamorro",
    co => "Corsican",
    cs => "Czech",
    cu => "Church Slavic",
    cv => "Chuvash",
    cy => "Welsh",
    da => "Danish",
    de => "German",
    dz => "Dzongkha",
    el => "Greek",
    en => "English",
    eo => "Esperanto",
    es => "Spanish",
    et => "Estonian",
    eu => "Basque",
    fa => "Persian",
    fi => "Finnish",
    fj => "Fijian",
    fo => "Faeroese",
    fr => "French",
    fy => "Frisian",
    ga => "Irish",
    gd => "Gaelic (Scots)",
    gl => "Gallegan",
    gn => "Guarani",
    gu => "Gujarati",
    gv => "Manx",
    ha => "Hausa",
    he => "Hebrew",
    hi => "Hindi",
    ho => "Hiri Motu",
    hr => "Croatian",
    hu => "Hungarian",
    hy => "Armenian",
    hz => "Herero",
    ia => "Interlingua",
    id => "Indonesian",
    ie => "Interlingue",
    ik => "Inupiaq",
    is => "Icelandic",
    it => "Italian",
    iu => "Inuktitut",
    ja => "Japanese",
    jw => "Javanese",
    ka => "Georgian",
    ki => "Kikuyu",
    kj => "Kuanyama",
    kk => "Kazakh",
    kl => "Kalaallisut",
    km => "Khmer",
    kn => "Kannada",
    ko => "Korean",
    ks => "Kashmiri",
    ku => "Kurdish",
    kv => "Komi",
    kw => "Cornish",
    ky => "Kirghiz",
    la => "Latin",
    lb => "Letzeburgesch",
    ln => "Lingala",
    lo => "Lao",
    lt => "Lithuanian",
    lv => "Latvian",
    mg => "Malagasy",
    mh => "Marshall",
    mi => "Maori",
    # Sorry, lads, but that is what M$ calls your language ...
    mk => "FYRO Macedonian",
    ml => "Malayalam",
    mn => "Mongolian",
    mo => "Moldavian",
    mr => "Marathi",
    ms => "Malay",
    mt => "Maltese",
    my => "Burmese",
    na => "Nauru",
    nb => "Norwegian (Bokmål)",
    nd => "Ndebele, North",
    ne => "Nepali",
    ng => "Ndonga",
    nl => "Dutch",
    nn => "Norwegian-Nynorsk",
    no => "Norwegian-Nynorsk",
    nr => "Ndebele, South",
    nv => "Navajo",
    ny => "Chichewa",
    oc => "Occitan (post 1500)",
    om => "Oromo",
    or => "Oriya",
    os => "Ossetian",
    pa => "Panjabi",
    pi => "Pali",
    pl => "Polish",
    ps => "Pushto",
    pt => "Portuguese",
    qu => "Quechua",
    rm => "Rhaeto-Romance",
    rn => "Rundi",
    ro => "Romanian",
    ru => "Russian",
    rw => "Kinyarwanda",
    sa => "Sanskrit",
    sc => "Sardinian",
    sd => "Sindhi",
    se => "Sami",
    sg => "Sango",
    si => "Sinhalese",
    sk => "Slovak",
    sl => "Slovenian",
    sm => "Samoan",
    sn => "Shona",
    so => "Somali",
    sq => "Albanian",
    sr => "Serbian",
    ss => "Swati",
    st => "Sotho",
    su => "Sundanese",
    sv => "Swedish",
    sw => "Swahili",
    ta => "Tamil",
    te => "Telugu",
    tg => "Tajik",
    th => "Thai",
    ti => "Tigrinya",
    tk => "Turkmen",
    tl => "Tagalog",
    tn => "Tswana",
    to => "Tonga",
    tr => "Turkish",
    ts => "Tsonga",
    tt => "Tatar",
    tw => "Twi",
    ug => "Uighur",
    uk => "Ukrainian",
    ur => "Urdu",
    uz => "Uzbek",
    vi => "Vietnamese",
    vo => "Volapuk",
    wo => "Wolof",
    xh => "Xhosa",
    yi => "Yiddish",
    yo => "Yoruba",
    za => "Zhuang",
    zh => "Chinese",
    zu => "Zulu",
};

# Source: http://msdn.microsoft.com/library/default.asp?url=/library/en-us/vclib/html/_crt_country_strings.asp
use constant WIN32COUNTRY => {
    ad => "Andorra",
    ae => "United Arab Emirates",
    af => "Afghanistan",
    ag => "Antigua and Barbuda",
    ai => "Anguilla",
    al => "Albania",
    am => "Armenia",
    an => "Netherlands Antilles",
    ao => "Angola",
    aq => "Antarctica",
    ar => "Argentina",
    as => "American Samoa",
    at => "Austria",
    au => "Australia",
    aw => "Aruba",
    ax => "Aland Islands",
    az => "Azerbaijan",
    ba => "Bosnia and Herzegovina",
    bb => "Barbados",
    bd => "Bangladesh",
    be => "Belgium",
    bf => "Burkina Faso",
    bg => "Bulgaria",
    bh => "Bahrain",
    bi => "Burundi",
    bj => "Benin",
    bm => "Bermuda",
    bn => "Brunei Darussalam",
    bo => "Bolivia",
    br => "Brazil",
    bs => "Bahamas",
    bt => "Bhutan",
    bv => "Bouvet Island",
    bw => "Botswana",
    by => "Belarus",
    bz => "Belize",
    ca => "Canada",
    cc => "Cocos (Keeling) Islands",
    cd => "Congo, The Democratic Republic of the",
    cf => "Central African Republic",
    cg => "Congo",
    ch => "Switzerland",
    ci => "Cote D'Ivoire",
    ck => "Cook Islands",
    cl => "Chile",
    cm => "Cameroon",
    cn => "China",
    co => "Colombia",
    cr => "Costa Rica",
    cs => "Serbia and Montenegro",
    cu => "Cuba",
    cv => "Cape Verde",
    cx => "Christmas Island",
    cy => "Cyprus",
    cz => "Czech Republic",
    de => "Germany",
    dj => "Djibouti",
    dk => "Denmark",
    dm => "Dominica",
    do => "Dominican Republic",
    dz => "Algeria",
    ec => "Ecuador",
    ee => "Estonia",
    eg => "Egypt",
    eh => "Western Sahara",
    er => "Eritrea",
    es => "Spain",
    et => "Ethiopia",
    fi => "Finland",
    fj => "Fiji",
    fk => "Falkland Islands (Malvinas)",
    fm => "Micronesia, Federated States of",
    fo => "Faroe Islands",
    fr => "France",
    fx => "France, Metropolitan",
    ga => "Gabon",
    gb => "United Kingdom",
    gd => "Grenada",
    ge => "Georgia",
    gf => "French Guiana",
    gh => "Ghana",
    gi => "Gibraltar",
    gl => "Greenland",
    gm => "Gambia",
    gn => "Guinea",
    gp => "Guadeloupe",
    gq => "Equatorial Guinea",
    gr => "Greece",
    gs => "South Georgia and the South Sandwich Islands",
    gt => "Guatemala",
    gu => "Guam",
    gw => "Guinea-Bissau",
    gy => "Guyana",
    hk => "Hong Kong",
    hm => "Heard Island and McDonald Islands",
    hn => "Honduras",
    hr => "Croatia",
    ht => "Haiti",
    hu => "Hungary",
    id => "Indonesia",
    ie => "Ireland",
    il => "Israel",
    in => "India",
    io => "British Indian Ocean Territory",
    iq => "Iraq",
    ir => "Iran",
    is => "Iceland",
    it => "Italy",
    jm => "Jamaica",
    jo => "Jordan",
    jp => "Japan",
    ke => "Kenya",
    kg => "Kyrgyzstan",
    kh => "Cambodia",
    ki => "Kiribati",
    km => "Comoros",
    kn => "Saint Kitts and Nevis",
    kp => "North-Korea",
    kr => "Korea",
    kw => "Kuwait",
    ky => "Cayman Islands",
    kz => "Kazakhstan",
    la => "Laos",
    lb => "Lebanon",
    lc => "Saint Lucia",
    li => "Liechtenstein",
    lk => "Sri Lanka",
    lr => "Liberia",
    ls => "Lesotho",
    lt => "Lithuania",
    lu => "Luxembourg",
    lv => "Latvia",
    ly => "Libyan",
    ma => "Morocco",
    mc => "Monaco",
    md => "Moldova",
    mg => "Madagascar",
    mh => "Marshall Islands",
    mk => "Former Yugoslav Republic of Macedonia",
    ml => "Mali",
    mm => "Myanmar",
    mn => "Mongolia",
    mo => "Macao",
    mp => "Northern Mariana Islands",
    mq => "Martinique",
    mr => "Mauritania",
    ms => "Montserrat",
    mt => "Malta",
    mu => "Mauritius",
    mv => "Maldives",
    mw => "Malawi",
    mx => "Mexico",
    my => "Malaysia",
    mz => "Mozambique",
    na => "Namibia",
    nc => "New Caledonia",
    ne => "Niger",
    nf => "Norfolk Island",
    ng => "Nigeria",
    ni => "Nicaragua",
    nl => "Netherlands",
    no => "Norway",
    np => "Nepal",
    nr => "Nauru",
    nu => "Niue",
    nz => "New Zealand",
    om => "Oman",
    pa => "Panama",
    pe => "Peru",
    pf => "French Polynesia",
    pg => "Papua New Guinea",
    ph => "Philippines",
    pk => "Pakistan",
    pl => "Poland",
    pm => "Saint Pierre and Miquelon",
    pn => "Pitcairn",
    pr => "Puerto Rico",
    ps => "Palestinian Territory, Occupied",
    pt => "Portugal",
    pw => "Palau",
    py => "Paraguay",
    qa => "Qatar",
    re => "Reunion",
    ro => "Romania",
    ru => "Russian Federation",
    rw => "Rwanda",
    sa => "Saudi Arabia",
    sb => "Solomon Islands",
    sc => "Seychelles",
    sd => "Sudan",
    se => "Sweden",
    sg => "Singapore",
    sh => "Saint Helena",
    si => "Slovenia",
    sj => "Svalbard and Jan Mayen",
    sk => "Slovakia",
    sl => "Sierra Leone",
    sm => "San Marino",
    sn => "Senegal",
    so => "Somalia",
    sr => "Suriname",
    st => "Sao Tome and Principe",
    sv => "El Salvador",
    sy => "Syrian Arab Republic",
    sz => "Swaziland",
    tc => "Turks and Caicos Islands",
    td => "Chad",
    tf => "French Southern Territories",
    tg => "Togo",
    th => "Thailand",
    tj => "Tajikistan",
    tk => "Tokelau",
    tl => "Timor-Leste",
    tm => "Turkmenistan",
    tn => "Tunisia",
    to => "Tonga",
    tr => "Turkey",
    tt => "Trinidad and Tobago",
    tv => "Tuvalu",
    tw => "Taiwan, Province of China",
    tz => "Tanzania, United Republic of",
    ua => "Ukraine",
    ug => "Uganda",
    um => "United States Minor Outlying Islands",
    us => "United States",
    uy => "Uruguay",
    uz => "Uzbekistan",
    va => "Holy See (Vatican City State)",
    vc => "Saint Vincent and the Grenadines",
    ve => "Venezuela",
    vg => "Virgin Islands, British",
    vi => "Virgin Islands, U.S.",
    vn => "Vietnam",
    vu => "Vanuatu",
    wf => "Wallis and Futuna",
    ws => "Samoa",
    ye => "Yemen",
    yt => "Mayotte",
    za => "South Africa",
    zm => "Zambia",
    zw => "Zimbabwe",
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
	# Look up the cache first.  The strange handling of
    # undefined values shuts up a warning in Perl.
	if (exists ($locale_cache->{$language}
				->{$country || undef}->{$charset || undef})) {
		my $retval = $locale_cache->{$language}
		->{$country || undef}->{$charset || undef};

		return unless defined $retval;
		return;
	}

	# Initialize the cache with the undefined value so that we can do
	# error returns without setting it.  The strange handling of
    # undefined values shuts up a warning in Perl.
	$locale_cache->{$language}->{$country || undef}->{$charset || undef} = 
		undef;

	my $windows = ($^O !~ /darwin/i && $^O =~ /win/i) ? 1 : 0;
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

    my $set_locale;
	
	# First we try to only use the language.
	my $long_language = WIN32LANGUAGE->{lc $language};
	my @languages = ($long_language, $language);
	my %seen = ();
	foreach my $language (@languages) {
		next if $seen{$language}++;
		warn "Trying lingua only setlocale '$language'.\n" if DEBUG;
		my $result = POSIX::setlocale ($category, $language);
		if ($result) {
			$set_locale = $result if $result;
			last;
		}
	}
	
	# Now try it with the country appended.
	if (defined $country) {
        COMBI: foreach my $language (@languages) {
            # We do not need a fallback country here, because the "system" already
            # provides the information.
	        my @short_countries = ($country);
		    my @countries = map { 
			    WIN32COUNTRY->{lc $_} 
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
	}

	return unless defined $set_locale && length $set_locale;

    # Apparently, there is no point in setting a charset.  Even the new
    # MS-DOS versions like 2000 or XP still have the concept of more or
    # less fixed codepages.  Switching to UTF-8 does not work.
	$locale_cache->{$language}->{$country}->{$charset} = $set_locale;
	return $set_locale;
}

sub get_locale_cache {
	$locale_cache;
}

sub set_locale_cache {
	if (ref $_[0] && 'HASH' eq ref $_[0]) {
		$locale_cache = $_[0];
    } else {
		my %locale_cache = @_;
		$locale_cache = \%locale_cache;
	}
}

1;

__END__

=head1 NAME

Locale::Util - Portable l10n and i10n functions

=head1 SYNOPSIS

  use Locale::Util;

  my @linguas = parse_http_accept_language $ENV{HTTP_ACCEPT_LANGUAGE};

  my @charsets = parse_http_accept_charset $ENV{HTTP_ACCEPT_CHARSET};

  # Trie to set the locale to Brasilian Portuguese in UTF-8.
  my $set_locale = set_locale LC_ALL, 'pt', 'BR', 'utf-8';

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

=item B<set_locale CATEGORY, LANGUAGE[, COUNTRY, CHARSET]>

Tries to set the user locale by means of POSIX::setlocale().  The latter
function has the disadvantage, that its second argument (the locale
description string) is completely non-standard and system-dependent.
This function tries its best at guessing the system's notion of a locale
dientifier, with the arguments supplied:

=over8

=item B<CATEGORY>

An integer argument for a valid locale category.  These are the
LC_* constants (LC_ALL, LC_CTIME, LC_COLLATE, ...) defined in both
Locale::Messages(3pm) and POSIX(3pm).

=item B<LANGUAGE>

A 2-letter language identifier as per ISO 639.  Case doesn't matter,
but an unchanged version (ie. not lower-cased) of the language you
provided will always be tried to.

=item B<COUNTRY>

A 2-letter language identifier as per ISO 639.  Case doesn't matter,
but an unchanged version (ie. not lower-cased) of the language you
provided will always be tried to.

This parameter is optional.  If it is not defined, the function will
try to guess an appropriate country, otherwise leave it to the 
operating system.

=item B<CHARSET>

A valid charset name.  Valid means valid!  The charset "utf8" is not
valid (it is "utf-8").  Charset names that are accepted by the
guessing algorithms in Encode(3pm) are also not necessarily valid.

If you parameter is undefined, it is ignored.  It is always ignored
under Windows.

=back

The function tries to approach the desired locale in loops, refining
it on every success.  It will first try to set the language (for 
any country), then try to select the correct language, and finally
try to select the correct charset.

The return value is false in case of failure, or the return value
of the underlying POSIX::setlocale() call in case of success.

Please note that this function is intended for server processes 
(especially web applications) that need to switch in a portable
way to a certain locale.  It is B<not> the recommended way to set 
the program locale for a regular application.  In a regular application
you should do the following:

    use POSIX qw (setlocale LC_ALL);
    setlocale LC_ALL, '';

The empty string as the second argument means, that the system
should switch to the user's default locale.

=item B<get_locale_cache>

The function set_locale() is potentially expansive, especially when
it fails, because it can try a lot of different combinations, and 
the system may have to load a lot of locale definitions from its
internal database.

In order to speed up things, results are internally cached in a 
hash, keys are the languages, subkeys countries, subsubkeys the
charsets.  You can get a reference to this hash with get_locale_cache().

The function cannot fail.

=item B<set_locale_cache HASH>

Sets the internal cache.  You can either pass a hash or a hash reference.
The function will use this as its cache, discarding its old cache.
This allows you to keep the hash persistent.

The function cannot fail.

=back

=head1 BUGS

The function set_locale() probably fails to guess the correct locale
identifier on a lot of systems.  If you have found such a case,
please submit it as a bug report.

The bug tracking system for this packags is at
http://rt.cpan.org/NoAuth/Bugs.html?libintl-perl

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
