/* $Id $ */
/*
 * This file is part of libintl-perl.
 * Copyright (C) 2002-2009 Guido Flohr <guido@imperia.net>,
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
%token MSGID MSGID_PLURAL MSGSTR MSGCTXT DOMAIN
%token DQSTRING

%{
package Locale::POFile::Parser;

use strict;

use Locale::POFile::Message;
%}

%%

pofile: chunks                           { return 1 }
      ;

chunks: chunks messagespec
      | chunks domainspec
      | chunks error
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

message: MSGID dqstrings MSGSTR dqstrings { return [join('', @{$_[2]}), 
                                                    join('', @{$_[4]})] }
       ;

domain: DOMAIN DQSTRING
          ;

dqstrings: DQSTRING                       { [$_[1]] }
         | dqstrings DQSTRING             { push @{$_[1]}, $_[2]; return $_[1] }
         ;
%%
sub __addMessage {
    my ($self, $msgid, $msgstr) = @_;
    
    my $msg = Locale::POFile::Message->new(msgid => $msgid,
                                           msgstr => $msgstr);
    
    $self->{__messages} ||= [];
    push @{$self->{__messages}}, $msg;
    
    return $self;
}

sub messages {
    shift->{__messages} || [];
}