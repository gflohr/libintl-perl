#! /bin/false
# $Id: Lexer.pm,v 1.31 2008/12/09 15:00:51 guido Exp $ 
# vim: set autoindent shiftwidth=4 tabstop=8:

# Imperia AG is the sole owner and producer of its software "Imperia". For
# our software license and copyright information please refer to: License.txt
# Copyright (C) 1995-2008 Imperia AG.  All rights reserved.

package Imperia::ILex::Lexer;

use strict;

use Locale::TextDomain 'libintl-perl';

our $yyrule;

sub new {
    my ($class, %args) = @_;
    
    my $self = {};
    
    $self->{yyin} = $args{yyin};
    $self->{yyin} = \*STDIN unless defined $self->{yyin};
    $self->{yyin_name} = $args{yyin_name};
    $self->{yyin_name} = __"standard input" 
        unless defined $self->{yyin_name};
    
    bless $self, $class;
    
    # FIXME! Remove the above, when bootstrapping is done.
    $self->{__yycode} = $self->_yycode;

    $self->{__yymatch} = $self->_yymatch;
    $self->{__yyparens} = $self->_yyparens;
    $self->{__yystates} = $self->_yystates;

    $self->{__yystate} = 'INITIAL';
    $self->{__yypos} = 0;
    $self->{__yylloc} = [1, -1, 1, -1];
    $self->{__yy_oldlloc} = [0, 0, 0, 0];
        
    return $self;
}

sub yylloc_set {
    my ($self, $filename, $lineno, $column) = @_;

    $lineno = 1 if !defined $lineno || $lineno <= 0;
    $column = -1 if !defined $column || $column <= 0;

    $self->{yyin_name} = $filename if defined $filename;
    $self->{__yylloc} = [$lineno, $column, $lineno, $column];
    $self->{__yy_oldlloc} = [$lineno, $column, $lineno, $column];

    return $self;
}

sub yyreset {
    my ($self) = @_;
    
    $self->{__yystate} = 'INITIAL';
    $self->{__yypos} = 0;
    $self->{__yylloc} = [1, -1, 1, -1];
    $self->{__yy_oldlloc} = [0, 0, 0, 0];
        
    return $self;
}

sub yystate {
    shift->{__yystate};
}

sub yylex {
    my ($self) = @_;

    # Currently we always slurp the entire input stream at once.   
    unless (exists $self->{yyinput}) {
        $self->{yyinput} = '';
        while (1) {
            my $read = $self->_yyin;
            last unless defined $read;
            $self->{yyinput} .= $read;
        }
        
        $self->{yyinput_length} = length $self->{yyinput};
    }
    
    # EOF?
    if ($self->{__yypos} >= $self->{yyinput_length}) {
        return if $self->yywrap;
        if ($self->{__yypos} >= $self->{yyinput_length}
            || $self->{yyinput_length} == 0
            || length $self->{yyinput} == 0) {
            die __"yywrap() returned false, but the input buffer is empty!"
                  . " Did you forget to call yyinput()?\n";
        }
    }

    my $re = $self->{__yymatch}->{$self->{__yystate}};
    
    pos $self->{yyinput} = $self->{__yypos};

    undef $yyrule;
    $self->{yyinput} =~ /\G$re/g;

    # This gets messed up terribly, at least in the debugger.
    # $self->{__yypos} = pos $self->{yyinput};
    # We therefore advance by the length of the match.
    $self->{yytext} = $^N;
    my $length = length $self->{yytext};
    unless ($length) {
        my $message = "Internal error! Input string did not match!\n";
        my $context = substr $self->{yyinput}, $self->{__yypos}, 50;
        $message = <<EOF;
Internal error! Input string did not match!
Lexer is in state $self->{__yystate};
Matching against: $re
Context:
$context
EOF
        die $message;
    }

    $yyrule = $self->{__yyrule} unless defined $yyrule;
    die __"Could not determine matching rule" unless defined $yyrule;

    $self->{__yyold_lloc} = $self->{__yylloc};
    $self->__yyupdatePosition ($length);
    
    # Execute the related action.
    my $code = $self->{__yycode}->[$yyrule];
    
    if (defined $code) {
        # Arguments to the action are a reference to the lexer itself, followed
        # by possible captured buffers.
        my @args = $self;
    
        my $num_parens = $self->{__yyparens}->[$yyrule];        
        if ($num_parens) {
            my $parens = 0;
            my $rulenos = $self->{__yystates}->{$self->{__yystate}};
            foreach my $ruleno (@$rulenos) {
                last if $ruleno >= $yyrule;
                $parens += $self->{__yyparens}->[$ruleno];
            }
            
            no strict 'refs';
            foreach my $i (1 .. $num_parens) {
                push @args, ${1 + $i + $parens};
            }
        }

        my @retval = $code->(@args);
    
        return @retval if @retval;
    }
    
    # The action did not return anything, continue!
    return $self->yylex;
}

sub __yyupdatePosition {
    my ($self, $length) = @_;

    $self->{__yypos} += $length;

    my ($fl, $fc, $ll, $lc) = @{$self->{__yylloc}};
    ($fc, $fl) = ($lc, $ll);

    # Negative columns signify that the last character is the newline from
    # the previous line.
    if ($fc < 0) {
        $fc = 0;
    }
    ++$fc;

    my $new_lines = $self->{yytext} =~ y/\n/\n/;
    my $eol = "\n" eq substr $self->{yytext}, -1, 1;

    if ($new_lines) {
        if ($eol) {
            my $lpos = rindex $self->{yyinput}, "\n", $self->{__yypos} - 2;
            $lc = -($self->{__yypos} - $lpos - 1);
        } else {
            my $lpos = rindex $self->{yyinput}, "\n", $self->{__yypos} - 1;
            $lc = $self->{__yypos} - $lpos - 1;
        }
        $ll += $new_lines;
    } else {
        $lc = $fc + $length - 1;
    }

    $self->{__yylloc} = [$fl, $fc, $ll, $lc];

    return $self;
}

sub yytext {
    shift->{yytext};
}

sub yypos {
    my ($self, $pos) = @_;
    
    if (defined $pos && $pos != $self->{__yypos}) {
        
        if ($pos < $self->{__yypos}) {
            require Carp;
            Carp::croak (__"Attempt to move lexer position pointer backwards!\n");
        }

        $self->__yyupdatePosition ($pos - $self->{__yypos});            
    }
    
    return 0 + $self->{__yypos};
}

sub yyless {
    my ($self, $num_keep) = @_;

    my $length = length $self->{yytext};
    $num_keep = 0 unless $num_keep;
    my $num_back = $length - $num_keep;
    return $self if $num_back <= 0;

    $self->{__yylloc} = $self->{__yyold_lloc};
    $self->__yyupdatePosition ($num_keep);
    
    $self->{__yypos} -= $num_back;
    
    return $self;
}

sub _yyin {
    my ($self) = @_;
    
    my $input;
    my $num_bytes = read $self->{yyin}, $input, 8192;
    
    unless (defined $num_bytes) {
        my $filename = $self->{yyin_name};
    
        if (defined $filename) {
            die __x("Error reading from '{filename}': {error}!\n",
                    filename => $filename, error => $!);
        } else {
            die __x("Error reading input file: {error}!\n",
                    error => $!);
        }    
    }
    
    return unless $num_bytes;
    
    return $input;
}

sub yybegin {
    my ($self, $sc) = @_;

    $sc = 'INITIAL' if '0' eq $sc;
    
    unless (exists $self->{__yystates}->{$sc}) {
        require Carp;
        
        Carp::croak (__x("Undefined start condition '{sc}'",
                         sc => $sc));
    }
    
    $self->{__yystate} = $sc;
    
    # Make it possible to use this method in an action, without returning
    # anything.
    return;
}

sub yylloc {
    my ($self) = @_;
    my ($fl, $fc, $ll, $lc) = @{$self->{__yylloc}};
    if ($fc < 0) {
        --$fl;
        $fc = - $fc;
    }
    if ($lc < 0) {
        --$ll;
        $lc = -$lc;
    }
    return $fl, $fc, $ll, $lc, $self->{yyin_name};
}

sub yyinput {
    my ($self, $input) = @_;
    
    if (defined $input) {
        $self->{yyinput} = $input;
        $self->{__yypos} = 0;
        $self->{yyinput_length} = length $input;
        return $self;
    } elsif ($self->{__yypos} >= $self->{yyinput_length}) {
        return;
    } else {
        return substr $self->{yyinput}, $self->{__yypos};
    } 
}

sub yywrap {
    my $self = shift;
    return $self;  # Default is to indicate end of input.
}


=head1 NAME

Imperia::ILex::Lexer - Abstract base class for Imperia Wisent scanners

=head1 SYNOPSIS

    # Always use the derived class, since the base class 
    # Imperia::ILex::Lexer is abstract.
    use MyLexer;

    my $lexer = MyScanner->new;
    $lexer->yylex();
    
=head1 DESCRIPTION

The B<Imperia::ILex::Lexer> class is an abstract base class for Imperia
Wisent scanners.  Derived classes are normally generated using 
site_ilex.pl(1pl).

=head1 CONSTRUCTORS

=over 4 

=item B<new ARGS>

The constructor takes a number of named arguments:

=over 8 

=item B<yyin FILEHANDLE>

The file handle to read the input stream from.

=back

=back

=head1 PUBLIC METHODS

=over 4

=item B<yylex>

The lexer function.

=back

=head1 PROTECTED METHODS

A number of methods are protected.  You can implement your own version in order
to change the behavior of the scanner:

=over 4

=item B<_yyin>

This function is called in order to fetch new data from the import stream.  It
must return data from the input stream, or an undefined value at end of file.

=back

=head1 COPYRIGHT

Imperia AG is the sole owner and producer of its software "Imperia". For
our software license and copyright information please refer to: License.txt
Copyright (C) 1995-2008 Imperia AG.  All rights reserved.

=head1 SEE ALSO

perl(1), site_ilex.pl(1pl)

=cut
#! /bin/false
package Locale::POFile::Lexer;

##########################################################################
# This file is generated.  Do not edit!
# Edit 'pofile.l' instead!
##########################################################################



package Locale::POFile::Lexer;

our $yyrule;

use base qw (Imperia::ILex::Lexer);

sub _yymatch {
    my ($self) = @_;
    use re qw (eval);
    return {
        INITIAL => qr /(((?s:.))(?{$yyrule = 1}))/o,
    };

}

sub _yyparens {
    return [0];
}

sub _yycode {
    return     [
sub {
    print $^N, return
},
    ];

}

sub _yystates {
    return {
        INITIAL => [],

    };
}



1;
