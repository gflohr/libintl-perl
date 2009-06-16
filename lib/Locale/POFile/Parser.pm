#! /bin/false
# $Id: Parser.pm,v 1.26 2009/06/14 20:29:13 guido Exp $ 
# vim: set autoindent shiftwidth=4 tabstop=8:

# Imperia AG is the sole owner and producer of its software "Imperia". For
# our software license and copyright information please refer to: License.txt
# Copyright (C) 1995-2008 Imperia AG.  All rights reserved.

# FIXME: The original implementation had the goto table merged into the
# actions table.  That means that there is probably code unnecessarily checking
# whether a certain key into the actions table is a terminal or not.

package Imperia::Wisent::Parser;

use strict;

use Locale::TextDomain 'libintl-perl';

sub new {
    my $self = bless {}, shift;
    $self->{__yyautomaton} = $self->_yyautomaton;
    $self->{__yysemantics} = $self->_yysemantics;
    
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
    $self->{__yylexer} = $yylex_arg;
    
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
                ($yytext, $symbol, $name) = 
                    $self->__yynextToken ($yylex, $yylex_arg, $debug);
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
    my ($self, $yylex, $yylex_arg, $debug) = @_;

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


#! /bin/false

###########################################################################
# This file is generated, do not edit!
# Edit 'pofile.y' instead!!
###########################################################################

package Locale::POFile::Parser;

use base qw (Imperia::Wisent::Parser Exporter);

use vars qw (@EXPORT_OK %EXPORT_TAGS);

%EXPORT_TAGS = (yyterminals => [
	'COMMENT',
	'DOMAIN',
	'DQSTRING',
	'MSGCTXT',
	'MSGID',
	'MSGID_PLURAL',
	'MSGSTR',
	'error',
]);

@EXPORT_OK = (
	'COMMENT',
	'DOMAIN',
	'DQSTRING',
	'MSGCTXT',
	'MSGID',
	'MSGID_PLURAL',
	'MSGSTR',
	'error',
);
use constant COMMENT => 2;
use constant DOMAIN => 7;
use constant DQSTRING => 8;
use constant MSGCTXT => 6;
use constant MSGID => 3;
use constant MSGID_PLURAL => 4;
use constant MSGSTR => 5;
use constant error => 1;



use constant _yyautomaton =>  {
          'non_terminals' => {
                               '11' => 1,
                               '10' => 1,
                               '9' => 1,
                               '13' => 1,
                               '12' => 1,
                               '14' => 1
                             },
          'names' => [
                       '$end',
                       'error',
                       'COMMENT',
                       'MSGID',
                       'MSGID_PLURAL',
                       'MSGSTR',
                       'MSGCTXT',
                       'DOMAIN',
                       'DQSTRING',
                       '$accept',
                       'pofile',
                       'chunks',
                       'comments',
                       'domainspec',
                       'message'
                     ],
          'terminals' => {
                           '6' => 1,
                           '3' => 1,
                           '7' => 1,
                           '2' => 1,
                           '8' => 1,
                           '1' => 1,
                           '4' => 1,
                           '0' => 1,
                           '5' => 1
                         },
          'states' => [
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          0,
                                          0
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         6
                                       ],
                          'goto' => {
                                      '11' => 2,
                                      '10' => 1
                                    },
                          'items' => [
                                       [
                                         0,
                                         0
                                       ],
                                       [
                                         1,
                                         0
                                       ],
                                       [
                                         2,
                                         0
                                       ],
                                       [
                                         3,
                                         0
                                       ],
                                       [
                                         4,
                                         0
                                       ],
                                       [
                                         5,
                                         0
                                       ],
                                       [
                                         6,
                                         0
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '0' => [
                                                  's',
                                                  3
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          0,
                                          1
                                        ]
                                      ],
                          'items' => [
                                       [
                                         0,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '1' => [
                                                  's',
                                                  4
                                                ],
                                         '3' => [
                                                  's',
                                                  7
                                                ],
                                         '7' => [
                                                  's',
                                                  6
                                                ],
                                         '2' => [
                                                  's',
                                                  5
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          1,
                                          1
                                        ],
                                        [
                                          2,
                                          1
                                        ],
                                        [
                                          3,
                                          1
                                        ],
                                        [
                                          4,
                                          1
                                        ],
                                        [
                                          5,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         1
                                       ],
                          'goto' => {
                                      '13' => 9,
                                      '12' => 8,
                                      '14' => 10
                                    },
                          'items' => [
                                       [
                                         1,
                                         1
                                       ],
                                       [
                                         2,
                                         1
                                       ],
                                       [
                                         3,
                                         1
                                       ],
                                       [
                                         4,
                                         1
                                       ],
                                       [
                                         5,
                                         1
                                       ],
                                       [
                                         7,
                                         0
                                       ],
                                       [
                                         8,
                                         0
                                       ],
                                       [
                                         9,
                                         0
                                       ],
                                       [
                                         10,
                                         0
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          0,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         0
                                       ],
                          'items' => [
                                       [
                                         0,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          5,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         5
                                       ],
                          'items' => [
                                       [
                                         5,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          7,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         7
                                       ],
                          'items' => [
                                       [
                                         7,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '8' => [
                                                  's',
                                                  11
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          9,
                                          1
                                        ]
                                      ],
                          'items' => [
                                       [
                                         9,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '8' => [
                                                  's',
                                                  12
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          10,
                                          1
                                        ]
                                      ],
                          'items' => [
                                       [
                                         10,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '2' => [
                                                  's',
                                                  13
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          2,
                                          2
                                        ],
                                        [
                                          8,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         2
                                       ],
                          'items' => [
                                       [
                                         2,
                                         2
                                       ],
                                       [
                                         8,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          3,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         3
                                       ],
                          'items' => [
                                       [
                                         3,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          4,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         4
                                       ],
                          'items' => [
                                       [
                                         4,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          9,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         9
                                       ],
                          'items' => [
                                       [
                                         9,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '5' => [
                                                  's',
                                                  14
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          10,
                                          2
                                        ]
                                      ],
                          'items' => [
                                       [
                                         10,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          8,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         8
                                       ],
                          'items' => [
                                       [
                                         8,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '8' => [
                                                  's',
                                                  15
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          10,
                                          3
                                        ]
                                      ],
                          'items' => [
                                       [
                                         10,
                                         3
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          10,
                                          4
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         10
                                       ],
                          'items' => [
                                       [
                                         10,
                                         4
                                       ]
                                     ]
                        }
                      ],
          'symbols' => {
                         'MSGID' => 3,
                         'domainspec' => 13,
                         'COMMENT' => 2,
                         'MSGID_PLURAL' => 4,
                         'DQSTRING' => 8,
                         '$end' => 0,
                         'comments' => 12,
                         'MSGCTXT' => 6,
                         'message' => 14,
                         'chunks' => 11,
                         'MSGSTR' => 5,
                         'error' => 1,
                         '$accept' => 9,
                         'DOMAIN' => 7,
                         'pofile' => 10
                       },
          'literals' => undef,
          'rules' => [
                       [
                         9,
                         10,
                         0
                       ],
                       [
                         10,
                         11
                       ],
                       [
                         11,
                         11,
                         12
                       ],
                       [
                         11,
                         11,
                         13
                       ],
                       [
                         11,
                         11,
                         14
                       ],
                       [
                         11,
                         11,
                         1
                       ],
                       [
                         11
                       ],
                       [
                         12,
                         2
                       ],
                       [
                         12,
                         12,
                         2
                       ],
                       [
                         13,
                         7,
                         8
                       ],
                       [
                         14,
                         3,
                         8,
                         5,
                         8
                       ]
                     ]
        };
;

sub _yysemantics {
    return {
        '1' => {
            '1' => sub 
#line 30 "pofile.y"
{ return 1 },
},
    };
}


1;
#line 49 "pofile.y"


