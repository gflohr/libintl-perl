#! /bin/false

###########################################################################
# This file is generated, do not edit!
# Edit 'pofile.y' instead!!
###########################################################################

package Locale::POFile::Parser;

use base qw (Imperia::Wisent::Parser Exporter);

use vars qw (@EXPORT_OK %EXPORT_TAGS);

%EXPORT_TAGS = (yyterminals => [
	'error',
]);

@EXPORT_OK = (
	'error',
);
use constant error => 1;



use constant _yyautomaton =>  {
          'non_terminals' => {
                               '3' => 1,
                               '2' => 1
                             },
          'names' => [
                       '$end',
                       'error',
                       '$accept',
                       'pofile'
                     ],
          'terminals' => {
                           '1' => 1,
                           '0' => 1
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
                                         1
                                       ],
                          'goto' => {
                                      '3' => 1
                                    },
                          'items' => [
                                       [
                                         0,
                                         0
                                       ],
                                       [
                                         1,
                                         0
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '0' => [
                                                  's',
                                                  2
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
                        }
                      ],
          'symbols' => {
                         'error' => 1,
                         '$accept' => 2,
                         'pofile' => 3,
                         '$end' => 0
                       },
          'literals' => undef,
          'rules' => [
                       [
                         2,
                         3,
                         0
                       ],
                       [
                         3
                       ]
                     ]
        };
;

sub _yysemantics {
    return {
    };
}


1;
#line 25 "pofile.y"


