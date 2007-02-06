#! /bin/false

# vim: set autoindent shiftwidth=4 tabstop=4:
# $Id: Util.pm,v 1.1 2007/02/06 10:45:49 guido Exp $

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

use base qw (Exporter);

use vars qw (@EXPORT_OK);

@EXPORT_OK = qw (parse_http_accept_language
				 parse_http_accept_charset
				 set_locale);

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
	my $windows = ($^O !~ /darwin/i && $^O =~ /win/i) ? 1 : 0;
	if ($windows) {
		return &__change_locale_windows;
	}

	my ($category, $language, $country, $charset) = @_;

	require POSIX;

	# First we try to only use the language.
	my $locale = 

	return;
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
