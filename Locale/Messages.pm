#! /bin/false
# Copyright (C) 2002, Guido Flohr <guido@imperia.net>
# All rights reserved.

package Locale::Messages;

use strict;

use vars qw ($package @EXPORT_OK %EXPORT_TAGS @ISA $VERSION);

# Try to load the C version first.
$package = 'gettext';
# Locale::gettext 1.01 lacks ngettext and friends and bind_textdomain_codeset.
eval "use Locale::gettext 99.99 ()";
if ($@) {
	$package = 'gettext_pp';
	require Locale::gettext_pp;
}

require Exporter;
@ISA = qw (Exporter);
%EXPORT_TAGS = ( locale_h => [ qw (gettext
								   dgettext
								   dcgettext
								   ngettext
								   dngettext
								   dcngettext
								   textdomain
								   bindtextdomain
								   bind_textdomain_codeset
								   )
						  ],
				 libintl_h => [ qw (LC_CTYPE
									LC_NUMERIC
									LC_TIME
									LC_COLLATE
									LC_MONETARY
									LC_MESSAGES
									LC_ALL)
								],
				 );

@EXPORT_OK = qw (select_package
				 gettext
				 dgettext
				 dcgettext
				 ngettext
				 dngettext
				 dcngettext
				 textdomain
				 bindtextdomain
				 bind_textdomain_codeset
				 LC_CTYPE
				 LC_NUMERIC
				 LC_TIME
				 LC_COLLATE
				 LC_MONETARY
				 LC_MESSAGES
				 LC_ALL);

sub select_package
{
	my $pkg = shift;
	if ('gettext_pp' eq $pkg) {
		require Locale::gettext_pp;
		$package = 'gettext_pp';
	} else {
		require Locale::gettext;
		$package = 'gettext';
	}

	return $package;
}

sub textdomain
{
	'gettext' eq $package ?
		&Locale::gettext::textdomain :
			&Locale::gettext_pp::textdomain;
}

sub bindtextdomain
{
	'gettext' eq $package ?
		&Locale::gettext::bindtextdomain :
			&Locale::gettext_pp::bindtextdomain;
}

sub bind_textdomain_codeset
{
	'gettext' eq $package ?
		&Locale::gettext::bind_textdomain_codeset :
			&Locale::gettext_pp::bind_textdomain_codeset;
}

sub gettext
{
	'gettext' eq $package ?
		&Locale::gettext::gettext :
			&Locale::gettext_pp::gettext;
}

sub dgettext
{
	'gettext' eq $package ?
		&Locale::gettext::dgettext :
			&Locale::gettext_pp::dgettext;
}

sub dcgettext
{
	'gettext' eq $package ?
		&Locale::gettext::dcgettext :
			&Locale::gettext_pp::dcgettext;
}

sub ngettext
{
	'gettext' eq $package ?
		&Locale::gettext::ngettext :
			&Locale::gettext_pp::ngettext;
}

sub dngettext
{
	'gettext' eq $package ?
		&Locale::gettext::dngettext :
			&Locale::gettext_pp::dngettext;
}

sub dcngettext
{
	'gettext' eq $package ?
		&Locale::gettext::dcngettext :
			&Locale::gettext_pp::dcngettext;
}

sub LC_NUMERIC
{
	'gettext' eq $package ?
		&Locale::gettext::LC_NUMERIC :
			&Locale::gettext_pp::LC_NUMERIC;
}

sub LC_CTYPE
{
	'gettext' eq $package ?
		&Locale::gettext::LC_CTYPE :
			&Locale::gettext_pp::LC_CTYPE;
}

sub LC_TIME
{
	'gettext' eq $package ?
		&Locale::gettext::LC_TIME :
			&Locale::gettext_pp::LC_TIME;
}

sub LC_COLLATE
{
	'gettext' eq $package ?
		&Locale::gettext::LC_COLLATE :
			&Locale::gettext_pp::LC_COLLATE;
}

sub LC_MONETARY
{
	'gettext' eq $package ?
		&Locale::gettext::LC_MONETARY :
			&Locale::gettext_pp::LC_MONETARY;
}

sub LC_MESSAGES
{
	'gettext' eq $package ?
		&Locale::gettext::LC_MESSAGES :
			&Locale::gettext_pp::LC_MESSAGES;
}

sub LC_ALL
{
	'gettext' eq $package ?
		&Locale::gettext::LC_ALL :
			&Locale::gettext_pp::LC_ALL;
}

1;

__END__

1;

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
