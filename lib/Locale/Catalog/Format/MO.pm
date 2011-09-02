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

sub __cmp_msgid;

sub new {
    my ($class, @args) = @_;
    
    my $self = $class->SUPER::new(@args);
    
    $self->{__locale_catalog_format_mo_byte_order} = 'N';
    
    return $self;
}

sub dump {
    my ($self) = @_;
    
    my @messages = $self->messages;
    
    return '' unless @messages;

    my $magic = 0x950412de;
    my $revision = 0;
    my $num_strings = 0;
    my $orig_hashing = '';
    my $trans_hashing = '';
    
    my @orig_lengths;
    my @trans_lengths;
    
    foreach my $message (sort cmp_msgid @messages) {
        next unless $message->translated;
        ++$num_strings;
    
        my $msgid = join "\000", $message->msgid;
        my $msgstr = join "\000", $message->msgstr;
        push @orig_lengths, length $msgid;
        push @trans_lengths, length $msgstr;
            
        $orig_hashing .= $msgid . "\000";
        $trans_hashing .= $msgstr . "\000";
    }
    
    return '' unless $num_strings;
    
    my $template = $self->byteOrder;
    my $lsize = 4;
    
    my $orig_offset = 7 * $lsize;
    my $trans_offset = $orig_offset + $num_strings * $lsize * 2;
    my $hash_size = 0;
    my $hashing_table = $orig_hashing . $trans_hashing;
    my $hash_offset = $trans_offset + $num_strings * $lsize * 2;
    
    my $output = pack $template x 7,
                      $magic,             # okay
                      $revision,          # 0x00, 000,   0, NUL
                      $num_strings,       # 0x02, 002,   2, STX
                      $orig_offset,       # 0x1C, 034,  28, FS
                      $trans_offset,      # 0x2C, 054,  44, ','
                      $hash_size,         # 0x05, 005,   5, ENQ
                      $hash_offset;       # 0x3C, 074,  60, '<'

    my $offset = $hash_offset + $hash_size * $lsize;
    foreach my $length (@orig_lengths, @trans_lengths) {
        $output .= pack $template x 2, $length, $offset;
        $offset += 1 + $length;
    }
    $output .= $hashing_table;
    
    local *MO;
    open MO, ">/tmp/output.mo";
    print MO $output;
    close MO;
    
    return $output;    
}

sub byteOrder {
    my ($self, $order) = @_;
    
    if (defined $order && {N => 1, L => 1, V => 1}->{$order}) {
        $self->{__locale_catalog_format_mo_byte_order} = $order;
    }
    
    return $self->{__locale_catalog_format_mo_byte_order};
}

sub cmp_msgid {
    my $msgid_a = join '\004', $a->msgid, $a->msgctxt;
    my $msgid_b = join '\004', $b->msgid, $b->msgctxt;
    
    return $msgid_a cmp $msgid_b;
}


1;

__END__

=head1 NAME

Locale::Catalog::Format::MO - Compiled binary message catalogs

=head1 SYNOPSIS

  use Locale::Catalog::Format::MO;

  my $mo = Locale::Catalog::Format::MO->new;
  
  # Fill the object by calling parse() or add().
  
  $mo->byteOrder('N');
  
  print $mo->dump;

=head1 DESCRIPTION

The module Locale::Catalog::Format::MO(3pm) represents a binary, compiled 
message catalog, commonly known as MO files.

The format is descibed at 
L<http://www.gnu.org/s/hello/manual/gettext/MO-Files.html>.

The module is a subclass of Locale::Catalog(3pm).  See that documentation 
for details.

This module was added in libintl-perl 2.0.0.

=head1 PUBLIC METHODS

The module just implements one method:

=over 4

=item B<byteOrder [ORDER]>

If given and valid, sets the byte order used for dumping to B<ORDER>.

Returns the byte order used in the same format that pack() uses.  Possible
values are N, L, and V.  The default is N.

=back

=head1 SEE ALSO

Locale::Catalog(3pm), perl(1)