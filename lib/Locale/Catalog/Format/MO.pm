#! /bin/false

# vim: set autoindent shiftwidth=4 tabstop=4:

# This file is part of libintl-perl.
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

package Locale::Catalog::Format::MO;

use strict;

use base qw (Locale::Catalog);

sub dump {
    my ($self) = @_;
    
    my @messages = $self->messages;
    
    return '' unless @messages;

    # First four bytes are the magic number in host byte order.
    my $output = pack 'L', 0x950412de;
    
    return $output;    
}

1;

__END__

=head1 NAME

Locale::Catalog::Format::MO - Compiled binary message catalogs

=head1 SYNOPSIS

  use Locale::Catalog::Format::MO;

=head1 DESCRIPTION

The module Locale::Catalog::Format::MO(3pm) represents a binary, compiled 
message catalog, commonly known as MO files.

The format is descibed at 
L<http://www.gnu.org/s/hello/manual/gettext/MO-Files.html>.

The module is a subclass of Locale::Catalog(3pm).  See that documentation 
for details.

This module was added in libintl-perl 2.0.0.

=head1 SEE ALSO

Locale::Catalog(3pm), perl(1)