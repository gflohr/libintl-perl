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

package Locale::Catalog::Message;

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
    
    return wantarray ? @{$self->{__msgid}} : $self->{__msgid}->[0];
}

sub msgstr {
    my ($self, $msgstr) = @_;
    
    if (defined $msgstr) {
        $msgstr = [$msgstr] unless ref $msgstr;
        $self->{__msgstr} = $msgstr;
    }
    
    return wantarray ? @{$self->{__msgstr}} : $self->{__msgstr}->[0];
}

sub msgctxt {
    my ($self, $msgctxt) = @_;
    
    $self->{__msgctxt} = $msgctxt if defined $msgctxt;
    
    my $retval = $self->{__msgctxt};
    
    return '' unless defined $retval;
    
    return $retval;
}

1;

__END__

=head1 NAME

Locale::Catalog::PO::Message - Portable l10n and i10n functions

=head1 SYNOPSIS

  use Locale::Catalog::PO::Message;

  my $msg = Locale::Catalog::PO::Message->new(%args);

=head1 DESCRIPTION

This class encapsulates a single entry in a PO (portable object) file.
Normally, you will not create any objects yourself, but instead use the
container classes Locale::Catalog::PO(3pm) or Locale::Catalog::MO(3pm),
both subclassed from Locale::Catalog(3pm).

This module was added in libintl-perl 2.0.0.

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

=item B<msgid [MSGID[, MSGID_PLURAL]]>

In scalar context, returns the message id.  In array context an array
consisting of the message id (singular!) and the plural of the message
id (if defined) is returned.

If B<MSGID> is defined, it sets the message id first to B<MSGID>.  If B<MSGID> 
is an array reference, the first two elements of that array are taken as the 
singular and plural id.  Alternatively, you can pass B<MSGID_PLURAL> as
the second argument.

=item B<msgstr [MSGSTR ...]>

In scalar context, returns the message translation.  In array context an array
consisting of all forms (singular and all plural forms) is returned.  It is
usually an error to call this method in scalar context.

If called with arguments, these arguments are taken as the various singular
and plural forms.  If any argument is an array reference, the referenced is
first unreferenced.

=item B<msgctxt [MSGCTXT]>

If given, sets the message context to B<MSGCTXT>.

Returns the message context of the message.  If the message is context-less,
the empty string is returned.

=item B<domain [DOMAIN]>

Sets the domain of the message.

=item B<comment COMMENT>

Adds a comment to the message.  If B<COMMENT> is an array reference,
all elements of the array are taken.

=back

=head1 AUTHOR

Copyright (C) 2002-2011 Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

=head1 SEE ALSO

Locale::Catalog(3pm), POSIX(3pm), perl(1)
