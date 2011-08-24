#! /bin/false

# Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
# All rights reserved. 
#
# This file is part of the Imperia Enterprise Content Management System.  You
# can distribute it under the same terms and conditions as Perl itself.

package Imperia::Wisent;

use strict;

use Data::Dumper;
use Locale::TextDomain qw (imperia);
use Imperia::Wisent::Bootstrap::Parser;
use Imperia::Wisent::Bootstrap::Lexer;

# FIXME! Verify that all of these are valid!
my %unquote_map = (
    0 => "\0",
    a => "\a",
    b => "\b",
    t => "\t",
    n => "\n",
    # Since Perl does not know about \v we also ignore it!
    f => "\f",
    r => "\r",
    '\\' => '\\',
);
my %quote_map = reverse %unquote_map;

sub new {
    my ($class, $input, %args) = @_;
    
    my $self = {
        __input => $input,
        __input_file => $args{input_file} || "unknown",
        __package => $args{package},
        __errors => [],
    };
    
    unless (defined $self->{__package}) {
        $self->{__package} = $self->{__input_file};
        $self->{__package} =~ s/\.[yY]$//;
        $self->{__package} =~ s{.*[/\\]}{};
    }
    bless $self, $class;
    
    $self->{__expect} = 0;
    
    $self->__parseGrammar;
    
    return $self;
}

sub parser {
    shift->{__parser};
}

sub __lalr1 {
    my ($self) = @_;

    my $automaton = $self->{__automaton};

    my @states;
    $self->{__states} = $automaton->{states} = \@states;

    # Current states.
    push @states, {
        kernel => [[0, 0]],
    };

    # States to inspect.
    my @todo = (0);
   
    my $rules = $automaton->{rules};
    my $symbols = $automaton->{symbols};
    my $names = $automaton->{names};
    my $terminals = $automaton->{terminals};

    my %seen;

    my %shift;
    $self->{__shift} = \%shift;
    my %goto;
    $self->{__goto} = \%goto;

    while (@todo) {
        my $stateno = shift @todo;
        my $state = $states[$stateno];

        my $closure = $self->__closure (@{$state->{kernel}});
        
        # Deep copy is only needed for development, in order to make
        # Data::Dumper output readable.
        $state->{items} = [];
        foreach my $item (@$closure) {
            my ($ruleno, $dotpos) = @$item;
            push @{$state->{items}}, [$ruleno, $dotpos];
        }
 
        # First, find out which symbols can follow at the current position.
        # Remember the items for all symbols found, and divide the symbols
        # into terminals and non-terminals.
        my %items;
        my @terminals;
        my @non_terminals;
        my %symbols2items;
               
        foreach my $item (@$closure) {
            my ($ruleno, $dotpos) = @$item;
            my $rule = $rules->[$ruleno];
            next if $dotpos == $#$rule;
            
            my $symbol = $rules->[$ruleno]->[$dotpos + 1];
            
            if (defined $items{$symbol}) {
                push @{$items{$symbol}}, $item;
            } else {
                if ($automaton->{terminals}->{$symbol}) {
                    push @terminals, $symbol;
                } else {
                    push @non_terminals, $symbol;
                }
                $items{$symbol} = [$item];
            }
            push @{$symbols2items{$symbol}}, $item;
        }

        # Now, for each symbol following, create a new state.  The items that
        # have this symbol at the head of the right hand side, are the kernel
        # of the new item set.
        foreach my $symbol (@terminals, @non_terminals) {
            my @kernel;
            my $digest = '';
            foreach my $item (@{$items{$symbol}}) {
                my ($ruleno, $dotpos) = @$item;
                my $rule = $rules->[$ruleno];
                next if $dotpos == $#$rule;
                push @kernel, [$ruleno, $dotpos + 1];
                $digest .= ':' . $ruleno . ':' . $dotpos;
            }
            next unless @kernel;
            
            my $next_state_no;
            
            if ($seen{$digest}) {
                $next_state_no = $seen{$digest};
            } else {
                $next_state_no = @states;
                $seen{$digest} = $next_state_no;
            
                push @states, {kernel => \@kernel};
                push @todo, $#states;
            }
                
            if (exists $automaton->{terminals}->{$symbol}) {
                $shift{$stateno}->{$symbol} = $next_state_no;
            } else {
                $goto{$stateno}->{$symbol} = $next_state_no;
            }
        }
    }

    # Write the compressed parse table.
    my $shift_reduce = 0;
    my $reduce_reduce = 0;
    my $conflicts = $self->{__conflicts} = {};

    # Calculate all rule precedences and associativities.
    my @precedences;
    $#precedences = $#$rules;
    foreach my $ruleno (0 .. $#$rules) {
        my $rule = $rules->[$ruleno];
        foreach my $dotpos (reverse (1 .. $#$rule)) {
            my $symbol = $rule->[$dotpos];
            if (exists $terminals->{$symbol}) {
                $precedences[$ruleno] = $self->{__precedence}->{$symbol};
                last;
            }
        }
    }

    $self->__computeLookAheads ($automaton);

    my %reduction;
    my %default;
    foreach my $stateno (0 .. $#states) {
        my $state = $states[$stateno];
        my $items = $state->{items};
        foreach my $item (reverse @$items) {
            my ($ruleno, $dotpos) = @$item;
            my $rule = $rules->[$ruleno];
            
            # This is not a reduction.
            next unless $#$rule == $dotpos;
            $default{$stateno} = $ruleno;
            
            my $look_ahead;
            if (0 == $ruleno) {
                $look_ahead =  {keys %$terminals};
            } else {
                $look_ahead = $self->__lookAhead ($stateno, $item); 
            }    
            
            foreach my $terminal (keys %$look_ahead) {
                $reduction{$stateno}->{$ruleno}->{$terminal} = 1;
            }
        }
    }

    # Solve shift-reduce conflicts with precedence.
    my %error;
    foreach my $stateno (0 .. $#states) {
        next unless exists $shift{$stateno};
        next unless exists $reduction{$stateno};

        my %shifts = %{$shift{$stateno}};
        
        foreach my $ruleno (0 .. $#$rules) {
            my $rp = $precedences[$ruleno];

            next unless $rp;
            next unless exists $reduction{$stateno}->{$ruleno};

            my %look_ahead = %{$reduction{$stateno}->{$ruleno}};
                        
            foreach my $terminal (keys %shifts) {
                next unless exists $look_ahead{$terminal};
                
                my $sp = $self->{__precedence}->{$terminal};
                
                next unless $sp;
                
                if ($sp > $rp) {
                    delete $reduction{$stateno}->{$ruleno}->{$terminal};
                } elsif ($sp < $rp) {
                    delete $shift{$stateno}->{$terminal};
                } else {
                    my $assoc = $self->{__assoc}->{$terminal};
                    next unless defined $assoc;
                    
                    if ($assoc < 0) {
                        delete $shift{$stateno}->{$terminal};
                    } elsif ($assoc > 0) {
                        delete $reduction{$stateno}->{$ruleno}->{$terminal};
                    } elsif ($assoc == 0) {
                        delete $reduction{$stateno}->{$ruleno}->{$terminal};
                        $error{$stateno}->{$terminal} = 1;
                    }
                }
            }
        }
    }

    my @rules_conflicting;
    $#rules_conflicting = $#$rules;

    foreach my $stateno (keys %reduction) {
        my $state = $states[$stateno];

        my @rules = sort { $a <=> $b } keys %{$reduction{$stateno}};
        next unless @rules;
        
        foreach my $ruleno (@rules) {
            my @terminals = keys %{$reduction{$stateno}->{$ruleno}};
            foreach my $terminal (@terminals) {
                if (exists $shift{$stateno}->{$terminal}) {
                    ++$shift_reduce;
                    push @{$conflicts->{$stateno}->{$terminal}}, $ruleno;
                    # No next here!  We also have to detect and count a 
                    # possible additional reduce/reduce conflict.  If there
                    # is no such additional conflict, we erroneously write
                    # a reduce for the terminal, but that will be later
                    # overwritten by the shift.
                }
                if (exists $state->{actions}->{$terminal}) {
                    ++$reduce_reduce;
                    push @{$conflicts->{$stateno}->{$terminal}}, $ruleno;
                    next;
                }
                $state->{actions}->{$terminal} = [ r => $ruleno ];
            }
        }
    }
        
    foreach my $stateno (sort { $a <=> $b } keys %shift) {
        my $state = $states[$stateno];
        while (my ($symbol, $next_state_no) = each %{$shift{$stateno}}) {
            $state->{actions}->{$symbol} = [ s => $next_state_no];
        }
    }

    foreach my $stateno (keys %goto) {
        my $state = $states[$stateno];
        while (my ($symbol, $next_state_no) = each %{$goto{$stateno}}) {
            $state->{goto}->{$symbol} = $next_state_no;
        }
    }

    foreach my $stateno (keys %default) {
        $states[$stateno]->{default} = [ r => $default{$stateno} ];
    }
    
    foreach my $stateno (keys %error) {
        my $state = $states[$stateno];
        foreach my $terminal (keys %{$error{$stateno}}) {
            $state->{actions}->{$terminal} = [ e => 1 ];
        }
    }

    my @rules_reduced;
    $#rules_reduced = $#$rules;
    
    foreach my $stateno (0 .. $#states) {
        my $state = $states[$stateno];
        my $default = $state->{default};

        foreach my $terminal (keys %{$state->{actions}}) {
            my $action = $state->{actions}->{$terminal};
            my ($what, $where) = @$action;
            
            if ('r' eq $what) {
                $rules_reduced[$where] = 1;
                delete $state->{actions}->{$terminal} 
                    if defined $default && $where == $default->[1];
            }
        }
    }

    $self->{__shift_reduce} = $shift_reduce;
    $self->{__reduce_reduce} = $reduce_reduce;
    $self->{__rules_never_reduced} = {};
    $self->{__rules_conflicting} = {};
    foreach my $ruleno (0 .. $#rules_reduced) {
        next if $rules_reduced[$ruleno];
        $self->{__rules_never_reduced}->{$ruleno} = 1
            unless $rules_reduced[$ruleno];
        $self->{__rules_conflicting}->{$ruleno} = 1
            if $rules_conflicting[$ruleno];
    }
         
    return $automaton;
}

sub expect {
    shift->{__expect};
}

sub numberShiftReduceConflicts {
    shift->{__shift_reduce};
}

sub numberReduceReduceConflicts {
    shift->{__reduce_reduce};
}

sub rulesNeverReduced {
    shift->{__rules_never_reduced};
}

sub rulesConflicting {
    shift->{__rules_conflicting};
}

sub __visualizeState {
    my ($self, $stateno, $full) = @_;
    
    my $automaton = $self->{__automaton};
    my $names = $automaton->{names};
    my $state = $automaton->{states}->[$stateno];
    my $rules = $automaton->{rules};
    
    my $output = '';
    my $last_symbol_name = '';
    my $count = 0;
    my $kernel_cardinality = scalar @{$state->{kernel}};

    foreach my $item (@{$state->{items}}) {
        # Full item set.
        my ($ruleno, $dotpos) = @$item;

        my $item_str = $ruleno . ':' . $dotpos;
        my $look_ahead = $self->{__look_ahead}->{$stateno}->{$item_str};

        my $plus = $count++ >= $kernel_cardinality ? '+' : '';
        last if $plus && !$full;
                    
        my $rule = $rules->[$ruleno];
        my $symbol_name = $names->[$rule->[0]];
        my @parts = map {$self->__quote ($names->[$_]), ' '} @$rule;
        if ($symbol_name eq $last_symbol_name) {
            $parts[0] = ' ' x length $symbol_name;
            $parts[0] .= '|';
        } else {
            $parts[0] .= ':';
            $last_symbol_name = $symbol_name;
        }
        $parts[$dotpos + $dotpos + 1] = ' . ';

        $output .= "    $plus$ruleno ";
        $output .= join '', @parts;

        if ($full && $look_ahead && %$look_ahead) {
            $output .= ' [';
     
            foreach my $terminal (sort { $names->[$a] cmp $names->[$b] 
                                       } keys %$look_ahead) {
                $output .= $self->__quote ($names->[$terminal]);
                $output .= ' ';
            }
            chop $output if %$look_ahead;
                
            $output .= ']';
        }
        
        $output .= "\n";            
    }
        
    return $output;    
}

sub __lineOffsets {
    my ($self, $input) = @_;
    
    # Calculate the byte offsets of all lines.
    my @line_offsets = (0);
    
    my $offset = 0;
    foreach (split /(\n)/, $input) {
        $offset += length $_;
        if ("\n" eq $_) {
            push @line_offsets, $offset;
        }
    }
    
    return \@line_offsets;    
}

sub __bailOut {
    my ($self, $msg, $location) = @_;

    $self->__errorAt ($msg, $location) if defined $msg && length $msg;
    foreach my $error (@{$self->{__errors}}) {
        warn $error;
    }
    
    die __"No output file generated!\n";
}

sub __errorAt {
    my ($self, $msg, $location) = @_;
    
    my $where = $self->__locationToString ($location);
    $where .= ': ' if defined $where && length $where;
    
    my $error = __"error";    
    chomp $msg;
    push @{$self->{__errors}}, "${where}error: $msg\n";
    
    return;
}

sub __parseGrammar {
    my ($self, $ppi_tokens) = @_;
    
    my $lexer = Imperia::Wisent::Bootstrap::Lexer->new (yyin_name =>
                                                        $self->{__input_file});
    $lexer->yyinput ($self->{__input});
                                                        
    my $parser = 
        Imperia::Wisent::Bootstrap::Parser->new;
    $self->{__parser} = $parser;
        
    $parser->yyparse ($lexer, yydebug => $ENV{WISENT_DEBUG});
    my $num_errors = 0;
    if ($parser->numberOfErrors) {
        $num_errors += $parser->numberOfErrors;
        my $errors = $parser->messages;
        foreach my $error (@$errors) {
            warn $error;
        }
    }
    $self->{__expect} = $parser->expect;
    
    my $full_rules = $parser->rules;
    $self->__bailOut (__"No rules found!") unless @$full_rules;

    $self->{__prec} = {};

    my $automaton = $self->{__automaton} = {};
    
    $automaton->{names} = [];
    $automaton->{terminals} = {};
    # Already leave one entry for the augmenting rule.
    $automaton->{rules} = [[]];
    $automaton->{terminals} = $parser->terminals;
    $automaton->{literals} = $parser->literals;
    $automaton->{non_terminals} = {};
        
    my $full_symbols = $parser->symbols;
    foreach my $symbol_name (keys %$full_symbols) {
        my $spec = $full_symbols->{$symbol_name};
        my $symbol = $spec->{value};
        $automaton->{names}->[$symbol] = $self->__unquote ($symbol_name);
        $automaton->{non_terminals}->{$symbol} = 1
            unless $automaton->{terminals}->{$symbol};
        $automaton->{symbols}->{$symbol_name} = $symbol;
    }

    my %definitions;
    $self->{__definitions} = \%definitions;
    foreach my $ruleno (0 .. $#$full_rules) {
        my $full_rule = $full_rules->[$ruleno];
        my @rule = ($full_rule->{nterm});
        foreach my $spec (@{$full_rule->{rhs}}) {
            my $symbol = $spec->{symbol};
            push @rule, $symbol;
            $self->{__terminal_uses}->{$symbol}->{$ruleno + 1} = 1;
        }
        if (exists $full_rule->{action}) {
            my $location = $full_rule->{action}->{location};
            my $code = qq{\n#line $location->[0] "$location->[4]"\n}
                . $full_rule->{action}->{code};
            my $compno = $#rule;
            $self->{__semantics}->{$ruleno}->{$compno} = $code;
        }
        push @{$definitions{$rule[0]}}, $ruleno + 1;
        push @{$automaton->{rules}}, \@rule;
        
        if ($full_rule->{prec}) {
            $self->{__prec}->{$ruleno + 1} = $full_rule->{prec}->{terminal};
        }
    }
    $definitions{$automaton->{symbols}->{'$accept'}} = [0];
    
    foreach my $symbol (keys %{$automaton->{non_terminals}}) {
        next if $automaton->{terminals}->{$symbol};
        next if $definitions{$symbol};
        next if '$accept' eq $automaton->{names}->[$symbol];
        my ($location, $name) = $self->__symbolLocation ($symbol);
        $self->__errorAt (__x(<<EOF, name => $name), $location);
The symbol {name} is never defined!
EOF
    }
    
    my $start_spec = $parser->startSymbol;
    if ($start_spec) {
        my ($name, $loc1, $loc2) = @$start_spec;
        my $symbol_name = $self->__unquote ($name);
        
        if (!exists $automaton->{symbols}->{$symbol_name}) {
            $self->__errorAt (__x(<<EOF, symbol => $name), $loc2);
The start symbol {symbol} is not defined!
EOF
        } else {            
            my $symbol = $automaton->{symbols}->{$symbol_name};
            if (exists $automaton->{terminals}->{$symbol}) {
                $self->__errorAt (__x(<<EOF, symbol => $name), $loc2);
The start symbol {symbol} is a terminal, not a non-terminal!
EOF
            } elsif (!$definitions{$symbol}) {
                $self->__errorAt (__x(<<EOF, symbol => $name), $loc2);
No rule defines the start symbol {symbol}!
EOF
            } else {
                $self->{__start} = $symbol;
            }
        }
    } else {
        $self->{__start} = $automaton->{rules}->[1]->[0];
    }

    $automaton->{rules}->[0] = [
        $automaton->{symbols}->{'$accept'},
        $self->{__start},
        $automaton->{symbols}->{'$end'},
    ];
    $self->{__terminal_uses}->{$automaton->{symbols}->{'$end'}}->{0} = 1;
    
    my $precedence = 0;
    my $precedence_groups = $parser->precedenceGroups;
    
    foreach my $symbol (keys %{$automaton->{terminals}}) {
    	$self->{__precedence}->{$symbol} = 0;
    }

    foreach my $group (@{$precedence_groups}) {
    	++$precedence;
    	foreach my $symbol (@$group) {
	    $self->{__precedence}->{$symbol} = $precedence;
	}
    }

    $self->{__assoc} = $parser->associativity;
    
    $self->__bailOut if @{$self->{__errors}};

    $self->__lalr1;

    my $auto_dump = Dumper $self->{__automaton};
    $auto_dump =~ s/^.*?=//;
        
    my $semantics = <<EOF;
sub _yysemantics {
    return {
EOF

    foreach my $ruleno (sort { $a <=> $b } keys %{$self->{__semantics}}) {
        my $rn = $ruleno + 1;
        $semantics .= "        '$rn' => {\n";
        foreach my $compno (keys %{$self->{__semantics}->{$ruleno}}) {
            my $sub = $self->{__semantics}->{$ruleno}->{$compno};
            $semantics .= "            '$compno' => sub $sub,\n";
        }
        $semantics .= "},\n";
    }
    
    $semantics .= <<EOF;
    };
}
EOF

    my $output = '';
    my $intro_code = $parser->introCode;
    foreach my $code (@$intro_code) {
        my ($snippet, $location) = @$code;
        
        my $filename = $location->[4];
        my $lineno = $location->[0];
        $output .= qq{#line $lineno "$filename"\n};
        $output .= $snippet;
    }
 
    # FIXME! Only write this on demand (-d specified on command-line).
    my $exports = "\%EXPORT_TAGS = (yyterminals => [\n";

    # FIXME! Is $end needed? If it is, either give it a new name (valid Perl
    # subroutine name) or assign it a constant value.
    my $names = $automaton->{names};
    foreach my $symbol (sort { $names->[$a] cmp $names->[$b] }
                        keys %{$automaton->{terminals}}) {
        next if exists $automaton->{literals}->{$symbol};
        my $symbol_name = $names->[$symbol];
        next if '$end' eq $symbol_name;
        $exports .= "\t'$symbol_name',\n";
    }
    
    $exports .= "]);\n\n";
    
    $exports .= "\@EXPORT_OK = (\n";
    
    foreach my $symbol (sort { $names->[$a] cmp $names->[$b] }
                        keys %{$automaton->{terminals}}) {
        next if exists $automaton->{literals}->{$symbol};
        my $symbol_name = $names->[$symbol];
        next if '$end' eq $symbol_name;
        $exports .= "\t'$symbol_name',\n";
    }
        
    $exports .= ");\n";

    foreach my $symbol (sort { $names->[$a] cmp $names->[$b] }
                        keys %{$automaton->{terminals}}) {
        next if exists $automaton->{literals}->{$symbol};
        my $symbol_name = $automaton->{names}->[$symbol];
        next if '$end' eq $symbol_name;
        $exports .= "use constant $symbol_name => $symbol;\n";
    }
    $exports .= "\n";
    
    my $outro = '';
    my $epilogue = $parser->epilogue;
    if (defined $epilogue) {
        my ($code, $location) = @$epilogue;
        my $lineno = $location->[0];
        my $filename = $location->[4];
        
        $outro = qq{\n#line $lineno "$filename"\n}
               . $code;
    }
                            
    $output .= <<EOF;

###########################################################################
# This file is generated, do not edit!
# Edit `$self->{__input_file}' instead!
###########################################################################

package $self->{__package};

use base qw (Imperia::Wisent::Parser Exporter);

use vars qw (\@EXPORT_OK \%EXPORT_TAGS);

$exports

use constant _yyautomaton => $auto_dump;

$semantics

1;$outro
EOF

    $self->{__parser} = $output;

    return $self;
}

sub __locationToString {
    my ($self, $location) = @_;
    
    my ($fl, $fc, $ll, $lc, $filename);
    ($fl, $fc, $ll, $lc, $filename) = @$location if $location;

    $filename = $self->{__input_file} unless defined $filename;
    $filename = '' unless defined $filename;
    
    my $where = $filename;
    if ($where) {
        $where .= ':';
        if ($fl && $fc) {
            $where .= "$fl" if $fl;
            $where .= ".$fc" if $fc;
            if ($ll && $lc) {
                $where .= "-$ll" if $ll;
                $where .= ".$lc" if $lc;
            }
        }
    }

    return $where;   
}

sub __symbolLocation {
    my ($self, $symbol) = @_;
    
    my $automaton = $self->{__automaton};
    my $names = $automaton->{names};
    
    my $name = $names->[$symbol];
    return unless defined $name;
    
    my $full_symbols = $self->{__parser}->symbols;
    my $location = $full_symbols->{$name}->{location};
    
    $name = $self->__quote ($name);
    return wantarray ? ($location, $name) : $location;
}

sub __lookAhead {
    my ($self, $stateno, $item) = @_;

    my ($ruleno, $dotpos) = @$item;
 
    my $item_str = $ruleno . ':' . $dotpos;
    
    my $look_aheads = $self->{__look_ahead}->{$stateno};
    return $look_aheads->{$item_str}
        if exists $look_aheads->{$item_str};
    return {};
}

# Computes the closure.
sub __closure {
    my ($self, @items) = @_;
    
    my @closure = @items;
    my @todo = @items;

    my $rules = $self->{__automaton}->{rules};
    my $non_terminals = $self->{__automaton}->{non_terminals};
    my $definitions = $self->{__definitions};
    
    my %seen;
    while (@todo) {
        my $item = shift @todo;
        my ($ruleno, $dotpos) = @$item;
        
        my $rule = $rules->[$ruleno];
        next if $dotpos == $#$rule;
        my $symbol = $rule->[$dotpos + 1];
        
        next if $seen{$symbol}++;

        if (exists ($non_terminals->{$symbol})) {
            my $defs = $definitions->{$symbol};
            foreach my $ruleno (@$defs) {
                push @closure, [$ruleno, 0];
                push @todo, [$ruleno, 0];
            }
        }
    }
    
    return \@closure;
}

sub graphViz {
    my ($self) = @_;
    
    require GraphViz;
    
    my $g = GraphViz->new;
    
    my $automaton = $self->{__automaton};
    my $states = $automaton->{states};
    my $rules = $automaton->{rules};
    my $names = $automaton->{names};
    foreach my $stateno (0 .. $#$states) {
        my $state = $states->[$stateno];
        my $label = __x"State {no}", no => $stateno;
        $label .= "\n\n";
        
        $label .= $self->__visualizeState ($stateno, 0);

        $g->add_node ($stateno, label => $label);
        
        ++$stateno;
    }

    my $shifts = $self->{__shift};
    my $gotos = $self->{__goto};
    
    foreach my $stateno (0 .. $#$states) {
        my $state = $states->[$stateno];

        if (exists $shifts->{$stateno}) {
            my $shift = $shifts->{$stateno};    
            while (my ($symbol, $to_stateno) = each %$shift) {
                my $symbol_name = $names->[$symbol];
                $g->add_edge ($stateno, $to_stateno, label => $symbol_name);
            }
        }   
        if (exists $gotos->{$stateno}) {
            my $goto = $gotos->{$stateno};    
            while (my ($symbol, $to_stateno) = each %$goto) {
                my $symbol_name = $names->[$symbol];
                $g->add_edge ($stateno, $to_stateno, label => $symbol_name);
            }
        }   
    }

    return $g;
}

# Aliases.
sub graphviz { &graphViz }
sub GraphViz { &graphViz }

sub verboseDescription {
    my ($self, $all) = @_;

    my $output = '';

    my $automaton = $self->{__automaton};
    my $symbols = $automaton->{symbols};
    my $rules = $automaton->{rules};
    my $names = $automaton->{names};
    my $literals = $automaton->{literals};
    my $terminals = $automaton->{terminals};
    my $non_terminals = $automaton->{non_terminals};
    my $states = $automaton->{states};
        
    # Try to find unused terminals.
    my %unused_terminals = %{$automaton->{terminals}};
    foreach my $terminal (keys %unused_terminals) {
        delete $unused_terminals{$terminal} 
            if exists $self->{__literals}->{$terminal};
    }

    delete $unused_terminals{$symbols->{error}};

    foreach my $rule (@$rules) {
        # We know that the first element is always a non-terminal, so we can
        # simply delete the name from the list of unused terminals (because
        # a possible name conflict has been detected earlier.
        foreach my $component (@$rule) {
            delete $unused_terminals{$component};
        }
    }

    foreach my $ruleno (keys %{$self->{__prec}}) {
        delete $unused_terminals{$self->{__prec}->{$ruleno}};
    }
    
    my $has_unused_terminals = keys %unused_terminals;

    if ($has_unused_terminals) {
        $output .= "\n";
        $output .= __"Unused terminals:\n\n";

        foreach my $symbol (sort (keys %unused_terminals)) {
            my $name = $self->__quote($names->[$symbol]);
            $output .= "\t$name\n";
        }
        $output .= "\n";
    }

    if (keys %{$self->{__conflicts}}) {
        $output .= "\n";
        foreach my $stateno (sort { $a <=> $b } keys %{$self->{__conflicts}}) {
            $output .= __x("State {stateno} conflicts: ", stateno => $stateno);
            my $actions = $self->{__states}->[$stateno]->{actions};
     
            my $errors = 0;
            my $sr = 0;
            my $rr = 0;
            
            my $conflicts = $self->{__conflicts}->{$stateno};
            
            foreach my $terminal (keys %$conflicts) {
                my $action = $actions->{$terminal}->[0];
                $action = $self->{__states}->[$stateno]->{default}->[0]
                    unless ($action 
                            && exists $self->{__states}->[$stateno]->{default});
                if ('s' eq $action) {
                    ++$sr;
                } elsif ('r' eq $action) {
                    ++$rr;
                } elsif ('e' eq $action) {
                    ++$errors;
                }
            }
            
            my @conflicts;

            if ($sr) {
                push @conflicts, __nx("one shift/reduce conflict",
                                      "{num_conflicts} shift/reduce conflicts",
                                      $sr,
                                      num_conflicts => $sr);
            }
            
            if ($rr) {
                push @conflicts, __nx("one reduce/reduce conflict",
                                      "{num_conflicts} reduce/reduce conflicts",
                                      $rr,
                                      num_conflicts => $rr);
            }
            
            if ($errors) {
                push @conflicts, __nx("one error (non-associative)",
                                      "{num_errors} errors (non-associative)",
                                      $errors,
                                      num_errors => $errors);
            }
            
            $output .= join ', ', @conflicts;
            
            $output .= "\n";
        }
    }
    
    $output .= <<EOF;

Grammar:
EOF
    
    my $last_nt = -1;
    
    my $line_digits = 5;  # FIXME! Calculate decadic logarithm for that.
    my $count = 0;
    foreach my $rule (@$rules) {
        my ($nt, @symbols) = @$rule;

        my $new_nt = $last_nt != $nt;
        $last_nt = $nt;
        my $nt_name = $names->[$nt];

        my @symbol_names = map { $self->__quote($names->[$_]) } @symbols;
        # TRANSLATORS: This translation must not contain the string '*/'!
        my $empty = __"/empty";
        @symbol_names = ("/* $empty */") unless @symbol_names;

        if ($new_nt) {
            $output .= sprintf "\n%${line_digits}d $nt_name: ", $count++;
        } else {
            my $spaces = ' ' x (length $nt_name);
            $output .= sprintf "%${line_digits}d $spaces| ", $count++;
        }

        $output .= join ' ', @symbol_names;
        $output .= "\n";
    }
    
    $output .= "\n\n";
    $output .= __"Terminals and the rules where they are used:";
    $output .= "\n\n";

    foreach my $symbol (sort { $a <=> $b } keys %$terminals) {
        my $symbol_name = $self->__quote($names->[$symbol]);
        $output .= $symbol_name . ' (' . $symbol . ')';

        $output .= join ' ', '', sort {$a <=> $b}
            keys %{$self->{__terminal_uses}->{$symbol}};

        $output .= "\n";
    }
    
    $output .= "\n\n";
    $output .= __"Non-terminals and the rules where they are used:";
    $output .= "\n\n";

    my %used_non_terminals;
    my $ruleno = 0;
    foreach my $rule (@$rules) {
        foreach my $symbol (@$rule[1 .. $#$rule]) {
            next unless exists $non_terminals->{$symbol};
            push @{$used_non_terminals{$symbol}}, $ruleno;
        }
        ++$ruleno;
    }

    my $definitions = $self->{__definitions};
    foreach my $symbol (sort { $a <=> $b } keys %$non_terminals) {
        my $name = $names->[$symbol];    
        $output .= $name . '(' . $symbol . ")\n";
        
        $output .= '    ' . __"on left:" . ' ' 
            . join ' ', @{$self->{__definitions}->{$symbol}};

        if (exists $used_non_terminals{$symbol}) {
            $output .= ",\n";
            my %uniq = map {$_ => 25031976} @{$used_non_terminals{$symbol}};
            $output .= '    ' . __"on right:" . ' '
                . join ' ', sort { $a <=> $b }keys %uniq;
            $output .= "\n";
        } else {
            $output .= "\n";
        }
    }

    foreach my $state_no (0 ..$#{$states}) {
        my $state = $states->[$state_no];
        $output .= "\n\n";
        $output .= __x"state {state}\n", state => $state_no;
        $output .= "\n";
        $output .= $self->__visualizeState ($state_no, $all);

        my @actions = sort { $a <=> $b } keys %{$state->{actions}};
        my @gotos = sort { $a <=> $b } keys %{$state->{goto}};

        my $conflicts = $self->{__conflicts}->{$state_no};
        
        my @terminals = @actions;
        my @non_terminals = @gotos;
        
        if (@terminals) {
            $output .= "\n";
            
            my $max_length = 0;
            foreach (@terminals) {
                my $length = length $names->[$_];
                $max_length = $length if $length > $max_length;
            }
            
            foreach my $symbol (grep { exists $terminals->{$_} } @actions) {
                my $name = $self->__quote ($names->[$symbol]);
                my $pad = ' ' x ($max_length + 2 - length $name);
                $output .= "    $name$pad";
                my $action = $state->{actions}->{$symbol};
                my ($what, $to) = @$action;
                if ('s' eq $what) {
                    $output .= __x"shift, and go to state {to}", to => $to;
                } elsif (0 == $to && 'r' eq $what) {
                    $output .= __"accept";
                } elsif ('r' eq $what) {
                    my $rule_nt = $rules->[$to]->[0];
                    my $nt_name = $names->[$rule_nt];
                    $output .= __x("reduce using rule {to} ({name})", 
                                   to => $to,
                                   name => $nt_name);
                } elsif ('e' eq $what) {
		    $output .= __"error (nonassociative)";
		}

                $output .= "\n";
                
                if (exists $conflicts->{$symbol}) {
                    my $rulenos = $conflicts->{$symbol};
                    foreach my $ruleno (@$rulenos) {
                        my $rule_nt = $rules->[$ruleno]->[0];
                        my $nt_name = $names->[$rule_nt];
                        $output .= "    $name$pad";
                        $output .= '[' . __x("reduce using rule {to} ({name})",
                                             to => $ruleno,
                                             name => $nt_name) . ']';
                        $output .= "\n";
                    }
                }
            }
        }

        if (exists $state->{default}) {
            $output .= "\n    \$default   ";
                    
            my ($what, $to) = @{$state->{default}};
            if ('s' eq $what) {
                $output .= __x"shift, and go to state {to}", to => $to;
            } elsif (0 == $to && 'r' eq $what) {
                $output .= __x"accept";
            } elsif ('r' eq $what) {
                my $rule_nt = $rules->[$to]->[0];
                my $nt_name = $names->[$rule_nt];
                $output .= __x("reduce using rule {to} ({name})\n", 
                               to => $to,
                               name => $nt_name);
            }
        }

        if (@non_terminals) {
            $output .= "\n";
            
            my $max_length = 0;
            foreach (@non_terminals) {
                my $length = length $names->[$_];
                $max_length = $length if $length > $max_length;
            }
            
            foreach my $symbol (@non_terminals) {
                my $name = $names->[$symbol];
                my $pad = ' ' x ($max_length + 2 - length $name);
                $output .= "    $name$pad";
                my $to = $state->{goto}->{$symbol};
                $output .= __x"go to state {to}", to => $to;
                $output .= "\n";
            }
        }
    }
    
    return $output;    
}

sub __unquote {
    my ($self, $value) = @_;
    
    my $search = quotemeta join '', keys %unquote_map;
    
    $value =~ s/\\([$search])/$unquote_map{$1}/geos;
    
    return $value;
}

sub __quote {
    my ($self, $value) = @_;

    my $literals = $self->{__automaton}->{literals};
    my $symbol = $self->{__automaton}->{symbols}->{$value};
    return $value unless exists $literals->{$symbol};
    
    $value = substr $value, 1;
    chop $value;
        
    my $search = join '', keys %quote_map;

    $value =~ s/([$search])/'\\' . $quote_map{$1}/geos;
    
    return "'$value'";
}

sub __computeEmpty {
    my ($self, $automaton) = @_;
    
    my $rules = $automaton->{rules};
    my $terminals = $automaton->{terminals};

    # First calculate the list of possibly empty symbols.
    my @empty;

    # First round: Initialize.  This could be merged into the loop below,
    # but then we have to check for terminals in the main loop.
    my @todo;
    RULE: foreach my $rule (@$rules) {
        if (0 == $#$rule) {
            # Empty right-hand side.
            $empty[$rule->[0]] = 1;
        } else {
            push @todo, $rule;
            foreach (1 .. $#$rule) {
                next RULE if exists $terminals->{$_};
            }
        }
    }

    # Now iterate over the rules.  If we find that all symbols on the right-hand
    # side of a rule are possibly empty, the non-terminal defined by that rule
    # is also possibly empty.  We iterate over the rules until no new symbol
    # is found, cleverly discarding rules, which are already proven to have
    # a possibly empty right-hand side.
    while (@todo) {
        my @rules = @todo;
        @todo = ();
        my $found = 0;
   
        RULE: foreach my $rule (@rules) {
            foreach (1 .. $#$rule) {
                unless ($empty[$_]) {
                    push @todo, $rule;
                    next RULE;
                }
            }
            $empty[$rule->[0]] = 1;
            ++$found;
        }
        
        last unless $found;
    }

    $self->{__empty} = \@empty;
        
    return $self;
}

# Foreach non-terminal calculate the terminals it can possible begin with.
sub __computeFirsts {
    my ($self, $automaton) = @_;
    
    my $rules = $automaton->{rules};
    my $empty = $self->{__empty};
    my $firsts = $self->{__firsts} = {};
    my $non_terminals = $automaton->{non_terminals};
        
    my $added = 1;
    while ($added) {
        $added = 0;
        foreach my $rule (@$rules) {
            foreach (my $dotpos = 1;
                     $dotpos <= $#$rule;
                     ++$dotpos) {
                my $symbol = $rule->[$dotpos];
                
                if (exists $non_terminals->{$symbol}) {
                    foreach (keys %{$firsts->{$symbol}}) {
                        next if exists $firsts->{$rule->[0]}->{$_};
                        $added = 1;
                        $firsts->{$rule->[0]}->{$_} = 1;
                    }
                } else {
                    next if exists $firsts->{$rule->[0]}->{$symbol};
                    $added = 1;
                    $firsts->{$rule->[0]}->{$symbol} = 1;
                }
                last unless $empty->[$symbol];
            }
        }
    }

    return $self;
}

sub __computeTransitions {
    my ($self, $automaton) = @_;
    
    my $states = $automaton->{states};
    my $empty = $self->{__empty};
    
    # Calculate the transitions.
    my $transitions = $self->{__transitions} = {};

    foreach my $stateno (0 .. $#$states) {
        my $gotos = $self->{__goto}->{$stateno};
        
        foreach my $non_terminal (keys %$gotos) {
            my $to_stateno = $gotos->{$non_terminal};
            my $to_state = $states->[$to_stateno];
            my $shifts = $self->{__shift}->{$to_stateno};
            my $to_gotos = $self->{__goto}->{$to_stateno};
            
            my $set = {set => {}};            
            
            foreach my $terminal (keys %$shifts) {
                $set->{set}->{$terminal} = 1;
            }
            
            foreach my $nt (keys %$to_gotos) {
                next unless $empty->[$nt];
                my $to_to_stateno = $to_gotos->{$nt};
                $set->{relation}->{$to_stateno} = $nt;
            }
                   
            $transitions->{$stateno}->{$non_terminal} = $set;
        }
    }

    return $self;
}

sub __traverse {
    my ($self, $stack, $done, $stateno, $nt, $value) = @_;
    
    my $transitions = $self->{__transitions};
    
    push @$stack, [$stateno, $nt];
    $done->{$stateno}->{$nt} = $value;
    
    my $relation = $transitions->{$stateno}->{$nt}->{relation};
    foreach my $to_stateno (keys %$relation) {
        my $to_nt = $relation->{$to_stateno};
        unless ($done->{$to_stateno}->{$to_nt}) {
            $self->__traverse ($stack, $done, $to_stateno, $to_nt, $value + 1);                  
        }
        my $n_x = $done->{$stateno}->{$nt};
        my $n_y = $done->{$to_stateno}->{$to_nt};
        $done->{$stateno}->{$nt} = $n_y if $n_y < $n_x;

        # Merge the two sets.
        my %set1 = %{$transitions->{$stateno}->{$nt}->{set}}
            if exists $transitions->{$stateno}
            && exists $transitions->{$stateno}->{$nt}
            && exists $transitions->{$stateno}->{$nt}->{set};
        my %set2 = %{$transitions->{$to_stateno}->{$to_nt}->{set}}
            if exists $transitions->{$to_stateno}
            && exists $transitions->{$to_stateno}->{$to_nt}
            && exists $transitions->{$to_stateno}->{$to_nt}->{set};
        $transitions->{$stateno}->{$nt}->{set} = {%set1, %set2};
    }
    
    if ($value == $done->{$stateno}->{$nt}) {
        # Nothing has changed.
        while (1) {
            my $top = pop @$stack;
            $done->{$top->[0]}->{$top->[1]} = 0xffff_ffff;

            last if $top->[0] == $stateno && $top->[1] == $nt;

            my %set1 = %{$transitions->{$stateno}->{$nt}->{set}}
                if exists $transitions->{$stateno}
                && exists $transitions->{$stateno}->{$nt}
                && exists $transitions->{$stateno}->{$nt}->{set};
            my %set2 = %{$transitions->{$top->[0]}->{$top->[1]}->{set}}
                if exists $transitions->{$top->[0]}
                && exists $transitions->{$top->[0]}->{$top->[1]}
                && exists $transitions->{$top->[0]}->{$top->[1]}->{set};
            $transitions->{$top->[0]}->{$top->[1]}->{set} = {%set1, %set2};
        }
    }
    
    return $self;
}

sub __digraph {
    my ($self) = @_;
    
    my $transitions = $self->{__transitions};
    my @stack;
    my %done;   # N in the original algorithm.
   
    my $changed = 1;
    while ($changed) {
        $changed = 0;
        foreach my $stateno (keys %$transitions) {
            my $transition = $transitions->{$stateno};
            foreach my $nt (keys %$transition) {
                next if $done{$stateno}->{$nt};
                $self->__traverse (\@stack, \%done, $stateno, $nt, 1);
                $changed = 1;
            }
        }
    }

    return $self;
}

sub __walkBack {
    my ($self, $stateno, @stack) = @_;

    my $reverse_transitions = $self->{__reverse_transitions};
        
    my @from_statenos = ($stateno);
    foreach my $symbol (reverse (@stack)) {
        my @statenos = @from_statenos;
        @from_statenos = ();
                    
        foreach my $stateno (@statenos) {
            my $from = $reverse_transitions->[$stateno]->{$symbol}
                if exists $reverse_transitions->[$stateno]->{$symbol};
            push @from_statenos, @$from if $from;
        }
        next unless @from_statenos;
                    
        my %from_statenos = map { $_ =>  1 } @from_statenos;
        @from_statenos = keys %from_statenos;
                    
   }
   
   return \@from_statenos; 
}

sub __computeIncludes {
    my ($self, $automaton) = @_;
    
    my $rules = $automaton->{rules};
    my $states = $automaton->{states};
    my $includes = $self->{__includes} = {};
    my $empty = $self->{__empty};
    my $transitions = $self->{__transitions};
    my $terminals = $automaton->{terminals};
    my $reverse_transitions = $self->{__reverse_transitions} = [];

    # Compute the reverse transitions, i. e., answer the question:
    # If we are in state number n, which shift or goto possibly
    # brought us here.
    foreach my $stateno (0 .. $#$states) {
        my $shifts = $self->{__shift}->{$stateno};
        my $gotos = $self->{__goto}->{$stateno};
        foreach my $terminal (keys %$shifts) {
            my $to_stateno = $self->{__shift}->{$stateno}->{$terminal};
            push @{$reverse_transitions->[$to_stateno]->{$terminal}},
                $stateno;
        }
        foreach my $nt (keys %$gotos) {
            my $to_stateno = $gotos->{$nt};
            push @{$reverse_transitions->[$to_stateno]->{$nt}}, $stateno;
        }
    }
    
    # Another lookup table follows here. Answer the question: For a 
    # certain non-terminal A which has only nullable symbols right to
    # it in a production, which are the symbols left of it.
    my $left_of_nullable = {};
    foreach my $rule (@$rules) {
        my ($target, @rhs) = @$rule;

        my $num_rhs = $#rhs;
        my @consumed;
        foreach my $dotpos (reverse (0 .. $num_rhs)) {
            my $symbol = $rhs[$dotpos];

            # Either our sentinel or any other terminal.
            last if exists $terminals->{$symbol};
            
            pop @rhs;
            
            push @{$left_of_nullable->{$symbol}}, [$target, @rhs];

            unless ($empty->[$symbol]) {
                last;
            }
        }
    }

    # Write the new relation, this time for includes.
    foreach my $stateno (keys %$transitions) {
        my $transition = $transitions->{$stateno};
        foreach my $nt (keys %$transition) {
            my $relation =
                $transitions->{$stateno}->{$nt}->{relation} = {};

            my $p = $left_of_nullable->{$nt};
            next unless $p;
            
            foreach my $fragment (@$p) {
                my ($target, @rhs) = @$fragment;

                my $from_statenos = $self->__walkBack ($stateno, @rhs);              
                foreach my $from_stateno (@$from_statenos) {
                    next if $from_stateno == $stateno && $target == $nt;
                    $relation->{$from_stateno} = $target;
                }                 
            }
        }
    }
         
    return $self;
}

sub __computeLookAheads {
    my ($self, $automaton) = @_;

    $self->__computeEmpty ($automaton);
    $self->__computeTransitions ($automaton);
    $self->__digraph;
    $self->__computeIncludes ($automaton);
    $self->__digraph;
    
    my $transitions = $self->{__transitions};
    my $rules = $automaton->{rules};
    my $states = $automaton->{states};
    my $look_aheads = $self->{__look_ahead} = {};
    
    foreach my $stateno (0 .. $#$states) {
        my $state = $states->[$stateno];
        my $items = $state->{items};
        
        foreach my $item (@$items) {
            my ($ruleno, $dotpos) = @$item;
            my $rule = $rules->[$ruleno];
            next unless $#$rule == $dotpos;
 
            # This is a reduction.
            my $item_str = $ruleno . ':' . $dotpos;
            my ($target, @rhs) = @$rule;
            my %look_ahead;
            # FIXME: The test for $transitions->{$stateno} should be
            # sufficient?
            %look_ahead = %{$transitions->{$stateno}->{$target}->{set}}
                if exists $transitions->{$stateno}
                && exists ${transitions}->{$stateno}->{$target}
                && exists ${transitions}->{$stateno}->{$target}->{set};

            my $from_statenos = $self->__walkBack ($stateno, @rhs);
            
            foreach my $from_stateno (@$from_statenos) {
               next unless exists $transitions->{$from_stateno};
               my $transition = $transitions->{$from_stateno}->{$target};
               foreach my $terminal (keys %{$transition->{set}}) {
                   $look_ahead{$terminal} = 1;
               }
            }
            
            $look_aheads->{$stateno}->{$item_str} = \%look_ahead;
        }
    }

    return $self;    
}

sub generate {
    my ($self, $iterations) = @_;
    
    my $rules = $self->{__automaton}->{rules};
    my $non_terminals = $self->{__automaton}->{non_terminals};
    my $names = $self->{__automaton}->{names};
    
    my $ntrules;
    
    foreach my $rule (@$rules) {
        push @{$ntrules->{$rule->[0]}}, $rule;
    }
    
    my @result = $rules->[0]->[0];
    my $todo = [0];
        
    foreach (1 .. $iterations) {
        my @new_todo;
        my $offset = 0;
        foreach my $pos (sort { $a <=> $b } @$todo) {
            my $nterm = $result[$pos + $offset];
            my $gens = $ntrules->{$nterm};
            my $ruleno = int rand @$gens;
            my $rule = $gens->[$ruleno];
            my @replacement = @$rule[1 .. $#$rule];
            splice @result, $pos + $offset, 1, @replacement;
            foreach my $count (0 .. $#replacement) {
                my $symbol = $replacement[$count];
                push @new_todo, $pos + $offset + $count
                    if exists $non_terminals->{$symbol};                
            }
            $offset += @replacement - 1;
        }
        $todo = \@new_todo;
    }
    
    foreach my $nterm (keys %$ntrules) {
        my @good_rules;
        RULE: foreach my $rule (@{$ntrules->{$nterm}}) {
            foreach my $pos (1 .. $#$rule) {
                next RULE if exists $non_terminals->{$rule->[$pos]};
            }
            push @good_rules, $rule;
        }
        $ntrules->{$nterm} = \@good_rules if @good_rules;
    }
    
    while (@$todo) {
        my @new_todo;
        my $offset = 0;
        foreach my $pos (sort { $a <=> $b } @$todo) {
            my $nterm = $result[$pos + $offset];
            my $gens = $ntrules->{$nterm};
            my $ruleno = int rand @$gens;
            my $rule = $gens->[$ruleno];
            my @replacement = @$rule[1 .. $#$rule];
            splice @result, $pos + $offset, 1, @replacement;
            foreach my $count (0 .. $#replacement) {
                my $symbol = $replacement[$count];
                push @new_todo, $pos + $offset + $count
                    if exists $non_terminals->{$symbol};                
            }
            $offset += @replacement - 1;
        }
        $todo = \@new_todo;
    }

    foreach my $symbol (@result) {
        $symbol = $self->__quote($names->[$symbol]);
    }
    
    return \@result;
}

1;

=head1 NAME

Imperia::Wisent - Imperia Compiler Compiler

=head1 SYNOPSIS

    use Imperia::Wisent;
    
    my $grammar = Imperia::Wisent->new ($source, %args);
    my $parser = $grammar->parser;
    my $output = $grammar->verboseDescription;

=head1 DESCRIPTION

The B<Imperia::Wisent> class is the backend for the Imperia Compiler Compiler.
Normally, you should not use this class directly, but rather use the command
line script site_wisent.pl(3pl) instead.  It is included in the directory
F<bin> in your site directory.

B<Imperia::Wisent> will compile an LALR(1) grammar definition with optional
definitions of semantic actions into a parser.

=head1 CONSTRUCTORS

=over 4

=item B<new SOURCE[, ARGS]>

First argument to the constructor is a source file containing the grammar
definition.  See site_wisent.pl(3b) for details on the expected format.

In case of failure, the constructor will throw an exception.

The constructor understands the following optional named arguments:

=over 8

=item B<input_file FILENAME>

Name of the input file, as you want it in the generated parser code.  This is
B<not> used for any I/O operations.  The grammar is only read from the scalar
that you passed as the first argument to the constructor.

=item B<package PACKAGE>

Name of the package that should be used in the generated parser code, defaults
to the input file name with the directory part and a possible extender ".y" 
stripped off.

=back

=back

=head1 PUBLIC METHODS

=over 4

=item B<parser>

Returns the source code of the generated parser.  This will be a base class of
Imperia::Wisent::Parser(3pm).

=item B<verboseDescription>

Returns a verbose description of the grammar.  See the documentation of the
option "--verbose" of site_wisent.pl(1pl) for details.

=back

=head1 BUGS

=over 4

=item C++ style comments are not supported.

=item Regular actions should have a semantic value, which is a reference to
the anonymous subroutine.

=item Recursive rules are not detected (nt: nt;).

=item Unused rules are not detected.

=item %verbose has no effect.

=item Backslashes are not properly quoted/unquoted in literals.

=item site_wisent.pl does not exit with 1 if a syntax error occurs.

=item An empty grammar ('%%\n%%\n') produces a nonsense automaton.

=head1 COPYRIGHT

Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
All rights reserved. 

This file is part of the Imperia Enterprise Content Management System.  You
can distribute it under the same terms and conditions as Perl itself.

=head1 SEE ALSO

perl(1), site_wisent.pl(1pl), Imperia::Wisent::Parser(3pm)

=cut
