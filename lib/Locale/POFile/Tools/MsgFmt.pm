#! /bin/false

# vim: tabstop=4

# This file is part of libintl-perl
# Copyright (C) 2002-2011 Guido Flohr <guido@imperia.net>,
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

package Locale::POFile::Tools::MsgFmt;

use strict;

use Locale::TextDomain qw ('libintl-perl');

$Locale::POFile::Tools::MsgFmt::usage = __"Description missing.\n";

sub new {
    bless {}, shift;
}

sub run {
    die __x("Usage: {usage}", usage=> $Locale::POFile::Tools::MsgFmt::usage);
}

1;

=head1 NAME

Locale::POFile::Tools::MsgFmt - Compile PO file

=head1 SYNOPSIS

  Locale::POFile::Tools::MsgFmt->new->run([OPTION], POFILE, ...);

=head1 DESCRIPTION

Compiles a textual PO file into a binary MO file.

Mandatory arguments to long options are mandatory for short options too.
Similarly for optional arguments.

Input file location:

=over 4

=item B<POFILE, ...>

input files or standard input for `-'

=item B<-D, --directory=DIRECTORY>

add all files in B<DIRECTORY> to list of input files

=back

Output file location:

=over 4

=item B<-o, --output-file=FILE>

write output to specified
file or standard output
for '-'

=back

=head1 AUTHOR

Copyright (C) 2002-2011 Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

=head1 SEE ALSO

pmsgfmt(1), msgfmt(1), perl(1)

=cut
