/*
 * This file is part of libintl-perl.
 * Copyright (C) 2002-2011 Guido Flohr <guido@imperia.net>,
 * all rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Library General Public License as published
 * by the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
 * USA.  
 */

%token COMMENT
%token MSGID MSGID_PLURAL MSGSTR MSGSTR_INDEX MSGCTXT DOMAIN
%token DQSTRING

%{
package Locale::POFile::Parser;

use strict;

use Locale::POFile::Message;
use Locale::TextDomain qw (libintl-perl);
%}

%%

pofile: chunks                            {
                                              my ($self) = @_;
                                              
                                              return if $self->{__has_errors};
                                              return $self;
                                          }
      ;

chunks: chunks messagespec
      | chunks domainspec
      | chunks error                      { $_[0]->{__has_errors} = 1 }
      | /* empty */
      ;

messagespec: comments message             { $_[0]->__addMessage(@{$_[2]}, 
                                                                $_[1]) }
           | message                      { $_[0]->__addMessage(@{$_[1]}) }
           ;

domainspec: comments domain
          | domain
          ;

comments: COMMENT                         { [$_[1]] }
        | comments COMMENT                { push @{$_[1]}, $_[2]; return $_[1] }
        ;

message: msgid msgstr                     { return [$_[1], $_[2]] }
       ;

msgid: MSGID dqstrings                        { return [$_[2]] }
     | MSGID dqstrings MSGID_PLURAL dqstrings { return [$_[2], $_[4]] }
     ;

msgstr: MSGSTR dqstrings                      { return [[0, $_[2]]] }
      | msgstr_indexed                        { return $_[1] }
      ;

msgstr_indexed: msgstr_plural                 { return [$_[1]] }
              | msgstr_indexed msgstr_plural  { push @{$_[1]}, $_[2]; $_[1] }
              ;
              
msgstr_plural: MSGSTR_INDEX dqstrings         {
                                                  my ($self, $idx, $strings)
                                                      = @_;
                                                  my @loc = $self->yylocations;
                                                  return [$_[1], $_[2], [@loc]] 
                                              }
             ;
             
domain: DOMAIN DQSTRING                  { return $_[0]->__unquote($_[2]) }
      ;

dqstrings: DQSTRING                      { 
                                             my ($self, $string) = @_;
                                             
                                             return $self->__unquote($string);
                                         }
         | dqstrings DQSTRING            {
                                             my ($self, $head, $string) = @_;
                                             
                                             $head .= $self->__unquote($string);
                                             return $head;
                                         }
         ;
%%
sub __addMessage {
    my ($self, $msgid, $msgstrs) = @_;

    my $nplurals = $self->{__nplurals} || 1;
    my @msgstr;
    foreach my $msgstr (@$msgstrs) {
        my ($index, $text, $locations) = @$msgstr;
        if ($nplurals + 10 < $index) {
            $self->__errorAt(__x("Plural index {index} out of range,"
                                 . " ignored!",
                                 index => $index),
                             $locations->[0]);
            next;
        }
        $msgstr[$index] = $text;
        $self->{__nplurals} = $nplurals = $index if $index > $nplurals;
    }
    
    for (my $i = 0; $i <= $#msgstr; ++$i) {
        $msgstr[$i] = '' unless defined $msgstr[$i];
    }
    
    my $msg = Locale::POFile::Message->new(msgid => $msgid,
                                           msgstr => \@msgstr);

    $self->{__messages} ||= [];
    push @{$self->{__messages}}, $msg;
    
    return $self;
}

sub messages {
    shift->{__messages} || [];
}

sub __formatLocation {
    my (undef, $l) = @_;
    
    return "$l->[4]:$l->[0].$l->[1]-$l->[2].$l->[3]";
}

sub __errorAt {
    my ($self, $message, $location) = @_;
    
    my $where = $self->__formatLocation($location);
    
    $self->yyerror("$where: $message");
    
    return;
}

sub __unquote {
    my (undef, $string) = @_;

    my $conversion = {
        '\\' => '\\',
        a => "\x07",
        b => "\x08",
        t => "\x09",
        n => "\n",
        v => "\x0b",
        f => "\x0c",
        r => "\x0d",
        '"' => '"',
    };
    
    $string =~ s/\\(.)/defined $conversion->{$1} ? 
        $conversion->{$1} : "\\$1"/ge;
    
    return $string;
}

sub yyerror {
    my ($self, $error) = @_;
    
    $self->{__errors} ||= [];
    push @{$self->{__errors}}, $error;
    
    return $self;
}

sub errors {
    my ($self) = @_;
    
    $self->{__errors} ||= [];
    
    return @{$self->{__errors}};
}
