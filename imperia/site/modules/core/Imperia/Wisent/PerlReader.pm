#! /bin/false

# Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
# All rights reserved. 
#
# This file is part of the Imperia Enterprise Content Management System.  You
# can distribute it under the same terms and conditions as Perl itself.

# FIXME: The original implementation had the goto table merged into the
# actions table.  That means that there is probably code unnecessarily checking
# whether a certain key into the actions table is a terminal or not.

package Imperia::Wisent::PerlReader;

use strict;

use Locale::TextDomain qw (imperia);

use PPI::Tokenizer;

sub new {
    bless {}, shift;
}

sub extract {
    my ($self, $input, $filename, $lineno) = @_;
    
    my @code;
    
    my $tokenizer = PPI::Tokenizer->new (\$input);
    my $delimiter;
    my $lineno = 1;
    my $brace_count;
    my @here_stack;
    my @significant;
    my $read_bytes = 0;
    
    while (1) {
        my $token = $tokenizer->get_token;
        if (!defined $token) {
            die $tokenizer->errstr;
        } elsif (ref $token && $token->isa('PPI::Token')) {
            my $content = $token->content;
            $read_bytes += length $content;
            push @significant, $content
                if !$delimiter && $token->significant;
            if ($content =~ /\n/) {
                ++$lineno;
                push @code, $content;
                if (@here_stack) {
                    foreach my $lines (@here_stack) {
                        push @code, $lines;
                    }
                }
                last unless $delimiter;
                next;
            }
            unless ($delimiter) {
                if (2 == @significant 
                    && $significant[0] eq '%' && $significant[1] eq '{') {
                    @code = ();
                    $delimiter = "\%\}";
                    next;
                } elsif ('{' eq $content && 1 == @significant) {
                    $delimiter = '}';
                    $brace_count = 0;
                } elsif ('{' eq $content) {
                    # Walk back the token stack and check for a control
                    # construct.
                    my $backptr = $#significant - 1;
                    my $paren_count = 1;
                    my $is_control = ')' eq $significant[$backptr];
                    --$backptr if $is_control;
                    while ($backptr >= 0 && $is_control) {
                        my $back = $significant[$backptr];
             
                        if ('(' eq $back) {
                            --$paren_count;
                        } elsif (')' eq $back) {
                            ++$paren_count;
                        }
                        
                        --$backptr;
                        last if 0 == $paren_count;
                    }
                    if ($paren_count == 0 && $backptr >= 0) {
                        my $back = $significant[$backptr];
                        if ('while' eq $back
                            || 'if' eq $back
                            || 'foreach' eq $back
                            || 'for' eq $back
                            || 'eval' eq $back
                            || 'do' eq $back
                            || 'sub' eq $back) {
                            $delimiter = '}';
                        } elsif ($back =~ /^\$[a-zA-Z_][a-zA-Z0-9_]+$/) {
                            --$backptr;
                            if ($backptr > 0 && 'my' eq $significant[$backptr]) {
                                --$backptr;
                            }
                            if ($backptr >= 0) {
                                if ($significant[$backptr] =~ /^for(?:each)?$/) {
                                    $delimiter = '}';
                                    $brace_count = 0;
                                }
                            }
                        }
                    }
                }
            }

            push @code, $content;
            if ($token->isa('PPI::Token::HereDoc')) {
                push @here_stack, $token->heredoc;
                push @here_stack, $token->terminator;
                push @here_stack, "\n";
            }
            
            if ($delimiter eq '}') {
                if ('{' eq $content) {
                    ++$brace_count;
                } elsif ('}' eq $content) {
                    --$brace_count;
                }
                last if 0 == $brace_count;
            } elsif ($delimiter eq '%}') {
                if ('}' eq $code[-1] && '%' eq $code[-2]) {
                    pop @code;
                    pop @code;
                    last;
                }
            }
        } else {
            $delimiter = 'end of line' unless $delimiter;
            die __x("{filename}:{lineno}: Unexpected end of file while "
                    . " waiting for '{delimiter}'!\n",
                    filename => $filename, 
                    lineno => $lineno,
                    delimiter => $delimiter);
            last;
        }
    }
    
    my $retval = join '', @code;
    
    # Compensate for non-Perl chars.
    $retval .= ' ' x ($read_bytes - length $retval);

    return $retval;
}

1;

=head1 NAME

Imperia::Wisent::PerlReader - Extract Perl code from strings.

=head1 SYNOPSIS

    # Always use the derived class, since the base class 
    # Imperia::Wisent::Parser is abstract.
    use Imperia::Wisent::PerlReader;

    $reader = Imperia::Wisent::PerlReader;
    $code = $reader->extract($input, $filename, $lineno);
    
=head1 DESCRIPTION

The class is used by the Imperia parser and scanner generators when extracting
Perl code from the input files.  Internally it relies on PPI::Tokenizer(3pm).

=head1 CONSTRUCTORS

=over 4 B<new>

The constructor takes no arguments and cannot fail.

=back

=head1 PUBLIC METHODS

=over 4

=item B<extract INPUT, FILENAME, LINENUMBER>

Extracts Perl code from the string INPUT.  Optionally you can pass a filename
and a line number where the code started.  This information is only used
for error messages.

The end marker depends on the input itself.  If it starts with '%{' - possibly
prepended by whitespace, the method returns, when the closing delimiter '%}'
is encountered outside of a Perl comment or a string like construction.

If its first line contains a '{' that opens a Perl code block, the method 
returns when the brace count is balanced.  It does a reasonable well job in
order to do so, but you should be prepared for bugs here, and not stress
the detection too much.

In all other cases, the method returns at the end of the line.

The returned value is the extracted code.  The delimiters '%{' and '%}' are 
stripped off.

In case of failures, the function throws an exception.

%back

=head1 COPYRIGHT

Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
All rights reserved. 

This file is part of the Imperia Enterprise Content Management System.  You
can distribute it under the same terms and conditions as Perl itself.

=head1 SEE ALSO

perl(1), PPI::Tokenizer(3pm)

=cut
