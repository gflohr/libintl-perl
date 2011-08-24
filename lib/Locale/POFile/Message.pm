#! /bin/false

# vim: set autoindent shiftwidth=4 tabstop=4:
# $Id: Util.pm,v 1.21 2009/05/25 14:29:08 guido Exp $

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

package Locale::POFile::Message;

use strict;

sub new {
    my ($class, %args) = @_;
    
    my $self = bless {}, $class;

    my %setters = map { $_ => 1 } qw (msgid msgstr msgctxt domain comment);
    
    while (my ($param, $value) = each %args) {
        $self->$param($value) if exists $setters{$param};
    }
    
    return $self;
}

sub msgid {
    my ($self, $msgid) = @_;
    
    if (defined $msgid) {
        $msgid = [$msgid] unless ref $msgid;
        $self->{__msgid} = $msgid;
    }
    
    return wantarray ? @{$self->{__msgid}} : $self->{__msgid};
}

sub msgstr {
    my ($self, $msgstr) = @_;
    
    if (defined $msgstr) {
        $msgstr = [$msgstr] unless ref $msgstr;
        $self->{__msgstr} = $msgstr;
    }
    
    return wantarray ? @{$self->{__msgstr}} : $self->{__msgstr};
}

1;

__END__

=head1 NAME

Locale::POFile::Message - Portable l10n and i10n functions

=head1 SYNOPSIS

  use Locale::POFile::Message;

  my $msg = Locale::POFile::Message->new(%args);

=head1 DESCRIPTION

This class encapsulates a single entry in a PO (portable object) file.
Normally, you will not create any objects yourself, but instead use the
container classes Locale::POFile(3pm) or Locale::MOFile(3pm).

This module was introduced in libintl-perl 2.0.

=head1 PUBLIC METHODS

The following methods can be used.

=over 4

=item B<new ARGS>

The constructor takes the following named arguments.  All of them are
optional.

=over 4

=item B<msgid MSGID>

Sets the message id to B<MSGID>.  If B<MSGID> is an array reference, the first
two elements of that array are taken as the singular and plural id.

=item B<msgstr MSGSTR>

Sets the translation to B<MSGSTR>.  If B<MSGSTR> is an array reference, all
elements of the array are taken as the various singular and plural forms.

=item B<msgctxt MSGCTXT>

Sets the message context to B<MSGCTXT>.

=item B<domain DOMAIN>

Sets the domain of the message.

=item B<comment COMMENT>

Adds a comment to the message.  If B<COMMENT> is an array reference,
all elements of the array are taken.

=back

=item B<msgid MSGID>

Sets the message id to B<MSGID>.  If B<MSGID> is an array reference, the first
two elements of that array are taken as the singular and plural id.

=item B<msgstr MSGSTR>

Sets the translation to B<MSGSTR>.  If B<MSGSTR> is an array reference, all
elements of the array are taken as the various singular and plural forms.

=item B<msgctxt MSGCTXT>

Sets the message context to B<MSGCTXT>.

=item B<domain DOMAIN>

Sets the domain of the message.

=item B<comment COMMENT>

Adds a comment to the message.  If B<COMMENT> is an array reference,
all elements of the array are taken.

=back

=head1 AUTHOR

Copyright (C) 2002-2011 Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(L<http://www.imperia.net/>).

=head1 SEE ALSO

POSIX(3pm), perl(1)

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
