#! /bin/false
#
# Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
# All rights reserved. 
#
# This file is part of the Imperia Enterprise Content Management System.  You
# can distribute it under the same terms and conditions as Perl itself.

package Imperia::ILex;

use strict;

use base qw (Imperia::ILex::Bootstrap::Parser);

use Locale::TextDomain qw (imperia);

sub new {
    my ($class, %args) = @_;

    my $self = $class->SUPER::new;

    $self->{__input_file} = $args{input_file} || "unknown";
    $self->{__package} = $args{package};


    unless (defined $self->{__package}
            && length $self->{__package}) {
        $self->{__package} = $self->{__input_file};
        $self->{__package} =~ s/\.[yY]$//;
        $self->{__package} =~ s{.*[/\\]}{};
    }

    return $self;
}

sub lexer {
    my ($self, %args) = @_;

    my $output = '';

    my $edit_instead = __x("Edit '{filename}' instead!",
                           filename => $self->{__input_file});

    my $outro = $self->{__outro};
    $outro = '' unless defined $outro;

    my $errors = '';

    my $xstart_cons = $self->{__xstart_cons};
    my $start_cons = $self->{__start_cons};

    my $start_conditions = {
        INITIAL => [],
    };
    foreach my $start_condition ((keys %$xstart_cons), (keys %$start_cons)) {
        $start_conditions->{$start_condition} = [];
    }

    # Which rules do apply to all start conditions?
    my @any_rules;

    # Which rules have no start condition?
    my @initial_rules;

    my $ruleno = 0;
    my @errors;

    my $filename = $self->{__input_file};
    $filename =~ s/\"/\\"/g;

    foreach my $rule (@{$self->{__rules}}) {
        my $startcons = $rule->{startcons};
        my $pattern = $rule->{pattern};
        my $code = $rule->{code};
        my $parens = $rule->{parens};
        my $backrefs = $rule->{backrefs};
        my $location = $rule->{location};

        foreach my $startcon (@$startcons) {
            if ($startcon eq '*') {
                # FIXME! What is the difference between <*> and no start
                # condition at all?
                push @any_rules, $ruleno;
            } else {
                push @{$start_conditions->{$startcon}}, $ruleno;
            }
        }
        push @initial_rules, $ruleno unless @$startcons;

        my $lineno = $location->[0];
        eval { qr /$pattern/ };
        if ($@) {
            my $error = $@;
            $error =~ s/ at .*?$/ at $self->{__input_file} line $lineno.\n/;

            $errors .= $error;
            chomp $errors;
        } elsif ('' =~ /$pattern/) {
            $errors .= __x("Pattern matches the empty string at "
                           . "'{filename}' line {lineno}.\n",
                           filename => $self->{__input_file},
                           lineno => $lineno);
        }

        ++$ruleno;
    }

    my $yycode = <<EOF;
    [
EOF

    my @yyparens;
    foreach my $rule (@{$self->{__rules}}) {
        my $code = $rule->{code};
        my $lineno = $rule->{location}->[0] - 1;
        my $parens = $rule->{parens} || 0;
        push @yyparens, $parens;
        
        unless (defined $code && length $code && $code !~ /^[ \t\r\n]*$/) {
            $yycode .= "undef,\n",
        } else {
            $yycode .= <<EOF;
#line $lineno "$filename"
sub {
    $code
},
EOF
        }
        
    }
    
    # One more code snippet for the default rule.
    $yycode .= <<'EOF';
sub {
    print $^N;
    return;
},
    ];
EOF

    # And one more for the parentheses count.
    push @yyparens, 0;
    my $yyparens = '[' . (join ', ', @yyparens) . '];';
    
    my $yymatch = <<EOF;
{
EOF

    my $yystates = '';

    foreach my $start_condition (sort keys %$start_conditions) {
        my $states = $start_conditions->{$start_condition};
        my @states = @$states;
        push @states, @initial_rules
            unless exists $xstart_cons->{$start_condition};
        push @states, @any_rules;
        @states = sort { $a <=> $b } @states;

        $yystates .= "        $start_condition => [" 
                     . join (', ', @states) . "],\n";
                     
        my @regex;
        my @parens;
        
        my $count = 0;
        my $paren_count = 1;
        foreach my $ruleno (@states) {
            my $rule = $self->{__rules}->[$ruleno];
            my $regex = $rule->{pattern};
            my $backrefs = $rule->{backrefs};
            my $parens = $rule->{parens};
            my $backrefs = $rule->{backrefs};

            if ($backrefs) {
                foreach my $backref (sort { $b->[0] cmp $a->[0] } @$backrefs) {
                    my ($pos, $length, $n) = @$backref;
                    substr $regex, $pos, $length, '\\' . ($paren_count + $n);
                }
            }            
      
            $regex =~ s,/,\\/,g;
            
            $regex .= "(?{\$yyrule = $ruleno})";
            push @regex, $regex;
            ++$count;
            push @parens, $paren_count;
            $parens = 0 unless $parens;
            $paren_count += $parens;
        }
        
        my $default_match = '((?s:.))';
        my $last_ruleno = $ruleno;
        $default_match .= "(?{\$yyrule = $last_ruleno})";
        push @regex, $default_match;
        push @parens, $paren_count;

        my $re = join '|', @regex;
        
        $yymatch .= <<EOF;
        $start_condition => qr /($re)/o,
EOF
    }

    $yymatch .= <<EOF;
    };
EOF

    my $intro = '';
    foreach my $code (@{$self->{__intro_code}}) {
        $intro .= $code;
    }

    $output .= <<EOF;
package $self->{__package};

##########################################################################
# This file is generated.  Do not edit!
# $edit_instead
##########################################################################

$intro

package $self->{__package};

our \$yyrule;

use base qw (Imperia::ILex::Lexer);

sub _yymatch {
    my (\$self) = \@_;
    use re qw (eval);
    return $yymatch
}

sub _yyparens {
    return $yyparens
}

sub _yycode {
    return $yycode
}

sub _yystates {
    return {
$yystates
    };
}

$outro
1;
EOF

    die $errors if $errors;

    return $output;
}

1;

=head1 NAME

Imperia::ILex - Imperia Lexer class

=head1 SYNOPSIS

    use Imperia::ILex;

    my $lexer = MyLexer->new;

=head1 DESCRIPTION

=head1 CONSTRUCTORS

=over 4 B<new>

The constructor takes no argument.

=head1 PUBLIC METHODS

=over 4

=back

=head1 DIAGNOSTICS

=over 4

=item B<Pattern matches the empty string at ...>

It is illegal to use a pattern in a rule that could match the empty string.
This could lead to an endless loop in the scanner.

If you really want to match an empty string you should match any character,
and then push it back into the input buffer with yyless().

=back

=head1 BUGS

=over 4

=item Placing a C comment at the beginning of a line in the rules section,
      messes up the scanner.

=back

=head1 COPYRIGHT

Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
All rights reserved. 

This file is part of the Imperia Enterprise Content Management System.  You
can distribute it under the same terms and conditions as Perl itself.

=head1 SEE ALSO

perl(1), site_ilex.pl(1pl)

=cut
