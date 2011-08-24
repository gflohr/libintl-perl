#! /bin/false
package Imperia::Wisent::Bootstrap::Lexer;

##########################################################################
# Die Datei wurde automatisch erzeugt. Bitte nicht bearbeiten!
# Bearbeiten Sie stattdessen die Datei „wisent.l“!
##########################################################################


#! /bin/false

# Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
# All rights reserved. 
#
# This file is part of the Imperia Enterprise Content Management System.  You
# can distribute it under the same terms and conditions as Perl itself.

package Imperia::Wisent::Bootstrap::Lexer;

use strict;

use Imperia::Wisent::Bootstrap::ParserBase qw (:yyterminals);

use Imperia::Wisent::PerlReader;

    

package Imperia::Wisent::Bootstrap::Lexer;

our $yyrule;

use base qw (Imperia::ILex::Lexer);

sub _yymatch {
    my ($self) = @_;
    use re qw (eval);
    return {
        COMMENT => qr /(\/\*(?{$yyrule = 0})|[^\*]+(?{$yyrule = 2})|\*\/(?{$yyrule = 3})|[^*]+(?{$yyrule = 4})|\*(?{$yyrule = 5})|[%]%(?{$yyrule = 7})|([_a-zA-Z][-_a-zA-Z0-9]*)[ \s\r\t]*:(?{$yyrule = 10})|[_a-zA-Z][-_a-zA-Z0-9]*(?{$yyrule = 11})|'[^\\']*((\\'|\\)[^\\']*)*'(?{$yyrule = 12})|%(?:token|left|right|nonassoc)(?{$yyrule = 13})|%[_a-zA-Z][-_a-zA-Z0-9]*(?{$yyrule = 14})|[1-9][0-9]*(?{$yyrule = 15})|[ \t\r\n]+(?{$yyrule = 16})|.(?{$yyrule = 17})|((?s:.))(?{$yyrule = 18}))/o,
        INITIAL => qr /(\/\*(?{$yyrule = 0})|%\{(?{$yyrule = 1})|[%]%(?{$yyrule = 7})|([_a-zA-Z][-_a-zA-Z0-9]*)[ \s\r\t]*:(?{$yyrule = 10})|[_a-zA-Z][-_a-zA-Z0-9]*(?{$yyrule = 11})|'[^\\']*((\\'|\\)[^\\']*)*'(?{$yyrule = 12})|%(?:token|left|right|nonassoc)(?{$yyrule = 13})|%[_a-zA-Z][-_a-zA-Z0-9]*(?{$yyrule = 14})|[1-9][0-9]*(?{$yyrule = 15})|[ \t\r\n]+(?{$yyrule = 16})|.(?{$yyrule = 17})|((?s:.))(?{$yyrule = 18}))/o,
        RULES => qr /(\/\*(?{$yyrule = 0})|[%]%(?{$yyrule = 6})|[%]%(?{$yyrule = 7})|\{(?{$yyrule = 8})|([_a-zA-Z][-_a-zA-Z0-9]*)[ \s\r\t]*:(?{$yyrule = 10})|[_a-zA-Z][-_a-zA-Z0-9]*(?{$yyrule = 11})|'[^\\']*((\\'|\\)[^\\']*)*'(?{$yyrule = 12})|%(?:token|left|right|nonassoc)(?{$yyrule = 13})|%[_a-zA-Z][-_a-zA-Z0-9]*(?{$yyrule = 14})|[1-9][0-9]*(?{$yyrule = 15})|[ \t\r\n]+(?{$yyrule = 16})|.(?{$yyrule = 17})|((?s:.))(?{$yyrule = 18}))/o,
        USER_CODE => qr /(.|\n(?{$yyrule = 9})|((?s:.))(?{$yyrule = 18}))/o,
    };

}

sub _yyparens {
    return [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0];
}

sub _yycode {
    return     [
#line 31 "wisent.l"
sub {
    	{
				my $self = shift;
				$self->__rememberState ($self->{yystate});
				$self->yybegin('COMMENT');
				return;
			}
},
#line 37 "wisent.l"
sub {
    	$_[0]->__readCode;

},
undef,
#line 39 "wisent.l"
sub {
    	$_[0]->__recallState;

},
undef,
undef,
#line 43 "wisent.l"
sub {
    	$_[0]->yybegin('USER_CODE'); return $^N;

},
#line 44 "wisent.l"
sub {
    	$_[0]->yybegin('RULES'); return $^N;

},
#line 45 "wisent.l"
sub {
    	$_[0]->__readCode;	

},
#line 46 "wisent.l"
sub {
    	$_[0]->yyless(0); $_[0]->__readUserCode;

},
#line 50 "wisent.l"
sub {
    	$_[1], NTERM;

},
#line 51 "wisent.l"
sub {
    	$^N, SYMBOL;

},
#line 52 "wisent.l"
sub {
    	$^N, SYMBOL;

},
#line 54 "wisent.l"
sub {
    	{
					my ($self, $name) = @_;
					$name = substr $^N, 1;
					return $name, PERCENT_TOKEN;
				}
},
#line 59 "wisent.l"
sub {
    	return $^N;

},
#line 60 "wisent.l"
sub {
    	return $^N, NUMBER;

},
undef,
#line 64 "wisent.l"
sub {
    	return $^N;

},
sub {
    print $^N;
    return;
},
    ];

}

sub _yystates {
    return {
        COMMENT => [0, 2, 3, 4, 5, 7, 10, 11, 12, 13, 14, 15, 16, 17],
        INITIAL => [0, 1, 7, 10, 11, 12, 13, 14, 15, 16, 17],
        RULES => [0, 6, 7, 8, 10, 11, 12, 13, 14, 15, 16, 17],
        USER_CODE => [9],

    };
}


sub __readUserCode {
	my ($self) = @_;

	my $code = $self->yyinput;
	$self->yyinput ('');
	return $code, EPILOGUE;
}

sub __rememberState {
	my ($self) = @_;
	$self->{__stateBeforeComment} = $self->yystate;
	return;
}

sub __recallState {
	my ($self) = @_;
	$self->yybegin ($self->{__stateBeforeComment});
	return;
}

sub __readCode {
    my ($self) = shift;

    $self->yyless (0);

    my $reader = Imperia::Wisent::PerlReader->new;

    my $input = substr $self->{yyinput}, $self->{__yypos};
    my ($lineno) = $self->yylloc;
    my $code = $reader->extract ($input, $self->{yyin_name}, $lineno);

    my $pos = $self->yypos;
    $^N = $self->{yytext} = substr $self->{yyinput}, $pos, length $code;

    $self->yypos ($pos + length $code);

    return $code, CODE;
}


1;
