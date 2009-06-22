#! /bin/false

# vim: set autoindent shiftwidth=4 tabstop=4:
# $Id: TextDomain.pm,v 1.49 2009/05/27 05:13:28 guido Exp $

# This file is part of libintl-perl.
# Copyright (C) 2002-2009 Guido Flohr <guido@imperia.net>,
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

package Locale::POFile;

use strict;

use Locale::TextDomain qw (libintl-perl);

use Locale::POFile::Parser;
use Locale::POFile::Lexer;

sub new {
    my ($class, @args) = @_;

    my $self = {
        __errors => [],
        __messages => [],
    };

    bless $self, $class;
}

sub parse {
    my ($self, $what, $filename) = @_;

    $self->{__messages} = [];
    
    my %args;
    
    my $content;
    if (ref $what && 'SCALAR' eq ref $what) {
        $content = $$what;
        $args{yyin_name} = $filename if defined $filename && length $filename;
    } elsif (ref $what) {
        $args{yyin} = $what;
        $args{yyin_name} = $filename if defined $filename && length $filename;
    } elsif (defined $what) {
        local *HANDLE;
        $args{yyin_name} = defined $filename ? $filename : $what;
        unless (open HANDLE, "<$what") {
            return $self->__pushErrors(
                __x(
                    "Cannot open '{filename}' for reading:" . " {error}.\n",
                    filename => $filename,
                    error    => $!
                )
            );
        }

        local $/;
        $content = <HANDLE>;
        unless (defined $content) {
            return $self->__pushErrors(
                __x(
                    "Error reading '{filename}: {error}.\n",
                    filename => $filename,
                    error    => $!
                )
            );
            return $self;
        }
        close HANDLE;
    }

    my $lexer = Locale::POFile::Lexer->new(%args);
    $lexer->yyinput($content) if defined $content;

    my $parser = Locale::POFile::Parser->new;
    
    my $retval = $parser->yyparse($lexer, 
                                  yydebug => $ENV{POFILE_DEBUG});
    $self->__pushErrors($parser->errors);
    
    return unless $retval;
    
    $self->{__messages} = $parser->messages;
    
    return $self;
}

sub messages {
    @{shift->{__messages}};
}

sub numberOfMessages {
    scalar @{shift->{__messages}};
}

sub errors {
    my ($self) = @_;

    my @errors = @{$self->{__errors}};
    $self->{__errors} = [];
    
    return wantarray ? @errors : join '', @errors;
}

sub numberOfErrors {
    scalar @{shift->{__errors}};
}

sub __pushErrors {
    my ($self, @errors) = @_;

    push @{$self->{__errors}}, @errors;

    # Convenience:  Return false, so that you can propagate the return value.
    return;
}

1;

__END__

=head1 NAME

Locale::POFile - Manage Portable Object (PO) Files 

=head1 SYNOPSIS

 use Locale::POFile;
 
 my $po = Locale::PO->new;

 $po->parse('fr_CA.po') or die scalar $po->errors;
 
 $po->numberOfErrors;
 
 my @messages = $po->messages;
 
 $po->numberOfMessages;
 
=head1 DESCRIPTION

The module Locale::POFile(3pm) provides an object-oriented interface
to portable object (PO) files.  You can use it to read and write po
files on disk or in memory.

A Perl module with similar purpose is Locale::PO(3pm).  One of the
main differences between Locale::PO(3pm) and Locale::POFile(3pm) is
that the latter is able to grok with new po features like plural forms,
message contexts and extended comment syntax.

This module was introduced in libintl-perl 2.0.

=head1 PUBLIC METHODS

If a method returns a true value on success, that true value is the object
that the method was invoked on.

=over 4

=item B<new>

The constructor takes no arguments and cannot fail.

=item B<parse WHAT[, FILENAME]>

Parses B<WHAT> as a PO file.  Returns true (itself) on success, false on 
failure.  The B<WHAT> argument can be:

=over 4

=item a scalar variable

The argument is interpreted as the name of a file to parse.

=item a scalar reference

The scalar that the reference points to is parsed.

=item a reference to file handle (IO::Handle or GLOB)

The file handle is read.

=back

You can optionally pass a filename as a second argument.  This filename is
used in error messages.

The method resets the internal error list.

Even if the method returns true for success, you can invoke the errors()
method on the object, to check for warnings.

=item B<messages>

Returns a list of Locale::POFile::Message(3pm) objects that has been
successfully parsed.

=item B<numberOfMessages>

Returns the number of messages successfully parsed.

=item B<errors>

Returns a list of errors or the concatenation of that list in scalar context.

You should invoke this method, if another method failed, and you want to
know the reason for failure.  The list is automatically cleared, when
the errors are retrieved.

=item B<numberOfErrors>

The number of error messages waiting in the internal error list.

=back

=head1 AUTHOR

Copyright (C) 2002-2009, Guido Flohr E<lt>guido@imperia.netE<gt>, all
rights reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia 
(L<http://www.imperia.net/>).

=head1 SEE ALSO

Locale::POFile::Messages(3pm), xgettext(1), msgfmt(1), msgmerge(1), 
Locale::PO(3pm), perl(1)

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
