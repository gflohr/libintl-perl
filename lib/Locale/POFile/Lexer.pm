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
