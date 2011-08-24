#! /bin/false

# Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
# All rights reserved. 
#
# This file is part of the Imperia Enterprise Content Management System.  You
# can distribute it under the same terms and conditions as Perl itself.

# FIXME: The original implementation had the goto table merged into the
# actions table.  That means that there is probably code unnecessarily checking
# whether a certain key into the actions table is a terminal or not.

package Imperia::Wisent::Bootstrap::Parser;

use strict;

use Locale::TextDomain qw (imperia);

use base qw (Imperia::Wisent::Bootstrap::ParserBase);
use Imperia::Wisent;

sub new {
    my ($class, %args) = @_;

    my $self = $class->SUPER::new (%args);

    $self->{__symbols} = {
        '$end' => {
            value => 0,
        },
        'error' => {
            value => 1,
        },
    };

    $self->{__terminals} = {
        0 => 1,
        1 => 1,
    };
    
    $self->{__rules} = [];
    
    $self->{__symbol_count} = 1;
    $self->{__dollar_count} = 1;

    $self->{__assoc} = {};

    $self->{__intro_code} = [];
       
    return $self;
}

sub __addIntroCode {
    my ($self, $code, $location) = @_;

    push @{$self->{__intro_code}}, [$code, $location];
    
    return $self;
}

sub introCode {
    shift->{__intro_code};
}

sub __addTokens {
    my ($self, $token, $defs) = @_;
    
    my @numbers;
    
    foreach my $def (@$defs) {
        my ($name, $location) = @$def;
        
        if ('error' eq $name) {
            $self->__errorAt (__(<<EOF), $location);
The name 'error' is reserved for internal use.
EOF
            next;
        }
        if (exists $self->{__symbols}->{$name}) {
            my $here_loc = $self->{__symbols}->{$name}->{location};
            my ($fl, $fc, $ll, $lc, $filename) = @$here_loc;
            my $here = "$filename:$fl.$fc-$ll.$lc";
            return $self->__errorAt (__x(<<EOF, name => $name, here => $here), $location);
Token '{name}' already declared here: {here}
EOF
            next;
        }
    
        my $number = $self->__qualifySymbol ($name, $location);
        push @numbers, $number;

        $self->{__terminals}->{$number} = 1;
        
        if  ($token eq 'left') {
            $self->{__assoc}->{$number} = -1;
        } elsif ($token eq 'right') {
            $self->{__assoc}->{$number} = 1;
        } elsif ($token eq 'nonassoc') {
            $self->{__assoc}->{$number} = 0;
        }
    }
    
    if ('left' eq $token
        || 'right' eq $token
        || 'nonassoc' eq $token) {
        push @{$self->{__precedence_groups}}, [@numbers];
    }

    return \@numbers;
}

sub __qualifySymbol {
    my ($self, $name, $location) = @_;
   
    # FIXME! Find a general solution for the quoting stuff, do not call
    # private methods ...
    $name = Imperia::Wisent->__unquote ($name);
    
    return $self->{__symbols}->{$name}->{value}
        if exists $self->{__symbols}->{$name};
        
    my $number = ++$self->{__symbol_count};
    
    $self->{__symbols}->{$name} = {
        value => $number,
        location => $location,
    };
    
    if ("'" eq substr $name, 0, 1) {
        $self->{__terminals}->{$number} = $self->{__literals}->{$number} = 1;
    }
    
    return $number;
}

sub __errorAt {
    my ($self, $msg, $location) = @_;
    
    my ($fl, $fc, $ll, $lc, $filename) = @$location;
    chomp $msg;

    push @{$self->{__errors}}, "$filename:$fl.$fc-$ll.$lc: error: $msg\n";
    
    return;
}

sub numberOfErrors {
    my $self = shift;
    
    return 0 unless $self->{__errors};
    
    return scalar @{$self->{__errors}};
}

sub messages {
    shift->{__errors};
}

sub epilogue {
    shift->{__epilogue};
}

sub __addRuleset {
    my ($self, $ntermdef, $rhss) = @_;

    my ($ntermname, $ntermlocation) = @$ntermdef;
    
    unless (exists $self->{__symbols}->{'$accept'}) {
        $self->__qualifySymbol ('$accept');
    }
    
    my $nterm = $self->__qualifySymbol ($ntermname, $ntermlocation);
    
    unless (@$rhss) {
        push @{$self->{__rules}}, {
            nterm => $nterm,
            location => $ntermlocation,
            rhs => []
        };
        return $self;
    }
        
    foreach my $rhs (@$rhss) {
        my $rule = {
            nterm => $nterm,
            location => $ntermlocation,
            rhs => [],
        };
        
        my $count = 0;
        foreach my $component (@$rhs) {
            my ($type, $value, $location) = @$component;
                        
            if ('SYMBOL' eq $type) {
                my $symbol = $self->__qualifySymbol ($value, $location);
                
                push @{$rule->{rhs}}, {
                    symbol => $symbol,
                    location => $location,
                };
            } elsif ('CODE' eq $type) {
                if ($count == $#$rhs) {
                    $rule->{action} = {
                        code => $value,
                        location => $location,
                    };
                } else {
                    # We have to silently insert a rule.  This is a little
                    # tricky, since we must be sure to deep-copy all
                    # references, that are not shared between the rules.
                    my $dollar_count = $self->{__dollar_count}++;
                    my $dollar_nterm_name = "\$\$$dollar_count";
                    my $dollar_nterm = 
                        $self->__qualifySymbol($dollar_nterm_name,
                                               $location);
                    my $extrarule = {
                        nterm => $dollar_nterm,
                        location => $location,
                        action => {
                            code => $value,
                            location => $location,
                        },
                        rhs => [],
                    };
                    push @{$rule->{rhs}}, {
                        symbol => $dollar_nterm,
                        location => $location,
                    };
                    push @{$self->{__rules}}, $extrarule;
                }
            } elsif ('PREC' eq $type) {
                my (undef, $precname, $preclocation, $symbol_location) = @$component;
                if (exists $rule->{prec}) {
                    my $where = $self->__locationToString (
                        $rule->{prec}->{prec_location}
                    );
                    $self->__errorAt (__x(<<EOF, where => $where), $preclocation);
This rule has already an '%prec' directive here: {where}.
EOF
                    next;
                }
                
                unless (exists $self->{__symbols}->{$precname}) {
                    $self->__errorAt (__x(<<EOF, name => $precname), $preclocation);
Symbol '{name}' used for precedence declaration, is not defined.
EOF
                    next;
                }
                
                my $prec = $self->{__symbols}->{$precname}->{value};
                unless (exists $self->{__terminals}->{$prec}) {
                    $self->__errorAt (__x(<<EOF, name => $precname), $preclocation);
Symbol '{name}' used for precedence declaration, is not a terminal.
EOF
                    next;
                }

                $rule->{prec} = {
                    terminal => $prec,
                    prec_location => $preclocation,
                    symbol_location => $symbol_location,
                };
            }
            
            ++$count;
        }
        push @{$self->{__rules}}, $rule;
    }
    
    return $self;
}

sub __addEpilogue {
    my ($self, $code, $location) = @_;

    $self->{__epilogue} = [ $code, $location ];
    
    return $self;
}

sub __locationToString {
    my ($self, $location) = @_;
    
    my ($fl, $fc, $ll, $lc, $filename) = @$location;
    
    return "$filename: $fl.$fc-$ll.$lc";   
}

sub rules {
    shift->{__rules};
}

sub startSymbol {
    shift->{__start};
}

sub expect {
    shift->{__expect};
}

sub symbols {
    shift->{__symbols};
}

sub terminals {
    shift->{__terminals};
}

sub literals {
    shift->{__literals};
}

sub precedenceGroups {
    shift->{__precedence_groups};
}

sub associativity {
    shift->{__assoc};
}

sub data {
    my $self = shift;
    
    my $rules = $self->{__rules};
    
    my $output = '';

    my @names;
    foreach my $name (keys %{$self->{__symbols}}) {
        my $value = $self->{__symbols}->{$name}->{value};
        $names[$value] = $name;
    }

    my $count = 1;
    foreach my $rule (@$rules) {
        $output .= "$count $names[$rule->{nterm}]:";
        
        my $rhs = $rule->{rhs};
        
        if (@$rhs) {
            foreach my $symdef (@$rhs) {
                $output .= " $names[$symdef->{symbol}]";
            }
        } else {
            $output .= " /* empty */";
        }
        
        if (exists $rule->{prec}) {
            $output .= ' %prec ' . $names[$rule->{prec}->{terminal}];
        }
        
        if (exists $rule->{action}) {
            $output .= " $rule->{action}->{code}";
        }
        
        $output .= "\n";
        
        ++$count;
    }
    
    return $output;
}

1;

=head1 NAME

Imperia::Wisent::Bootstrap::ParserHandler - Callbacks for .y file parser

=head1 SYNOPSIS

    use Imperia::Wisent::Bootstrap::Base;
    
    my $parser = Imperia::Wisent::Bootsrap::Base->new;
    $parser->yyparse (yylex => \&lexer, yyerror => \&error_reporter);
    
=head1 DESCRIPTION

The B<Imperia::Wisent::Bootstrap::Base> class contains the code that is
executed while parsing grammar files.  It collects all the information found,
and provides that data to the caller.  The class is used as the backed
to Imperia::Wisent.  You normally will not want to use it directly.

=head1 INHERITANCE

The class inherits from the generated class 
Imperia::Wisent::Bootstrap::Parser(3pm), which in turn inherits from
Imperia::Wisent::Parser(3pm).

=head1 COPYRIGHT

Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
All rights reserved. 

This file is part of the Imperia Enterprise Content Management System.  You
can distribute it under the same terms and conditions as Perl itself.

=head1 SEE ALSO

perl(1), site_wisent.pl(1pl), Imperia::Wisent(3pm),
Imperia::Wisent::Parser(3pm)

=cut
