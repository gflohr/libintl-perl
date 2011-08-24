#! /bin/false
#
# Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
# All rights reserved. 
#
# This file is part of the Imperia Enterprise Content Management System.  You
# can distribute it under the same terms and conditions as Perl itself.
#
# As a special exception, when this file is copied by Imperia ILex into
# an ILex output file, you may use that output file without restriction.

package Imperia::Wisent::Parser;

use strict;

use Locale::TextDomain qw (imperia);

sub new {
    my $self = bless {}, shift;
    $self->{__yyautomaton} = $self->_yyautomaton;
    $self->{__yysemantics} = $self->_yysemantics;
    $self->{__yylexer_stack} = [];
    
    return $self;
}

sub yyparse {
    my ($self, @args) = @_;
    
    my $yylex;
    my $yylex_arg;
    my $yyerror;
    my $yyerror_arg;
    my $yylloc;
    my $yylloc_arg;
    
    $self->{__yynum_errors} = 0;
    
    my %args;
    if (ref $args[0]) {
        my $lexer = shift @args;
        %args = @args;
        $yylex_arg = $lexer;
        $yylex = $lexer->can ('yylex');
        unless ($yylex) {
            require Carp;
            Carp::croak (__"Object passed to yyparse() does not implement a "
                           . "method yylex()" );
        }
        
        $yyerror_arg = $lexer;
        $yyerror = $lexer->can ('yyerror');
        unless ($yyerror) {
            $yyerror_arg = $self;
            $yyerror = $self->can ('yyerror');
        }
        
        $yylloc_arg = $lexer;
        $yylloc = $lexer->can ('yylloc');
        unless ($yylloc) {
            $yylloc_arg = $self;
            $yylloc = $self->can ('yylloc');
        }
    } else {
        $yylex_arg = $yyerror_arg = $self;
        %args = @args;
        $yylex = $args{yylex};
        unless ($yylex) {
            require Carp;
            Carp::croak (__"Mandatory named argument 'yylex' missing in call "
                           . "to yyparse()");
        }

        $yyerror_arg = $self;
        $yyerror = $args{yyerror};
        unless ($yyerror) {
            $yyerror = $self->can ('yyerror');
        }
        
        $yylloc_arg = $self;
        $yylloc = $args{yyerror};
        unless ($yylloc) {
            $yylloc = $self->can ('yylloc');
        }
        
    }

    $self->{__yylexer_arg} = $yylex_arg;
    $self->{__yylexer} = $yylex;
    
    $self->{__yyerror} = $yyerror;
    $self->{__yyerror_arg} = $yyerror_arg;
         
    $self->{__yylloc} = $yylloc;
    $self->{__yylloc_arg} = $yylloc_arg;
         
    my $automaton = $self->{__yyautomaton};
    my $semantics = $self->{__yysemantics};
    
    my $terminals = $automaton->{terminals};
    my $non_terminals = $automaton->{non_terminals};
    my $rules = $automaton->{rules};
    my $states = $automaton->{states};
    my $symbols = $automaton->{symbols};
    my $names = $automaton->{names};

    # Default action is to return the first value of the right side.    
    my $default_action = sub { $_[1] };
    
    my $debug = $args{yydebug};
    $self->{__yydebug} = $debug;
    
    if (exists $args{debug}) {
        require Carp;
        Carp::carp ("The option 'debug' is obsolete, please use 'yydebug'!");
    }
    
    # Three stacks, one for the states, one for the semantic values, one for
    # the locations.
    my @stack;
    my @values;
    $self->{__yynextloc} = [$yylloc->($yylloc_arg)];
    my @locations = $self->{__yynextloc};
    
    $self->yydebug (__"Starting parser.\n") if $debug;
    
    # Where to go next:
    my $stateno = 0;
    
    $self->{__yystack} = \@stack;
    $self->{__yyvalues} = \@values;
    $self->{__yystateno} = \$stateno;
    
    my ($has_token, $yytext, $symbol, $name);
    
    delete $self->{__yyerror_shift};
    
    while (1) {
        if ($self->{__yyabort}) {
            return;
        }

        $self->yydebug (__x("Entering state {stateno}.\n",
                            stateno => $stateno)) if $debug;
        push @stack, $stateno;
        my $state = $states->[$stateno];

        # We must read a new token in the following cases:
        #
        # 1) No default action and no token available.
        # 2) There is a default action but there are alternatives.
        
        unless ($has_token) {
            my $has_default = exists $state->{default};
            my $has_alt = $has_default && keys %{$state->{actions}};
            
            if (!$has_default 
                || 0 != keys %{$state->{actions}}) {
                ($yytext, $symbol, $name) = $self->__yynextToken($debug);
                $has_token = 1;
                $self->{__yynextloc} = [$yylloc->($yylloc_arg)];
            }            
        }

        if ($debug && defined $name) {
            $self->yydebug (__x("Next token is {name}.\n",
                                name => $self->__yyquote ($name)));
        }
        
        my $action;
        if (defined $symbol) {
            $action = $state->{actions}->{$symbol} 
                if defined $symbol && exists $state->{actions}->{$symbol};
        }
        
        $action = $state->{default}
            if (!defined $action && exists $state->{default});

        if (!defined $action || 'e' eq $action->[0]) {
            # Are we already recovering from an error?
            unless ($self->{__yyerror_shift}) {
                ++$self->{__num_errors};
                my $msg = '';
                my $verbose = 1;
                if ($verbose) {
                    # FIXME! Make this variable string translatable!
                    my ($fl, $fc, $ll, $lc, $filename) = $yylloc->($yylloc_arg);
                    $msg .= "$filename:" if defined $filename;
                    $msg .= $fl if defined $fl;
                    $msg .= ".$fc" if defined $fc;
                    $msg .= "-$ll" if defined $ll;
                    $msg .= ".$lc" if defined $lc;
                    my @expected = map { $self->__yyquote ($names->[$_]) } 
                        keys %{$state->{actions}};
                    $expected[-1] = ' or ' . $expected[-1]
                        if @expected > 1;
                    my $expected = join ', ', @expected;
                    my $got = $names->[$symbol];
                    if (('error' eq $got) && defined $yytext) {
                        my $input = $self->__yyquote ($yytext);
                        if (length $input > 40) {
                            $input = substr $input, 0, 37;
                            $input .= '...';
                        }
                        $got = "unexpected input '$input'"
                    } elsif (defined $action && ('e' eq $action->[0])) {
		    	# FIXME! This message will be hard to understand ...
		    	$got = "an error because the operator $yytext is "
			       . " non-associative";
		    }
                    $msg .= ': ' if length $msg;
                    $msg .= "Syntax error, expected $expected but got $got.\n";
                } else {
                    $msg .= __"Syntax error!\n";
                }
                $yyerror->($yyerror_arg, $msg);
            }
            
            if (defined $self->{__yyerror_shift}
                && 3 <= $self->{__yyerror_shift}) {
                if ($symbol == $symbols->{'$end'}) {
                    return; # End of file.
                }
                $self->yydebug (__x("Discarding token {name} ({text}).\n",
                                    name => $self->__yyquote ($name),
                                    text => $self->__yyquote ($yytext)))
                    if $debug;
                undef $has_token;
            }
            
            $action = $self->__yyhandleError (\@stack);
            return unless $action;
            $stateno = $action->[1];
            $#values = $#stack;
            $#locations = $#stack;
            next;
        }
        
        my ($what, $to) = @$action;
        if ('r' eq $what) {
            my $ruleno = $action->[1];
            my $rule = $rules->[$ruleno];
            
            my ($non_terminal, @rhs) = @$rule;
            my $num_pop = @rhs;
            splice @stack, -$num_pop, $num_pop if $num_pop;

            my @local_values = splice @values, -$num_pop, $num_pop
                if $num_pop;
            my $accept = 0 == $ruleno;

            $stateno = $states->[$stack[-1]]->{goto}->{$non_terminal};
            
            if ($debug) {
                if ($accept) {
                    $self->yydebug (__"Input string accepted.\n") if $debug;
                } else {
                    $self->yydebug (__x("Reducing using rule {ruleno}:\n",
                                        ruleno => $ruleno));
                
                }                
            }

            my @local_locations = splice @locations, -$num_pop, $num_pop
                if $num_pop;
            $self->{__yylocations} = \@local_locations;
            
            my $code = $semantics->{$ruleno}->{$num_pop};
            $code = $default_action unless defined $code;
            my $result = $self->$code (@local_values);
            push @values, $result;
            
            if ($num_pop) {
                # Merge the beginning and the end into one location.
                my $first = $local_locations[0];
                my $last = $local_locations[-1];
                $first->[2] = $last->[2];
                $first->[3] = $last->[3];
                push @locations, $first;
            } else {
                my $new = $locations[-1];
                push @locations, [@$new];
            }
            
            if ($debug) {
                $self->__yydebugRule ($ruleno, $automaton, 
                                    $result, @local_values);
                $self->yydebug (__x("Stack now {stack}.\n",
                                    stack => join ' ', @stack));
            }
            
            return $result if $accept;
        } elsif  ('s' eq $what) {
            # Shift.
            --$self->{__yyerror_shift} if $self->{__yyerror_shift};
            
            $stateno = $to;
            undef $has_token;
            push @values, $yytext;

            push @locations, $self->{__yynextloc};
            
            if ($debug) {
                $self->yydebug (__x("Shifting token {name} ({text}).\n",
                                    name => $name, 
                                    text => $yytext));
            }
        } else {
            die __x("Parser automaton corrupted!  This should not happen! "
	            . "State number is {stateno}, unknown action is "
		    . "{action}, and the target state number is {to}.",
		    stateno => $stateno, action => $what, to => $to);
        }
    }
    
    # NOT REACHED.
}

sub yylocation {
    my ($self) = @_;
    
    my $yylloc = $self->{__yylloc};
    my $yylloc_arg = $self->{__yylloc_arg};
     
    my $msg = '';

    my ($fl, $fc, $ll, $lc, $filename) = $yylloc->($yylloc_arg);
    $msg .= "$filename:" if defined $filename;
    $msg .= $fl if defined $fl;
    $msg .= ".$fc" if defined $fc;
    $msg .= "-$ll" if defined $ll;
    $msg .= ".$lc" if defined $lc;
    
    return $msg;
}

sub yylocations {
    my $self = shift;
    
    my @retval;
    foreach my $location (@{$self->{__yylocations}}) {
        push @retval, [@$location];
    }
    
    return @retval;
}

sub yypushlexer {
    my ($self, $arg) = @_;
    
    my $yylex_arg;
    my $yylex;
    my $yyerror_arg;
    my $yyerror;
    my $yylloc_arg;
    my $yylloc;
    
    if (ref $arg && 'CODE' ne ref $arg) {
        my $lexer = $arg;
        $yylex_arg = $lexer;
        $yylex = $lexer->can ('yylex');
        unless ($yylex) {
            require Carp;
            Carp::croak (__"Object passed to yypushlexer() does not implement a "
                           . "method yylex()" );
        }

        $yyerror_arg = $lexer;
        $yyerror = $lexer->can ('yyerror');
        unless ($yyerror) {
            $yyerror_arg = $self;
            $yyerror = $self->can ('yyerror');
        }
        
        $yylloc_arg = $lexer;
        $yylloc = $lexer->can ('yylloc');
        unless ($yylloc) {
            $yylloc_arg = $self;
            $yylloc = $self->can ('yylloc');
        }
    } else {
        $yylex_arg = $self;
        $yylex = $arg;
        unless ($yylex) {
            require Carp;
            Carp::croak (__"Mandatory argument missing in call "
                           . "to yypushlexer()");
        }
        $yyerror_arg = $self->{__yyerror_arg};
        $yyerror = $self->{__yyerror};
        $yylloc_arg = $self->{__yylloc_arg};
        $yylloc = $self->{__yylloc};
    }

    push @{$self->{__yylexer_stack}}, 
        [
            $self->{__yylexer}, $self->{__yylexer_arg},
            $self->{__yylloc}, $self->{__yylloc_arg},
            $self->{__yyerror}, $self->{__yyerror_arg},
        ];

    $self->{__yylexer_arg} = $yylex_arg;
    $self->{__yylexer} = $yylex;
    $self->{__yylloc_arg} = $yylloc_arg;
    $self->{__yylloc} = $yylloc;
    $self->{__yyerror_arg} = $yyerror_arg;
    $self->{__yyerror} = $yyerror;
    
    return $self;    
}

sub yypoplexer {
    my ($self) = @_;
    
    my $record = pop @{$self->{__yylexer_stack}};
    return unless $record;
    
    my ($yylex, $yylex_arg,
        $yylloc, $yylloc_arg,
        $yyerror, $yyerror_arg) = @$record;
    
    $self->{__yylexer_arg} = $yylex_arg;
    $self->{__yylexer} = $yylex;
    $self->{__yylloc_arg} = $yylloc_arg;
    $self->{__yylloc} = $yylloc;
    $self->{__yyerror_arg} = $yyerror_arg;
    $self->{__yyerror} = $yyerror;
    
    return $self;
}

sub YYERROR {
    my ($self) = @_;

    my $automaton = $self->{__yyautomaton};
    
    my $states = $automaton->{states};

    my $stack = $self->{__yystack};
    my $values = $self->{__yyvalues};
    my $locations = $self->{__yylocations};
    my $stateno = $stack->[-1];
    my $state = $states->[$stateno];    

    my $item = $state->{items}->[-1];
        
    unless (@$stack) {
        $self->{__yyabort} = 1;
        return;
    }
    
    my $action = $self->__yyhandleError;
    unless ($action) {
        $self->{__yyabort} = 1;
        return;
    }

    ${$self->{__yystateno}} = $action->[1];
    $#$values = $#$stack;
    $#$locations = $#$stack;
    
    return $self;
}

sub __yyhandleError {
    my ($self) = @_;
    
    my $automaton = $self->{__yyautomaton};
    
    my $states = $automaton->{states};
    my $symbols = $automaton->{symbols};
    my $names = $automaton->{names};
    my $error = $symbols->{error};
    my $rules = $automaton->{rules};
    my $terminals = $automaton->{terminals};
    my $stack = $self->{__yystack};
    
    $self->{__yyerror_shift} = 3;

    # Pop tokens off the stack, until we can shift the error token.    
    while (1) {
        my $stateno = $stack->[-1];
        my $state = $states->[$stateno];

        if (exists $state->{actions}->{$error}) {
            if ($self->{__yydebug}) {
                $self->yydebug (__x("Shifting token {name} ({text}).\n",
                                    name => 'error',
                                    text => ''));
            }
            return $state->{actions}->{$error};
        }
        
        pop @$stack;        

        # What have we popped?
        if ($self->{__yydebug}) {
            my $item = $state->{items}->[0];
            my ($ruleno, $dotpos) = @$item;
            my $rule = $rules->[$ruleno];
            my $popped = $rule->[$dotpos];
            my $name = $self->__yyquote($names->[$popped]);
            if (exists $terminals->{$popped}) {
                $self->yydebug (__x("Error: popping token {symbol}.\n",
                                    symbol => $name));
            } else {
                $self->yydebug (__x("Error: popping nterm {symbol}.\n",
                                    symbol => $name));
            }
            $self->yydebug (__x("Stack now {stack}.\n",
                                stack => join ' ', @$stack));
        }
        
        # Stack exhausted.
        last unless @$stack;
    }
    
    return;
}

sub yyerror {
    my ($self, $message) = @_;
    
    warn $message;
    
    return;
}

sub yydebug {
    my ($self, $message) = @_;
    
    print STDERR $message;
    
    return $self;
}

sub yylloc {
    my $self = shift;
    
    return unless $self->{__yynextloc};
    
    return @{$self->{__yynextloc}};
}

sub yylexer {
    shift->{__yylexer_arg};
}

sub __yydebugRule {
    my ($self, $ruleno, $automaton, $result, @values) = @_;
    
    my $rules = $automaton->{rules};
    my $rule = $rules->[$ruleno];
    my $names = $automaton->{names};
    my $terminals = $automaton->{terminals};

    my ($non_terminal, @tail) = @$rule;
    my (@tail_values) = @values;
    
    my $count = 1;
    foreach my $symbol (@tail) {
        my $value = shift @tail_values;
        $value = '' unless defined $value;
        
        # TRANSLATORS: nterm means non-terminal.  The translation should have
        # TRANSLATORS: the same length as "token".
        my $type = exists $terminals->{$symbol} ? __"token" : __"nterm";
        
        $self->yydebug ('   ' . __x("{left} = {type} {symbol} ({value})\n",
                                    left => "\$_[$count]",
                                    symbol => $self->__yyquote($names->[$symbol]),
                                    type => $type,
                                    value => $self->__yyquote("'$value'")));
        ++$count;
    }

    # TRANSLATORS: nterm means non-terminal.  The translation should have
    # TRANSLATORS: the same length as "token".
    my $type = __"nterm";
    my $value = $values[0];
    
    $value = '' unless defined $value;
    
    $value =~ s/\\/\\\\/g;
    $value =~ s/\n/\\n/g;
    $value =~ s/\t/\\t/g;
    $value =~ s/\r/\\r/g;

    $self->yydebug ('   ' . __x("{left} = {type} {symbol} ({value})\n",
                                left => '     ',
                                type => $type,
                                symbol => $names->[$non_terminal],
                                value => $value));

    return $self;
}

sub __yynextToken {
    my ($self, $debug) = @_;

    my $yylex = $self->{__yylexer};
    my $yylex_arg = $self->{__yylexer_arg};

    my $automaton = $self->{__yyautomaton};
    
    my $symbols = $automaton->{symbols};
    my $names = $automaton->{names};
    
    $self->yydebug (__"Reading next token: ") if $debug;

    my ($yytext, $symbol, $is_undef) = $yylex->($yylex_arg);

    unless (defined $symbol) {
        if (!defined $yytext && defined $symbol && $is_undef) {
            # Symbol with undefined semantic value.  Do nothing.
        } elsif (defined $yytext && length $yytext) {
            unless (exists $symbols->{"'$yytext'"}) {
                $symbol = $symbols->{error};
            } else {
                $symbol = $symbols->{"'$yytext'"};
            }
        } else {
            $symbol = $symbols->{'$end'};
            $yytext = '';
        }
    } else {
        unless (defined $yytext) {
            $symbol = $symbols->{'$end'};
            $yytext = '';
        }
    }

    if ($symbol == $symbols->{'$end'}) {
        if ($self->yypoplexer) {
            $self->yydebug(__"Popping from lexer stack.\n") if $debug;
            return $self->__yynextToken($debug);
        }
    }
            
    if ($symbol =~ /^[0-9]+$/) {
        if ($symbol > $#$names) {
            die __x("Symbol number ({number}) returned by lexer "
                    . "out of range!\n", number => $symbol);
        }
    }

    my $name = $self->__yyquote($names->[$symbol]);        
    if ($debug) {
        if ($name eq '$end') {
            $self->yydebug (__"End of input reached.\n");
        } else {
            $self->yydebug ($self->__yyquote ("'$yytext'") . "\n");
        }
    }

    return ($yytext, $symbol, $name); 
}

my %unquote_map = (
    0 => "\0",
    a => "\a",
    b => "\b",
    t => "\t",
    n => "\n",
    # FIXME! Perl does not know about \v.  Should we accept it?
    # v => "\v",
    f => "\f",
    r => "\r",
    '\\' => '\\',
);
my %quote_map = reverse %unquote_map;

sub __yyunquote {
    my ($self, $value) = @_;
    
    my $search = quotemeta join '', keys %unquote_map;
    
    $value =~ s/\\([$search])/$unquote_map{$1}/geos;
    
    return $value;
}

sub __yyquote {
    my ($self, $value) = @_;

    my $literals = $self->{_yyautomaton}->{literals};
    return $value unless exists $literals->{$value};
    
    $value = substr $value, 1;
    chop $value;
        
    my $search = join '', keys %quote_map;

    $value =~ s/([$search])/'\\' . $quote_map{$1}/geos;
    
    return "'$value'";
}

1;

__END__
# Do not remove the above marker, it is needed 

=head1 NAME

Imperia::Wisent::Parser - Abstract base class for Imperia Wisent parsers

=head1 SYNOPSIS

    # Always use the derived class, since the base class 
    # Imperia::Wisent::Parser is abstract.
    use MyParser;

    # Create a lexer object, that conforms to the interface of 
    # Imperia::Wisent::Lexer.
    my $lexer = MyLexer->new;
        
    my $parser = Imperia::View::Parser->new($lexer);
    $parser->yyparse ($pass);
    $parser->yyparse (yylex => \&lexer, yyerror => \&error_reporter);
    
=head1 DESCRIPTION

The B<Imperia::Wisent::Parser> class is an abstract base class for Imperia
Wisent parser.  Derived classes are normally generated using 
site_wisent.pl(1pl).

=head1 CONSTRUCTORS

=over 4 B<new LEXER>

The constructor takes a single argument, the lexer to use.  The lexer must
be a class that implements the API of Imperia::Wisent::Lexer(3pm).

=back

=head1 PUBLIC METHODS

=over 4

=item B<yyparse PASS, ARGS>
=item B<yyparse ARGS>

Parses a token stream provided by a lexical analyzer.  You have to options to
tell B<Imperia::Wisent::Parser> how to locate the lexer function and the error
reporting routine.  If the first argument is a reference, then it is assumed
that it refers to an object that implements the methods 'yyparse' and
optionally 'yyerror'.

Otherwise, you should use named arguments:

=over 8

=item B<yylex LEXERFUNCTION>

Expects a code reference to your lexer function.  This argument is ignored
if you pass an object as the first reference.

=item B<yyerror ERROR_REPORTING_FUNCTION>

Expects a code reference to your error reporting function.  This argument is 
ignored if you pass an object as the first reference.

=item B<yylloc LOCATION REPORTING FUNCTION>

Expects a code reference to your location reporting function.  This argument is 
ignored if you pass an object as the first reference.

=item B<yydebug DEBUG_FLAG>

Turns on debugging in the parser, by calling the method yydebug() of the
parser.

=back

=item B<yydebug MESSAGE>

This method gets called, when tracing (debugging) the parser is enabled by
passing the debug flag to the yyparse() function.  The MESSAGE argument is
printed on STDERR.  Note that you can override this method in your own parser.

=back

=head1 CALLING API

=head2 The lexer function yylex

If you use the object-oriented approach for passing the lexer function, the
method yyparse() will be called without any arguments.  If you need a reference
to the parser object, you can easily store that in your object.

If you pass the subroutine as a named argument, the first argument will be the
parser object.  If you need to store your own data, you can do that by writing
it directly into the parser object.  All properties that are used internally
by B<Imperia::Wisent::Parser> will start with either '_yy' or '__yy'.  The
rest of the namespace is yours!

The lexer function should return the value (yytext) of the next token.
If a terminal symbol is recognized, the numerical code of that symbol should 
also be returned.  If you want to return a symbol that has an undefined value
(undefined yytext), return an extra flag indicating that case.  The symbol part 
of the returned list must be defined for that.  Example:

    # The generated parser - if site_wisent was invoked with 
    # option -d res. --defines - contains constants for all terminal symbols,
    # except '$end' which is always 0.  You have to import the tag
    # ':yyterminals' for that.
    use Wisent::Generated::Parser qw (:yyterminals);

    # My lexer function:
    sub yylex {
        # Return a literal string 'abc':
        if ($literal) {
            return 'abc';
        }
        
        # Return a symbolic value NUM, with a textual value of 42:
        if ($num) {
            return 'abc', NUM;
        }
        
        # Return a symbolic value TOKEN, with an undefined textual value:
        if ($undef) {
            return undef, TOKEN, 1
        }
        
        # Return end of file:
        return;
        
        # Or also end of file:
        return undef;
        
        # Or also end of file:
        return '';
        
        # Not end of file, but the literal string '0':
        return 0;
    }
    
=head2 The error reporting function yyerror

If you use the object-oriented approach for passing the error reporting 
function, the method yyerror() will be called without only one argument, the
error message.  If you need a reference to the parser object, you can easily 
store that in your object.

If you pass the subroutine as a named argument, the first argument will be the
parser object, followed by the error message.  If you need to store your own 
data, you can do that by writing it directly into the parser object.  All 
properties that are used internally by B<Imperia::Wisent::Parser> will start 
with either '_yy' or '__yy'.  The rest of the namespace is yours!

=head2 The location reporting functiono yylloc

This function should return a 2-element or 4-element array that describes the
location of the last returned token.  The structure should be like follows:

     FIRST_LINE, FIRST_COLUMN, LAST_LINE, LAST_COLUMN

Since these values are never checked for consistence by the parser, it is
customary to omit the last two values, and just report a position, instead of
a position and a range.

=head1 BUGS

The internal properties do not yet all begin with '_yy' or '__yy'. 

=head1 COPYRIGHT

Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
All rights reserved. 

This file is part of the Imperia Enterprise Content Management System.  You
can distribute it under the same terms and conditions as Perl itself.

=head1 SEE ALSO

perl(1), site_wisent.pl(1pl), Imperia::Wisent(3pm)

=cut
