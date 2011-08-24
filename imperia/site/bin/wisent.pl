#! /usr/local/bin/perl
#
# Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
# All rights reserved. 
#
# This file is part of the Imperia Enterprise Content Management System.  You
# can distribute it under the same terms and conditions as Perl itself.

use strict;

BEGIN {
    unshift @INC, $0 =~ /(.*)[\\\/]/
      ? "$1/../modules/core"
      : '../modules/core';
}

use Getopt::Long;
use Pod::Usage;
use Imperia::Wisent;
use IO::Handle;
use Locale::TextDomain qw (imperia);

sub usage_error;

my $option_help;
my $option_verbose;
my $option_package;
my $option_graphviz;
my $option_as = 'png';
my $option_output;
my $option_shebang;

# We want standard command-line handling.
#Getopt::Long::Configure ('gnu_getopt');

autoflush STDOUT;
autoflush STDERR;

GetOptions(
           'package=s'      => \$option_package,
           'output=s'       => \$option_output,
           'shebang=s'      => \$option_shebang,
                     
           'graphviz=s'     => \$option_graphviz,
           'as=s'           => \$option_as,
           
	   help             => \$option_help,
	   'verbose+'       => \$option_verbose
	   ) or exit 1;

pod2usage(0) if $option_help;

my $input_file = $ARGV[0];
usage_error "No input file given!" unless defined $input_file;

my $input;
my $input_stem;

{    
    local *HANDLE;
    open HANDLE, "<$input_file"
        or die "Cannot open '$input_file' for reading: $!\n";
    $input = join '', <HANDLE>;
    close HANDLE;
    $input_stem = $input_file;
    $input_stem =~ s/\.y$//;
}

my $package = $option_package;
unless (defined $package) {
    $package = $input_stem;
}

unless (defined $option_output) {
    my @parts = split /(?:::|\')/, $package;
    $option_output = $parts[-1] . '.pm';
}

my $grammar = Imperia::Wisent->new  ($input, input_file => $input_file,
                                             package => $package,
                                             );

if ($option_verbose) {
    my $output = $grammar->verboseDescription ($option_verbose > 1);
    
    my $filename = $input_stem . '.output';
    
    local *HANDLE;
    open HANDLE, ">$filename"
        or die "Cannot write '$filename': $!\n";
    
    print HANDLE $output;
    close HANDLE or die "Cannot close '$filename': $!\n";
}

if ($option_graphviz) {
    eval {require GraphViz};
    
    if ($@) {
        die <<EOF;
Cannot create graph output, because the module GraphViz is not installed!
EOF
    }
    
    my $g = $grammar->graphviz;
    
    $option_as =~ s/^as_//;
    
    my $method = "as_$option_as";
    
    #die "Unsupported GraphViz output method '$method'!\n" 
    #   unless $g->can ($method);
    
    $g->$method ($option_graphviz);
}

if (defined $option_shebang) {
    chomp $option_shebang;
    $option_shebang .= "\n";
} else {
    $option_shebang = '';
}

my $parser .= $grammar->parser;

open HANDLE, ">$option_output" 
    or die "Cannot open '$option_output' for writing: $!\n";
print HANDLE $option_shebang . $parser
    or die "Cannot write '$option_output': $!\n";
close HANDLE
    or die "Cannot close '$option_output': $!\n";

my $conflicts_expected = $grammar->expect || 0;
my $shift_reduce = $grammar->numberShiftReduceConflicts;
my $reduce_reduce = $grammar->numberReduceReduceConflicts;

unless ($conflicts_expected == $shift_reduce + $reduce_reduce) {
        if (defined $grammar->expect) {
            warn (__nx("Expected one conflict.\n",
   	               "Expected {num} conflicts.\n",
		       $conflicts_expected,
		       num => $conflicts_expected));
	}
        if ($shift_reduce) {
            warn (__nx("One shift/reduce conflict.\n", 
                       "{num} shift/reduce conflicts.\n",
                        $shift_reduce,
                        num => $shift_reduce));
        }
        if ($reduce_reduce) {
            warn (__nx("One reduce/reduce conflict.\n", 
                       "{num} reduce/reduce conflicts.\n",
                       $reduce_reduce,
                       num => $reduce_reduce));            
        }
}

my $never_reduced = $grammar->rulesNeverReduced;
if (keys %$never_reduced) {
    my $rules_conflicting = $grammar->rulesConflicting;

    foreach my $ruleno (sort { $a <=> $b } keys %$never_reduced) {
        unless ($rules_conflicting->{$ruleno}) {
            warn (__x("Rule number {num} is never reduced.\n", num => $ruleno));
        } else {
            warn (__x("Rule number {num} is never "
                      . "reduced because of conflicts.\n", num => $ruleno));
        }
    }
}

sub usage_error {
    my $message = shift;
    if ($message) {
        $message =~ s/\s+$//;
        $message = "$0: $message\n";
    } else {
        $message = '';
    }
    die <<EOF;
${message}Usage: $0 [OPTIONS]
Try '$0 --help' for more information!
EOF
}

=pod

=head1 NAME

site_wisent - Imperia Compiler Compiler

=head1 SYNOPSIS

Usage: $0 [OPTIONS] [INPUTFILE]

Mandatory arguments for long options are mandatory for short options, too.

  -p, --package=PACKAGE     package name for output module, defaults to 
                            STEM
  -o, --output=OUTPUT_FILE  filename for output file, defaults to the
                            part after the last '::' or "'" of PACKAGE
  -s, --shebang=SHEBANG     Write SHEBANG into the first line of the
                            output file.  A newline is automatically
                            added, if the string does not end in a 
                            newline.
  
  -g, --graphviz=FILENAME   use GraphViz(3pm) to create a visualization 
                            of the parser
      --as=WHAT             use the graphviz method as_WHAT for output, 
                            see GraphViz(3pm) for valid options

  -h, --help                display this help page and exit
  -v, --verbose             write an extra output file STEM.output
                            that contains a description of the details
                            of the parsed grammar; giving the option 
                            twice will cause the output file to contain 
                            the full configuration of each state, and 
                            not only its kernel

Creates a parser B<STEM.pm> from the INPUTFILE.  This parser module will be
a derived class of Imperia::Wisent::Parser(3pm).

Please try the command "perldoc SCRIPT" (replace script with the filename 
of this script) for more detailled information.

In the above information B<STEM> is the stem of the input file with an optional
extender F<.y> stripped off.  B<NAME> is the same as B<STEM> with the directory
part also stripped off.

=head1 DESCRIPTION

Imperia Wisent is the Imperia Compiler Compiler framework.  You can also call
it a parser generator if you prefer that term.

=head1 GRAMMAR SYNTAX

The syntax of the input grammar is very close to that of other popular parser
generators like yacc(1) or bison(1).  In fact, as long as you don't use fancy
Perl constructs in your embedded code, these tools will be able to parse your
grammar files, but they may throw occasional warnings about oddities they find
in your Perl code, which they expect to be in C with the yacc place-holders
"$$" and "$N".

A valid grammar file consists of a header, followed by a rules section, and
an epilogue.  These three sections are separated by a double percent sign:

    I<header>
    %%
    I<rules>
    %%
    I<epilogue>

Everything following the rules section is optional, and the header section can
be empty.  The shortest valid grammar looks like this.

    %%
    one: '1'

Replace "one: '1'" with an arbitrary rule of your taste.

=head2 Header

The header consists of a prologue and declarations:

    %{
    # Prologue  
    %}
    
    DECLARATIONS
    
You can mix prologue and declarations if you want to:

    %{
        # Some Perl code.   
    %}
    
    %token NUMBER
    
    %{
        # More Perl code.
    %}
    
    %left '+' '-'
    %%
    /* Rules ... */

=head3 Prologue

A prologue part starts with the string "%{" and ends with "%}".

site_wisent.pl(1pl) internally uses PPI::Document(3pm) for parsing embedded
Perl code.  Unlike other parser generators available for Perl it is therefore
able to recognize as valid Perl everything that PPI::Document(3pm) is able to
parse successfully.  This piece of prologue code is therefore valid:

    %{
        print <<EOF;
# Embed all the rest in a block:
}
    # Generated grammar follows:
    # And stress a little %}
    my $stress_more = "hi hi %}";
EOF
    %}

Of course, a block would rather start with a '{', but this is just meant for
illustration.

All prologue code is copied verbatim to the generated parser module.  Note that
the code will be copied at the very beginning of the file.  That means that
your code will be executed in the package "main".  If that does not fit,
insert an explicit package declaration yourself:

    %{
        package MyParser;
        
        use strict;
        
        sub __myObscurePrivateMethod {
            my ($self, %args) = @_;
            # ...
        }   
    %}

=head3 Declarations

Declarations generally start with a percent sign ("%").  Currently supported
are:

=over 4

=item B<%token TOKEN[, TOKEN ...]>

Declares B<TOKEN> (or tokens) so that it can be used in a grammar file.
Example:

    %token NUMBER
    %token IF THEN ELSE

=item B<%left TOKEN[, TOKEN ...]>

Declares the tokens and also indicates that they are left-associative.
Contrary to normal token declarations with "%token" you can also declare
literal strings:

    %left GE LE '+' '-'
    %left '>' '<' '>=' '<='

Currently ignored ...

=item B<%right TOKEN[, TOKEN ...]>

Like "%left" but tokens are declared right-associative.

=item B<%nonassoc TOKEN[, TOKEN ...]>

Like "%left" but tokens are declared non-associative.

=item B<%start START>

Declares B<START> to be the start symbol of your grammar.  In absence of this
declaration, the left-hand-side symbol of the first rule will be the start
symbol.

=item B<%expect INTEGER>

Tells the parser generator that your grammar contains B<INTEGER> known
conflicts.  The program will now complain if the number of expected conflicts
differs from the number of real conflicts.

=back

=head2 Rules Section

A rule has the format:

    NT: COMPONENTS ;

Read "NT" for a single non-terminal symbol and "COMPONENTS" for a possibly
empty sequence of symbols (terminals and non-terminals) and single-quoted
strings, for example:

    rational_number: NUMBER '.' NUMBER;

The trailing semi-colon is optional.

You can merge multiple rules into one ruleset with alternatives:

    expr: NUMBER '+' NUMBER
    expr: NUMBER '-' NUMBER
    
is equivalent to

    expr: NUMBER '+' NUMBER
        | NUMBER '-' NUMBER
        ;

=head3 Non-terminals

Non-terminals can appear on both sides (left and right) of a rule.  They must
start with an alphabetic letter (a-z, A-Z) or an underscore, followed by an
arbitrary number of alphabetic letters, underscores and numbers:

    /* Valid: */
    x: ;
    _: ;
    x123: ;
    _x213: ;
    ___: ;
    
    /* Invalid: */
    18a: ;
    '+': ;

By convention, non-terminals are all-lowercase.

=head3 Terminals

Terminals can only appear on the right hand side of a rule.  They can either
be a symbol or a literal string.

=head4 Terminal symbols

Terminal symbols have the same naming restrictions as terminals (i. e.
alphabetic, underscore or number but not starting with a number).  Note that
you must declare all terminal symbols that you want to use in the header
section by a suitable declaration like "%token", "%left", "%right", or
"%nonassoc".

By convention, terminal symbols are usually all-uppercase.

=head4 Literal strings

You can use literal strings on the right-hand side of rules.  They must be
single-quoted:

    addition_operator: '+' | '-'

Unlike other tools for C, literal strings can have arbitrary length:

    comparisons: '>' | '<' | '>=' | '<='
  
Backslashes and single quotes have to be escaped by a backslash:

    specials: backslash | single_quote
    backslash: '\\'
    single_quote: '\''

In real life you would use terminal symbols here ...

=head3 Actions

The semantics of your grammar are defined by actions in form of embedded Perl
code.  Normally you only specify code for a complete reduction of a rule:
    
    expr: NUMBER '+' NUMBER { return $_[1] + $_[2] }

The Perl code embedded in curly braces is copied verbatim to the generated
parser.  It is parsed by PPI::Document(3pm), but no real validity check is
done on it.  The code snippet will be embedded in an anonymous subroutine
that receives the semantic values of all rule components as its argument.

The return value of the subroutine is the semantic value of the reduced
expression.  If you are familiar with yacc(1) or bison(1), then the above
example has this equivalent in yacc(1) with a generator written in C:

    expr: NUMBER '+' NUMBER { $$ = $1 + $3; }

Since the semantic values of your right-hand-side components are arguments to 
the subroutine you define, you can access them via the Perl variable "@_"
(or individually as $_[0], $_[1], ... $_[n]).  They are not necessarily
strings, they can be arbitrary Perl data types, as long as you can store them
in a scalar value (references, blessed or not blessed, are scalars in this
context).

The semantic value of the entire expression is the return value of your
subroutine.  Because it is Perl, in absence of a return statement, the
semantic value of your code is the value of the last evaluated expression,
allowing this popular short cut:

    expr: NUMBER '+' NUMBER { $_[1] + $_[3] }

The first argument to your subroutine is the parser object itself, which is
always a derived class of Imperia::Wisent::Parser(3pm).

In absence of an explicit action, the following code is used:

   expr: SOMETHING { $_[1] }

That means, that the semantic value of a reduction is by default its first
component.  This behavior is inherited from yacc(1), bison(1), and other
popular parser generators.

=head3 In-Rule actions

You can place actions anywhere you like inside a rule.  If you insert actions
inside of a rule, however, your grammar is slightly modified and your in-rule
code is silently replaced by a new non-terminal with only one empty definition.
Take this piece of code as an example:

    expr: NUMBER '+' { printf("Number following $_[1]?"); } NUMBER {$_[1]+$_[4]}

This is really replaced by:

    $$N: /* empty */ { printf ("Number following $_[1]?\n"); }
    expr: NUMBER '+' $$N NUMBER { $_[1] + $_[4] }

Please note, that this automatic modification may have surprising effects for
you, especially you will often introduce conflicts.

You should also note that in-rule actions are counted as rule components.  See
again:

    expr: NUMBER '+' { printf("Number following $_[1]?"); } NUMBER {$_[1]+$_[4]}

The in-rule action is counted as a component, and so the second occurrence
of NUMBER must be referred to as $_[4].  The semantic value of action code
is a reference to the anonymous subroutine.

=head2 Epilogue

The epilogue can contain arbitrary Perl code.  The code is executed in the
namespace you have specified with the option -p or --package.

    %%
    # This is just regular Perl code.
    
    END {
        # Some end block ...
    }

=head2 Comments

Comments in Imperia Wisent grammars are C-style i. e. they start with "/*" and
end with "*/" and you cannot nest comments.

Since Imperia Wisent does not interpret anything into the action code or
prologue or epilogue sections, you must use Perl comments in these sections!

=head1 OUTPUT FILE

=head2 General Information

If you want to debug your grammar, you should invoke this script with the
option -v resp. --verbose.  This will create an output file F<STEM.output>
that includes information about unused symbols, a normalized form of the 
grammar, information about all terminals (symbols and string literals) and 
non-terminals that are defined by the grammar, plus a detailed description of 
the various parser states and transitions between them.

=head2 Debugging Conflicts

If you want to debug conflicts look for transitions that are in brackets, for 
example:

    ...
    ELSE      shift, and go to state 11
    ELSE      [reduce using rule 3 (if_stmt)]
    ...

This excerpt shows an automatically resolved shift/reduce conflict, that is 
present in this state if the symbol "ELSE" is read from the input stream.
You can see that the conflict is resolved by ignoring the reduction and
shifting instad.

Conflicts are summarized in the top section of the verbose output file.

=head2 Symbol Numbers

Traditional parser parsers like yacc(1) or bison(1) have a certain mapping
from symbol names to integers.  In Imperia Wisent parsers, symbols are also
internally represented by numbers, but you should not rely on a certain mapping
at this time of writing.

Symbol numbers are occasionally displayed in parentheses, for example:

    Terminals and the rules where they are used:

    IF (0) 3 4
    THEN (1) 3 4
    ELSE (2) 4
    variable (3) 5
    $end (5)
    error (8)


    Non-terminals and the rules where they are used:

    $accept(4)
        on left: 0
    stmt(7)
        on left: 1 2,
        on right: 0 3 4
    if_stmt(9)
        on left: 3 4,
        on right: 2
    expr(6)
        on left: 5,
        on right: 1 3 4

=head2 Rule Rewriting

When you look closely at the normalized rules, you will notice that
B<site_wisent.pl> does certain manipulations on the rules definition.  It
will always insert a rule of the following form at the beginning:

    0 $accept: I<start> $end

I<start> is the start symbol of your grammar.  This has internal reasons and is
of no importance to your.  Yet, if you use in-rule actions, you will notice
something interesting.  Say, that your original looks like this:

    foobar: { hi(); } foo { ho() } { silver() } bar { print "Foobar!" } 
    foo:    'foo'
    bar:    'bar'

Then Imperia Wisent will modify your grammar as follows:

    Grammar

        0 $accept: foobar $end

        1 $$1: /* empty */

        2 $$2: /* empty */

        3 $$3: /* empty */

        4 foobar: $$1 foo $$2 $$3 bar

        5 foo: 'foo'

        6 bar: 'bar'

As you can see, it has inserted new rules.  This somewhat odd behavior is
inherited from other parser generators like yacc(1) or bison(1).  The reason
for this is that the action code can only be executed after a rule has
been reduced.  This simple trick ensures that a rule has been reduced.

Please note, that inserting in-rule actions can lead to unexpected conflicts
because of the re-written grammar.

=head1 COPYRIGHT

Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
All rights reserved. 

This file is part of the Imperia Enterprise Content Management System.  You
can distribute it under the same terms and conditions as Perl itself.

=head1 SEE ALSO

perl(1), Imperia::Wisent::Parser(3pm), Imperia::Wisent(3pm)

=cut

