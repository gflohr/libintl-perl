#! /bin/false
package Imperia::ILex::Bootstrap::Lexer;

##########################################################################
# Die Datei wurde automatisch erzeugt. Bitte nicht bearbeiten!
# Bearbeiten Sie stattdessen die Datei „ilex.l“!
##########################################################################


#! /bin/false

# Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
# All rights reserved. 
#
# This file is part of the Imperia Enterprise Content Management System.  You
# can distribute it under the same terms and conditions as Perl itself.

use Imperia::ILex::Bootstrap::Parser qw (:yyterminals);

use Imperia::Wisent::PerlReader;
    

package Imperia::ILex::Bootstrap::Lexer;

our $yyrule;

use base qw (Imperia::ILex::Lexer);

sub _yymatch {
    my ($self) = @_;
    use re qw (eval);
    return {
        ACTION_CODE => qr /((?s:\/\*.*?\*\/)(?{$yyrule = 0})|(?s:.)(?{$yyrule = 21})|(?s:.)(?{$yyrule = 26})|((?s:.))(?{$yyrule = 27}))/o,
        INITIAL => qr /((?s:\/\*.*?\*\/)(?{$yyrule = 0})|(?m:^%%)(?{$yyrule = 2})|(?s:[ \t\r\n]+)(?{$yyrule = 4})|[_a-zA-Z][-_a-zA-Z0-9]*(?{$yyrule = 9})|(?m:^%\{[ \t\r]*\n)(?{$yyrule = 22})|%[sx](?=[ \t\r\n])(?{$yyrule = 23})|(?s:.)(?{$yyrule = 26})|((?s:.))(?{$yyrule = 27}))/o,
        PATTERN => qr /((?ms:^\/\*.*?\*\/)(?{$yyrule = 1})|(?m:^<)(?{$yyrule = 7})|\[[^\]\\]*(?:\\.[^\]\\]*)*\](?{$yyrule = 8})|[\\|\$][1-9][0-9]*(?{$yyrule = 12})|\.(?{$yyrule = 13})|[ \t\r]+(?{$yyrule = 14})|\n+(?{$yyrule = 15})|(?m:^\%\%)(?{$yyrule = 16})|\(\?(?{$yyrule = 17})|\\.(?{$yyrule = 18})|\\\n(?{$yyrule = 19})|\\(?{$yyrule = 20})|\((?{$yyrule = 24})|[^ \t\n\(\[\\]+(?{$yyrule = 25})|(?s:.)(?{$yyrule = 26})|((?s:.))(?{$yyrule = 27}))/o,
        RULES => qr /((?s:\/\*.*?\*\/)(?{$yyrule = 0})|(?m:^%%)(?{$yyrule = 3})|(?s:[ \t\r\n]+)(?{$yyrule = 4})|(?m:^[^ \t])(?{$yyrule = 5})|(?s:.)(?{$yyrule = 26})|((?s:.))(?{$yyrule = 27}))/o,
        SC => qr /((?s:\/\*.*?\*\/)(?{$yyrule = 0})|(?s:[ \t\r\n]+)(?{$yyrule = 4})|[_a-zA-Z][-_a-zA-Z0-9]*(?{$yyrule = 9})|,(?{$yyrule = 10})|>(?{$yyrule = 11})|(?s:.)(?{$yyrule = 26})|((?s:.))(?{$yyrule = 27}))/o,
        USER_CODE => qr /((?s:\/\*.*?\*\/)(?{$yyrule = 0})|(?s:.+)(?{$yyrule = 6})|(?s:.)(?{$yyrule = 26})|((?s:.))(?{$yyrule = 27}))/o,
    };

}

sub _yyparens {
    return [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
}

sub _yycode {
    return     [
#line 27 "ilex.l"
sub {
    	return;

},
#line 28 "ilex.l"
sub {
    	return;

},
#line 29 "ilex.l"
sub {
    	shift->yybegin("RULES"); return $^N;

},
#line 30 "ilex.l"
sub {
    	shift->yybegin("USER_CODE"); return $^N;

},
#line 31 "ilex.l"
sub {
     return;

},
#line 32 "ilex.l"
sub {
    	my $l = shift; $l->{__pattern} = ""; $l->yyless(0)->yybegin("PATTERN"); return;

},
#line 33 "ilex.l"
sub {
    	shift->slurpInput; return $^N, CODE;

},
#line 34 "ilex.l"
sub {
    	shift->yybegin("SC"); return $^N;

},
#line 35 "ilex.l"
sub {
     return shift->__addToPattern;

},
#line 36 "ilex.l"
sub {
     return $^N, SC;

},
#line 37 "ilex.l"
sub {
     return ",";

},
#line 38 "ilex.l"
sub {
     my $l = shift; $l->yybegin("PATTERN"); $l->{__pattern} = ''; return $^N;

},
#line 39 "ilex.l"
sub {
     {
					my $l = shift; 
					my $len = length $^N;
					my $pos = length $l->{__pattern};
					my $n = substr $^N, 1;
					my $sig = substr $^N, 0, 1;
					my @r = $l->__addToPattern;
					if ($n >= 10
					    && '\\' eq $sig
					    && $n > $l->{__pattern_parens}) {
					    # Perl will interpret them as 
					    # short-cuts for octals.
					    return @r;
					}
					push @{$l->{__pattern_backrefs}},
						[$pos, $len, $n];
						
					return @r;
				}
},
#line 58 "ilex.l"
sub {
    	shift->__addToPattern;

},
#line 59 "ilex.l"
sub {
    	my $l = shift; $l->yybegin("ACTION_CODE"); return $l->__returnPattern;

},
#line 60 "ilex.l"
sub {
    	my $l = shift; return unless length $l->{__pattern}; return $l->__returnPattern;

},
#line 61 "ilex.l"
sub {
    	shift->yybegin("USER_CODE"); return $^N;

},
#line 62 "ilex.l"
sub {
    	return shift->__addToPattern;

},
#line 63 "ilex.l"
sub {
     return shift->__addToPattern;

},
#line 64 "ilex.l"
sub {
     return shift->__addToPattern;

},
#line 65 "ilex.l"
sub {
    	return shift->__addToPattern;

},
#line 66 "ilex.l"
sub {
    	my $l = shift; $l->yyless(0); return $l->__actionCode;

},
#line 67 "ilex.l"
sub {
    	return shift->__introCode;

},
#line 68 "ilex.l"
sub {
    	return $^N;

},
#line 69 "ilex.l"
sub {
    	my $l = shift; my @r = $l->__addToPattern; ++$l->{__pattern_parens}; return @r;

},
#line 70 "ilex.l"
sub {
    	return shift->__addToPattern;

},
#line 71 "ilex.l"
sub {
    	shift->dieWithInfo("Default action triggered, this is an error.");

},
sub {
    print $^N;
    return;
},
    ];

}

sub _yystates {
    return {
        ACTION_CODE => [0, 21, 26],
        INITIAL => [0, 2, 4, 9, 22, 23, 26],
        PATTERN => [1, 7, 8, 12, 13, 14, 15, 16, 17, 18, 19, 20, 24, 25, 26],
        RULES => [0, 3, 4, 5, 26],
        SC => [0, 4, 9, 10, 11, 26],
        USER_CODE => [0, 6, 26],

    };
}



sub __returnPattern {
	my ($self) = @_;
	
	my $pattern = $self->{__pattern};
	$self->{__pattern} = '';
	
	my $location = $self->{__pattern_location};
	my $parens = $self->{__pattern_parens};
	my $backrefs = $self->{__pattern_backrefs};
	
	$self->{__pattern_parens} = 0;
	$self->{__pattern_backrefs} = [];
	
	my $payload = {
		pattern => $pattern,
		location => $location,
		parens => $parens,
		backrefs => $backrefs,
	};
	return $payload, PATTERN;
}

sub __addToPattern {
    my ($self) = shift;

    my $match  = $^N;

    unless (length $self->{__pattern}) {
    	$self->{__pattern_location} = [$self->yylloc];
    }

    my $pattern_location = $self->{__pattern_location};
    my @yylloc = $self->yylloc;
    $pattern_location->[2] = $yylloc[2];
    $pattern_location->[3] = $yylloc[3];

    $self->{__pattern} .= $match;

    return;
}

sub __introCode {
    my ($self) = shift;

    $self->yyless (0);

    my $reader = Imperia::Wisent::PerlReader->new;

    my $input = substr $self->{yyinput}, $self->{__yypos};
    my ($lineno) = $self->yylloc;
    my $code = $reader->extract ($input, $self->{yyin_name}, $lineno);

    my $pos = $self->yypos;
    my $yytext = $self->{yytext}; # Saved for later ...

    $self->{yytext} = $code;
    $self->yypos ($pos + length $code);
    $self->{yytext} = $yytext . $code;

    return $code, INTRO_CODE;
}

sub __actionCode {
    my ($self) = @_;

    $self->yyless(0);

    my $reader = Imperia::Wisent::PerlReader->new;

    $self->yybegin('PATTERN');

    my $input = substr $self->{yyinput}, $self->{__yypos};
    return if $input =~ /^[ \t\r\n]*$/;

    my ($lineno) = $self->yylloc;
    my $code = $reader->extract ($input, $self->{yyin_name}, $lineno);

    my $pos = $self->yypos;
    my $yytext = $self->{yytext}; # Saved for later ...

    $self->{yytext} = $code;
    $self->yypos ($pos + length $code);
    $self->{yytext} = $yytext . $code;

    return $code, CODE;
}

sub dieWithInfo {
    my ($self, $msg) = @_;
    
    my $match = $^N;
    $match =~ s/\\/\\\\/g;
    $match =~ s/\n/\\n/g;
    $match =~ s/\t/\\t/g;
    
    my $context = substr $self->{yyinput}, $self->{__yypos}, 250;
    
    my $pos = sprintf "0x%x", $self->{__yypos};
    
    die <<EOF;
ERROR: $msg
MATCH: $match
STATE: $self->{__yystate}
POS: $self->{__yypos} ($pos)
FOLLOWING CONTEXT: $context
EOF
}

sub slurpInput {
    my ($self) = @_;
    
    $self->{__yypos} = $self->{yyinput_length};
    
    return $self;
}

1;
