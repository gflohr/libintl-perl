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

package Locale::Catalog;

use Locale::TextDomain qw (libintl-perl);

sub new {
    bless {
        __locale_catalog_messages => [],
        __locale_catalog_errors => [],
        __locale_catalog_msgids => {}
    }, shift;
}

sub parse {
    my ($self) = @_;
    
    my $class = ref $self;
    
    die __x("The `{package}' class does not implement the method `{method}'!\n",
            package => ref $self, method => $method);    
}

sub dump {
    my ($self) = @_;
    
    my $class = ref $self;
    
    die __x("The `{package}' class does not implement the method `{method}'!\n",
            package => ref $self, method => $method);    
}

sub errors {
    my ($self) = @_;
    
    return @{$self->{__locale_catalog_errors}};
}

sub clearErrors {
    my ($self) = @_;
    
    $self->{__locale_catalog_errors} = [];
    
    return $self;
}

sub slurpErrors {
    my ($self) = @_;
    
    my @errors = $self->errors;
    $self->clearErrors;
    
    return @errors;
}

sub _pushErrors {
    my ($self, @errors) = @_;
    
    push @{$self->{__locale_catalog_errors}}, 
         map { chomp $_; $_ . "\n" } @errors;
    
    return;
}

1;

__END__

=head1 NAME

Locale::Catalog - Abstract base class for message catalogs

=head1 SYNOPSIS

  use Locale::Catalog;

  my $catalog = Locale::Catalog->new;
  $catalog->parse($what) or die $catalog->errors;
  
=head1 DESCRIPTION

The module Locale::Catalog(3pm) is an abstract base class for message catalogs,
like for example portable object (PO) files (Locale::Catalog::Format::PO(3pm))
or compiled, binary message catalogs (MO files, see
Locale::Catalog::Format::MO(3pm)).

All methods that return true for success and false for failure return a
reference to the object or class itself in case of success, so that you
can do method chaining.

=head1 PUBLIC METHODS

=over 4

=item B<parse WHAT[, FILENAME]>

A pure virtual method that must be implemented by non-abstract sub classes.

Parses B<WHAT> for messages.  Returns true (itself) on success, false on 
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

Calling the method parse() more than once on the same object results in an
undefined behavior.

Even if the method returns true for success, you can invoke the errors()
method on the object, to check for warnings.

=item B<dump>

A pure virtual method that must be implemented by non-abstract sub classes.

Serializes the catalog into a format suitable for persistant storage.  This
is the method you want to call if you want to write an MO or PO file.

The method returns itself for success or false for failure.

=item B<errors>

Returns the internal error stack as a list.  It is guaranteed that each error
message is terminated by at least one newline.

=item B<clearErrors>

Clears the internal error stack.

Always returns the object itself.

=item B<slurpErrors>

Returns all errors like B<errors()> does but also clears the error stack like
B<clearErrors()>.

=back

=head1 PROTECTED INTERFACE

Sub classes can call or override the following methods.

=item B<_pushErrorrs ERRORS>

Pushes B<ERRORS> (a list!) onto the internal error stack.

Always returns false.  Rationale: You can write something like this in
derived classes:

     $self->do_something or return $self->_pushErrors(__"did not work");

=head1 SEE ALSO

Locale::Catalog::Format::PO(3pm), Locale::Catalog::Format::MO(3pm), perl(1)