#! /bin/false
#line 9 "ilex.y"

# Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
# All rights reserved. 
#
# This file is part of the Imperia Enterprise Content Management System.  You
# can distribute it under the same terms and conditions as Perl itself.

package Imperia::ILex::Bootstrap::Parser;

use strict;

use Data::Dumper;
    
###########################################################################
# This file is generated, do not edit!
# Edit `ilex.y' instead!
###########################################################################

package Imperia::ILex::Bootstrap::Parser;

use base qw (Imperia::Wisent::Parser Exporter);

use vars qw (@EXPORT_OK %EXPORT_TAGS);

%EXPORT_TAGS = (yyterminals => [
	'CODE',
	'INTRO_CODE',
	'NAME',
	'NAME_DEFINITION',
	'PATTERN',
	'SC',
	'error',
]);

@EXPORT_OK = (
	'CODE',
	'INTRO_CODE',
	'NAME',
	'NAME_DEFINITION',
	'PATTERN',
	'SC',
	'error',
);
use constant CODE => 5;
use constant INTRO_CODE => 6;
use constant NAME => 2;
use constant NAME_DEFINITION => 3;
use constant PATTERN => 4;
use constant SC => 7;
use constant error => 1;



use constant _yyautomaton =>  {
          'non_terminals' => {
                               '26' => 1,
                               '9' => 1,
                               '17' => 1,
                               '12' => 1,
                               '20' => 1,
                               '15' => 1,
                               '14' => 1,
                               '8' => 1,
                               '24' => 1,
                               '13' => 1,
                               '19' => 1,
                               '10' => 1
                             },
          'names' => [
                       '$end',
                       'error',
                       'NAME',
                       'NAME_DEFINITION',
                       'PATTERN',
                       'CODE',
                       'INTRO_CODE',
                       'SC',
                       '$accept',
                       'input',
                       'definitions',
                       '\'%%\'',
                       'rules',
                       'epilogue',
                       'definition',
                       'start_conditions',
                       '\'%s\'',
                       'names',
                       '\'%x\'',
                       'rule',
                       'startcons',
                       '\'<\'',
                       '\'*\'',
                       '\'>\'',
                       'cnames',
                       '\',\'',
                       'user_code'
                     ],
          'terminals' => {
                           '25' => 1,
                           '6' => 1,
                           '11' => 1,
                           '21' => 1,
                           '3' => 1,
                           '7' => 1,
                           '2' => 1,
                           '22' => 1,
                           '1' => 1,
                           '4' => 1,
                           '18' => 1,
                           '0' => 1,
                           '23' => 1,
                           '16' => 1,
                           '5' => 1
                         },
          'states' => [
                        {
                          'actions' => {
                                         '6' => [
                                                  's',
                                                  1
                                                ],
                                         '18' => [
                                                   's',
                                                   3
                                                 ],
                                         '16' => [
                                                   's',
                                                   2
                                                 ]
                                       },
                          'kernel' => [
                                        [
                                          0,
                                          0
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         3
                                       ],
                          'goto' => {
                                      '9' => 4,
                                      '10' => 5,
                                      '14' => 6,
                                      '15' => 7
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
                                       ],
                                       [
                                         7,
                                         0
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          5,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         5
                                       ],
                          'items' => [
                                       [
                                         5,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '7' => [
                                                  's',
                                                  8
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          6,
                                          1
                                        ]
                                      ],
                          'goto' => {
                                      '17' => 9
                                    },
                          'items' => [
                                       [
                                         6,
                                         1
                                       ],
                                       [
                                         8,
                                         0
                                       ],
                                       [
                                         9,
                                         0
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '7' => [
                                                  's',
                                                  8
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          7,
                                          1
                                        ]
                                      ],
                          'goto' => {
                                      '17' => 10
                                    },
                          'items' => [
                                       [
                                         7,
                                         1
                                       ],
                                       [
                                         8,
                                         0
                                       ],
                                       [
                                         9,
                                         0
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '0' => [
                                                  's',
                                                  11
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
                                         '11' => [
                                                   's',
                                                   12
                                                 ]
                                       },
                          'kernel' => [
                                        [
                                          1,
                                          1
                                        ]
                                      ],
                          'items' => [
                                       [
                                         1,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '6' => [
                                                  's',
                                                  1
                                                ],
                                         '18' => [
                                                   's',
                                                   3
                                                 ],
                                         '16' => [
                                                   's',
                                                   2
                                                 ]
                                       },
                          'kernel' => [
                                        [
                                          2,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         3
                                       ],
                          'goto' => {
                                      '10' => 13,
                                      '14' => 6,
                                      '15' => 7
                                    },
                          'items' => [
                                       [
                                         2,
                                         1
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
                                       ],
                                       [
                                         7,
                                         0
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          4,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         4
                                       ],
                          'items' => [
                                       [
                                         4,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          8,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         8
                                       ],
                          'items' => [
                                       [
                                         8,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '7' => [
                                                  's',
                                                  14
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          6,
                                          2
                                        ],
                                        [
                                          9,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         6
                                       ],
                          'items' => [
                                       [
                                         6,
                                         2
                                       ],
                                       [
                                         9,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '7' => [
                                                  's',
                                                  14
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          7,
                                          2
                                        ],
                                        [
                                          9,
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
                                         2
                                       ],
                                       [
                                         9,
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
                        },
                        {
                          'actions' => {
                                         '4' => [
                                                  'r',
                                                  '14'
                                                ],
                                         '21' => [
                                                   's',
                                                   15
                                                 ]
                                       },
                          'kernel' => [
                                        [
                                          1,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         11
                                       ],
                          'goto' => {
                                      '19' => 17,
                                      '12' => 16,
                                      '20' => 18
                                    },
                          'items' => [
                                       [
                                         1,
                                         2
                                       ],
                                       [
                                         10,
                                         0
                                       ],
                                       [
                                         11,
                                         0
                                       ],
                                       [
                                         12,
                                         0
                                       ],
                                       [
                                         13,
                                         0
                                       ],
                                       [
                                         14,
                                         0
                                       ],
                                       [
                                         15,
                                         0
                                       ],
                                       [
                                         16,
                                         0
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          2,
                                          2
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
                                         '22' => [
                                                   's',
                                                   19
                                                 ],
                                         '7' => [
                                                  's',
                                                  20
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          15,
                                          1
                                        ],
                                        [
                                          16,
                                          1
                                        ]
                                      ],
                          'goto' => {
                                      '24' => 21
                                    },
                          'items' => [
                                       [
                                         15,
                                         1
                                       ],
                                       [
                                         16,
                                         1
                                       ],
                                       [
                                         17,
                                         0
                                       ],
                                       [
                                         18,
                                         0
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '11' => [
                                                   's',
                                                   22
                                                 ]
                                       },
                          'kernel' => [
                                        [
                                          1,
                                          3
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         19
                                       ],
                          'goto' => {
                                      '13' => 23
                                    },
                          'items' => [
                                       [
                                         1,
                                         3
                                       ],
                                       [
                                         19,
                                         0
                                       ],
                                       [
                                         20,
                                         0
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '4' => [
                                                  'r',
                                                  '14'
                                                ],
                                         '21' => [
                                                   's',
                                                   15
                                                 ]
                                       },
                          'kernel' => [
                                        [
                                          10,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         11
                                       ],
                          'goto' => {
                                      '19' => 17,
                                      '12' => 24,
                                      '20' => 18
                                    },
                          'items' => [
                                       [
                                         10,
                                         1
                                       ],
                                       [
                                         10,
                                         0
                                       ],
                                       [
                                         11,
                                         0
                                       ],
                                       [
                                         12,
                                         0
                                       ],
                                       [
                                         13,
                                         0
                                       ],
                                       [
                                         14,
                                         0
                                       ],
                                       [
                                         15,
                                         0
                                       ],
                                       [
                                         16,
                                         0
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '4' => [
                                                  's',
                                                  25
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          12,
                                          1
                                        ],
                                        [
                                          13,
                                          1
                                        ]
                                      ],
                          'items' => [
                                       [
                                         12,
                                         1
                                       ],
                                       [
                                         13,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '23' => [
                                                   's',
                                                   26
                                                 ]
                                       },
                          'kernel' => [
                                        [
                                          15,
                                          2
                                        ]
                                      ],
                          'items' => [
                                       [
                                         15,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          17,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         17
                                       ],
                          'items' => [
                                       [
                                         17,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '25' => [
                                                   's',
                                                   28
                                                 ],
                                         '23' => [
                                                   's',
                                                   27
                                                 ]
                                       },
                          'kernel' => [
                                        [
                                          16,
                                          2
                                        ],
                                        [
                                          18,
                                          1
                                        ]
                                      ],
                          'items' => [
                                       [
                                         16,
                                         2
                                       ],
                                       [
                                         18,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '5' => [
                                                  's',
                                                  29
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          20,
                                          1
                                        ]
                                      ],
                          'goto' => {
                                      '26' => 30
                                    },
                          'items' => [
                                       [
                                         20,
                                         1
                                       ],
                                       [
                                         21,
                                         0
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          1,
                                          4
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         1
                                       ],
                          'items' => [
                                       [
                                         1,
                                         4
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          10,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         10
                                       ],
                          'items' => [
                                       [
                                         10,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '5' => [
                                                  's',
                                                  31
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          12,
                                          2
                                        ],
                                        [
                                          13,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         13
                                       ],
                          'items' => [
                                       [
                                         12,
                                         2
                                       ],
                                       [
                                         13,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          15,
                                          3
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         15
                                       ],
                          'items' => [
                                       [
                                         15,
                                         3
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          16,
                                          3
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         16
                                       ],
                          'items' => [
                                       [
                                         16,
                                         3
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '7' => [
                                                  's',
                                                  32
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          18,
                                          2
                                        ]
                                      ],
                          'items' => [
                                       [
                                         18,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          21,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         21
                                       ],
                          'items' => [
                                       [
                                         21,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          20,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         20
                                       ],
                          'items' => [
                                       [
                                         20,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          12,
                                          3
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         12
                                       ],
                          'items' => [
                                       [
                                         12,
                                         3
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          18,
                                          3
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         18
                                       ],
                          'items' => [
                                       [
                                         18,
                                         3
                                       ]
                                     ]
                        }
                      ],
          'symbols' => {
                         'SC' => 7,
                         'input' => 9,
                         '\'<\'' => 21,
                         '\'%s\'' => 16,
                         'rule' => 19,
                         '\',\'' => 25,
                         'definitions' => 10,
                         'rules' => 12,
                         'definition' => 14,
                         'start_conditions' => 15,
                         '\'*\'' => 22,
                         'cnames' => 24,
                         'error' => 1,
                         'startcons' => 20,
                         '\'%x\'' => 18,
                         'NAME' => 2,
                         'names' => 17,
                         '\'%%\'' => 11,
                         'NAME_DEFINITION' => 3,
                         'CODE' => 5,
                         '$end' => 0,
                         'PATTERN' => 4,
                         'INTRO_CODE' => 6,
                         '$accept' => 8,
                         'epilogue' => 13,
                         '\'>\'' => 23,
                         'user_code' => 26
                       },
          'literals' => {
                          '25' => 1,
                          '22' => 1,
                          '11' => 1,
                          '21' => 1,
                          '18' => 1,
                          '23' => 1,
                          '16' => 1
                        },
          'rules' => [
                       [
                         8,
                         9,
                         0
                       ],
                       [
                         9,
                         10,
                         11,
                         12,
                         13
                       ],
                       [
                         10,
                         14,
                         10
                       ],
                       [
                         10
                       ],
                       [
                         14,
                         15
                       ],
                       [
                         14,
                         6
                       ],
                       [
                         15,
                         16,
                         17
                       ],
                       [
                         15,
                         18,
                         17
                       ],
                       [
                         17,
                         7
                       ],
                       [
                         17,
                         17,
                         7
                       ],
                       [
                         12,
                         19,
                         12
                       ],
                       [
                         12
                       ],
                       [
                         19,
                         20,
                         4,
                         5
                       ],
                       [
                         19,
                         20,
                         4
                       ],
                       [
                         20
                       ],
                       [
                         20,
                         21,
                         22,
                         23
                       ],
                       [
                         20,
                         21,
                         24,
                         23
                       ],
                       [
                         24,
                         7
                       ],
                       [
                         24,
                         24,
                         25,
                         7
                       ],
                       [
                         13
                       ],
                       [
                         13,
                         11,
                         26
                       ],
                       [
                         26,
                         5
                       ]
                     ]
        };
;

sub _yysemantics {
    return {
        '5' => {
            '1' => sub 
#line 37 "ilex.y"
{
	    				my ($self, $code) = @_;
					push @{$self->{__intro_code}}, $code;
				},
},
        '6' => {
            '2' => sub 
#line 43 "ilex.y"
{ 
                                    my ($self, $s, $names) = @_;
                                    foreach my $name (@$names) {
                                        $self->{__start_cons}->{$name} = 1;
                                    }
                                },
},
        '7' => {
            '2' => sub 
#line 50 "ilex.y"
{ 
                                    my ($self, $x, $names) = @_;
                                    foreach my $name (@$names) {
                                        $self->{__xstart_cons}->{$name} = 1;
                                    }
                                },
},
        '8' => {
            '1' => sub 
#line 58 "ilex.y"
{
					my ($self, $sc) = @_;
					return [$sc];
				},
},
        '9' => {
            '2' => sub 
#line 62 "ilex.y"
{
      					my ($self, $names, $sc) = @_;
					push @$names, $sc;
					return $names;
       				},
},
        '12' => {
            '3' => sub 
#line 77 "ilex.y"
{
                                    my ($self, $startcons, $pattern, $code) = @_;
                                    $pattern->{startcons} = $startcons;
                                    $pattern->{code} = $code;
                                    push @{$self->{__rules}}, $pattern;
                                },
},
        '13' => {
            '2' => sub 
#line 83 "ilex.y"
{
                                    my ($self, $startcons, $pattern) = @_;
                                    $pattern->{startcons} = $startcons;
                                    push @{$self->{__rules}}, $pattern;
                                },
},
        '14' => {
            '0' => sub 
#line 90 "ilex.y"
{ return [] },
},
        '15' => {
            '3' => sub 
#line 91 "ilex.y"
{ return [$_[2]]; },
},
        '16' => {
            '3' => sub 
#line 92 "ilex.y"
{ return $_[2]; },
},
        '17' => {
            '1' => sub 
#line 95 "ilex.y"
{ return [$_[1]]; },
},
        '18' => {
            '3' => sub 
#line 96 "ilex.y"
{
					my ($self, $cnames, undef, $sc) = @_;
					push @$cnames, $sc;
					return $cnames;
				},
},
        '21' => {
            '1' => sub 
#line 107 "ilex.y"
{ $_[0]->{__outro} .= $_[1]; },
},
    };
}


1;
#line 110 "ilex.y"


