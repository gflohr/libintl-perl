#! /bin/false

# vim: set autoindent shiftwidth=4 tabstop=4:

# Portable methods for locale handling.
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

package Locale::Type;

use strict;

use Locale::Messages;

use constant THREAD_SAFE => ;

use constant LC_CTYPE_MASK => 1 << 1;
use constant LC_NUMERIC_MASK => 1 << 2;
use constant LC_TIME_MASK => 1 << 3;
use constant LC_COLLATE_MASK => 1 << 4;
use constant LC_MONETARY_MASK => 1 << 5;
use constant LC_MESSAGES_MASK => 1 << 6;
use constant LC_PAPER_MASK => 1 << 7;
use constant LC_NAME_MASK => 1 << 8;
use constant LC_ADDRESS_MASK => 1 << 9;
use constant LC_TELEPHONE_MASK => 1 << 10;
use constant LC_MEASUREMENT_MASK => 1 << 11;
use constant LC_IDENTIFICATION_MASK => 1 << 12;
use constant LC_ALL_MASK => LC_CTYPE_MASK
                         | LC_NUMERIC_MASK
                         | LC_TIME_MASK
                         | LC_COLLATE_MASK
                         | LC_MONETARY_MASK
                         | LC_MESSAGES_MASK
                         | LC_PAPER_MASK
                         | LC_NAME_MASK
                         | LC_ADDRESS_MASK
                         | LC_TELEPHONE_MASK
                         | LC_MEASUREMENT_MASK
                         | LC_IDENTIFICATION_MASK;

1;

__END__

=head1 NAME

Locale::Type - Perl wrapper for locale_t

=head1 SYNOPSIS

  use Locale::Type qw (:locale_h);

  my $base = Locale::Type->new ('bg_BG.utf8', LC_ALL_MASK);
  $lt = Locale::Type->new ('POSIX', LC_NUMERIC_MASK | LC_CTYPE_MASK, $base);

  my $copy = $lt->dup;

  my $descriptive_string = $lt->query;

  my $old_lt = $lt->use;

  $lt->free;

=head1 DESCRIPTION

The module B<Locale::Type> is a Perl binding for extended locale support.
It can be used alone or with the locale functions defined by POSIX(3pm).

It offers an object-oriented and procedural interface.

In a nutshell, the extended locale API allows switching or querying
locale settings in a re-entrant matter.

Since this API is relatively new, your libc may not support it yet.  In
this case Locale::Type(3pm) tries to emulate the functionality but this
emulation is I<not> thread-safe.  It is offered for your convenience,
so that you can offer re-entrancy for systems that provide the necessary
requirements.

=head1 METHODS

=over 4

=item B<new CATEGORY_MASK, LOCALE_STRING, BASE>

Creates a new locale descriptor.  

B<CATEGORY_MASK> is the bitwise or of one or more of the locale category mask 
constants (see L</CONSTANTS>).

B<LOCALE_STRING> is the identifier for the locale.  The exact format is
system-dependent.  It is the same as returned by POSIX::setlocale()
for individual locale categories (as opposed to LC_ALL).

The argument B<BASE> is optional.  If omitted, the current thread's
locale is used.  

Returns a new B<Locale::Type> object for success or false for failure.

=item B<use>

Uses the current locale descriptor as the thread-locale.

Returns the current value of the per-thread locale which could be
LC_GLOBAL_LOCALE.

When called as a class method, you get the current value of the
per-thread locale, and the current locale is not changed.

=item B<dup LOCALE_DESCRIPTOR>

Creates a copy of B<LOCALE_DESCRIPTOR>.

When called as a class method, the current thread locale is copied.

=back

=head1 FUNCTIONS

If you prefer, you can also use the procedural interface:

=item B<newlocale CATEGORY_MASK, LOCALE_STRING, BASE>

Equivalent to new().

=item B<uselocale LOCALE_DESCRIPTOR>

Equivalent to use().  

When called without a B<LOCALE_DESCRIPTOR> argument, or with LC_GLOBAL_LOCALE
as the B<LOCALE_DESCRIPTOR> argument, the per-thread locale descriptor is
returned, and the locale is not changed.

=item B<duplocale LOCALE_DESCRIPTOR>

Equivalent to dup().  If you do not pass B<LOCALE_DESCRIPTOR> the
current thread locale is used.

=back

=head1 CONSTANTS

All locale category mask constants (LC_.+_MASK) may not be defined on
your system.  In this case they evaluate to 0.

You can import these constants by using B<Locale::Type> with a export
tag ":locale_h".

=over 4

=item B<LC_CTYPE_MASK>

Character type.

=item B<LC_NUMERIC_MASK>

Number format.

=item B<LC_TIME_MASK>

Time and date format.

=item B<LC_COLLATE_MASK>

Collation order.

=item B<LC_MONETARY_MASK>

Monetary format.

=item B<LC_MESSAGES_MASK>

Program messages.

=item B<LC_PAPER_MASK>

Paper format.

=item B<LC_NAME_MASK>

Name format.

=item B<LC_ADDRESS_MASK>

Address format.

=item B<LC_TELEPHONE_MASK>

Telephone number format.

=item B<LC_MEASUREMENT_MASK>

Measurement format.

=item B<LC_IDENTIFICATION_MASK>

Identification format.

=item B<LC_GLOBAL_LOCALE>

Identifies the process-wide locale (as opposed to the thread-specific
locale).  

This value is normally a number.  Do not expect it to be an object!

It can only be used as an argument, and it can only be returned by
a function, if explicitely specified.

=back

=head1 AUTHOR

Copyright (C) 2002-2009, Guido Flohr <guido@imperia.net>, all rights
reserved.  See the source code for details.

This software is contributed to the Perl community by Imperia
(<http://www.imperia.net/>).

=head1 SEE ALSO

POSIX(3pm), xlocale(3), perl(1)
