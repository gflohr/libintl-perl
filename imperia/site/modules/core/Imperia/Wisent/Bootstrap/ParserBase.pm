#! /bin/false
#line 15 "wisent.y"

#! /bin/false

# Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
# All rights reserved. 
#
# This file is part of the Imperia Enterprise Content Management System.  You
# can distribute it under the same terms and conditions as Perl itself.

package Imperia::Wisent::Bootstrap::Parser;

use strict;

    
###########################################################################
# This file is generated, do not edit!
# Edit `wisent.y' instead!
###########################################################################

package Imperia::Wisent::Bootstrap::ParserBase;

use base qw (Imperia::Wisent::Parser Exporter);

use vars qw (@EXPORT_OK %EXPORT_TAGS);

%EXPORT_TAGS = (yyterminals => [
	'CODE',
	'EPILOGUE',
	'NTERM',
	'NUMBER',
	'PERCENT_TOKEN',
	'SYMBOL',
	'error',
]);

@EXPORT_OK = (
	'CODE',
	'EPILOGUE',
	'NTERM',
	'NUMBER',
	'PERCENT_TOKEN',
	'SYMBOL',
	'error',
);
use constant CODE => 6;
use constant EPILOGUE => 2;
use constant NTERM => 3;
use constant NUMBER => 7;
use constant PERCENT_TOKEN => 5;
use constant SYMBOL => 4;
use constant error => 1;



use constant _yyautomaton =>  {
          'non_terminals' => {
                               '9' => 1,
                               '12' => 1,
                               '15' => 1,
                               '14' => 1,
                               '20' => 1,
                               '8' => 1,
                               '18' => 1,
                               '13' => 1,
                               '10' => 1,
                               '19' => 1
                             },
          'names' => [
                       '$end',
                       'error',
                       'EPILOGUE',
                       'NTERM',
                       'SYMBOL',
                       'PERCENT_TOKEN',
                       'CODE',
                       'NUMBER',
                       '$accept',
                       'definition',
                       'declarations',
                       '\'%%\'',
                       'rules',
                       'epilogue',
                       'declaration',
                       'symbols',
                       '\'%expect\'',
                       '\'%start\'',
                       'rule',
                       'rhss',
                       'rhs',
                       '\'|\'',
                       '\';\'',
                       '\'%prec\''
                     ],
          'terminals' => {
                           '6' => 1,
                           '11' => 1,
                           '21' => 1,
                           '3' => 1,
                           '7' => 1,
                           '17' => 1,
                           '2' => 1,
                           '22' => 1,
                           '1' => 1,
                           '4' => 1,
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
                                                  4
                                                ],
                                         '16' => [
                                                   's',
                                                   2
                                                 ],
                                         '17' => [
                                                   's',
                                                   3
                                                 ],
                                         '5' => [
                                                  's',
                                                  1
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
                                      '9' => 5,
                                      '10' => 6,
                                      '14' => 7
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
                          'actions' => {
                                         '4' => [
                                                  's',
                                                  8
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          4,
                                          1
                                        ]
                                      ],
                          'goto' => {
                                      '15' => 9
                                    },
                          'items' => [
                                       [
                                         4,
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
                                                  10
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          5,
                                          1
                                        ]
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
                                         '4' => [
                                                  's',
                                                  11
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          6,
                                          1
                                        ]
                                      ],
                          'items' => [
                                       [
                                         6,
                                         1
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
                                         '0' => [
                                                  's',
                                                  12
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
                                                   13
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
                                                  4
                                                ],
                                         '16' => [
                                                   's',
                                                   2
                                                 ],
                                         '17' => [
                                                   's',
                                                   3
                                                 ],
                                         '5' => [
                                                  's',
                                                  1
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
                                      '10' => 14,
                                      '14' => 7
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
                          'actions' => {
                                         '4' => [
                                                  's',
                                                  8
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          8,
                                          1
                                        ],
                                        [
                                          9,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         9
                                       ],
                          'goto' => {
                                      '15' => 15
                                    },
                          'items' => [
                                       [
                                         8,
                                         1
                                       ],
                                       [
                                         9,
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
                                          6,
                                          2
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
                                         '3' => [
                                                  's',
                                                  16
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
                                      '18' => 18,
                                      '12' => 17
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
                                         '1' => [
                                                  's',
                                                  19
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          12,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         20
                                       ],
                          'goto' => {
                                      '19' => 20,
                                      '20' => 21
                                    },
                          'items' => [
                                       [
                                         12,
                                         1
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
                                       ],
                                       [
                                         17,
                                         0
                                       ],
                                       [
                                         18,
                                         0
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
                                         23
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
                                         21,
                                         0
                                       ],
                                       [
                                         22,
                                         0
                                       ],
                                       [
                                         23,
                                         0
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '3' => [
                                                  's',
                                                  16
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
                                      '18' => 18,
                                      '12' => 24
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
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '22' => [
                                                   's',
                                                   25
                                                 ]
                                       },
                          'kernel' => [
                                        [
                                          16,
                                          1
                                        ]
                                      ],
                          'items' => [
                                       [
                                         16,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '22' => [
                                                   's',
                                                   27
                                                 ],
                                         '21' => [
                                                   's',
                                                   26
                                                 ]
                                       },
                          'kernel' => [
                                        [
                                          12,
                                          2
                                        ],
                                        [
                                          14,
                                          1
                                        ],
                                        [
                                          15,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         12
                                       ],
                          'items' => [
                                       [
                                         12,
                                         2
                                       ],
                                       [
                                         14,
                                         1
                                       ],
                                       [
                                         15,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '6' => [
                                                  's',
                                                  29
                                                ],
                                         '4' => [
                                                  's',
                                                  28
                                                ],
                                         '23' => [
                                                   's',
                                                   30
                                                 ]
                                       },
                          'kernel' => [
                                        [
                                          13,
                                          1
                                        ],
                                        [
                                          17,
                                          1
                                        ],
                                        [
                                          18,
                                          1
                                        ],
                                        [
                                          19,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         13
                                       ],
                          'items' => [
                                       [
                                         13,
                                         1
                                       ],
                                       [
                                         17,
                                         1
                                       ],
                                       [
                                         18,
                                         1
                                       ],
                                       [
                                         19,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '2' => [
                                                  's',
                                                  31
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          21,
                                          1
                                        ],
                                        [
                                          22,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         22
                                       ],
                          'items' => [
                                       [
                                         21,
                                         1
                                       ],
                                       [
                                         22,
                                         1
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
                          'actions' => {},
                          'kernel' => [
                                        [
                                          16,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         16
                                       ],
                          'items' => [
                                       [
                                         16,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          14,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         20
                                       ],
                          'goto' => {
                                      '20' => 32
                                    },
                          'items' => [
                                       [
                                         14,
                                         2
                                       ],
                                       [
                                         17,
                                         0
                                       ],
                                       [
                                         18,
                                         0
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
                          'actions' => {},
                          'kernel' => [
                                        [
                                          15,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         15
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
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         17
                                       ],
                          'items' => [
                                       [
                                         17,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          18,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         18
                                       ],
                          'items' => [
                                       [
                                         18,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '4' => [
                                                  's',
                                                  33
                                                ]
                                       },
                          'kernel' => [
                                        [
                                          19,
                                          2
                                        ]
                                      ],
                          'items' => [
                                       [
                                         19,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          21,
                                          2
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         21
                                       ],
                          'items' => [
                                       [
                                         21,
                                         2
                                       ]
                                     ]
                        },
                        {
                          'actions' => {
                                         '6' => [
                                                  's',
                                                  29
                                                ],
                                         '4' => [
                                                  's',
                                                  28
                                                ],
                                         '23' => [
                                                   's',
                                                   30
                                                 ]
                                       },
                          'kernel' => [
                                        [
                                          14,
                                          3
                                        ],
                                        [
                                          17,
                                          1
                                        ],
                                        [
                                          18,
                                          1
                                        ],
                                        [
                                          19,
                                          1
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         14
                                       ],
                          'items' => [
                                       [
                                         14,
                                         3
                                       ],
                                       [
                                         17,
                                         1
                                       ],
                                       [
                                         18,
                                         1
                                       ],
                                       [
                                         19,
                                         1
                                       ]
                                     ]
                        },
                        {
                          'actions' => {},
                          'kernel' => [
                                        [
                                          19,
                                          3
                                        ]
                                      ],
                          'default' => [
                                         'r',
                                         19
                                       ],
                          'items' => [
                                       [
                                         19,
                                         3
                                       ]
                                     ]
                        }
                      ],
          'symbols' => {
                         'SYMBOL' => 4,
                         'rhs' => 20,
                         '\';\'' => 22,
                         '\'%start\'' => 17,
                         'rule' => 18,
                         'declarations' => 10,
                         'rules' => 12,
                         'definition' => 9,
                         'rhss' => 19,
                         'declaration' => 14,
                         'error' => 1,
                         'NTERM' => 3,
                         'NUMBER' => 7,
                         'PERCENT_TOKEN' => 5,
                         '\'%prec\'' => 23,
                         '\'%%\'' => 11,
                         'CODE' => 6,
                         '$end' => 0,
                         '\'|\'' => 21,
                         'EPILOGUE' => 2,
                         'symbols' => 15,
                         '$accept' => 8,
                         '\'%expect\'' => 16,
                         'epilogue' => 13
                       },
          'literals' => {
                          '22' => 1,
                          '11' => 1,
                          '21' => 1,
                          '23' => 1,
                          '16' => 1,
                          '17' => 1
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
                         5,
                         15
                       ],
                       [
                         14,
                         16,
                         7
                       ],
                       [
                         14,
                         17,
                         4
                       ],
                       [
                         14,
                         6
                       ],
                       [
                         15,
                         4,
                         15
                       ],
                       [
                         15,
                         4
                       ],
                       [
                         12,
                         18,
                         12
                       ],
                       [
                         12
                       ],
                       [
                         18,
                         3,
                         19
                       ],
                       [
                         19,
                         20
                       ],
                       [
                         19,
                         19,
                         21,
                         20
                       ],
                       [
                         19,
                         19,
                         22
                       ],
                       [
                         19,
                         1,
                         22
                       ],
                       [
                         20,
                         20,
                         4
                       ],
                       [
                         20,
                         20,
                         6
                       ],
                       [
                         20,
                         20,
                         23,
                         4
                       ],
                       [
                         20
                       ],
                       [
                         13,
                         11,
                         2
                       ],
                       [
                         13,
                         11
                       ],
                       [
                         13
                       ]
                     ]
        };
;

sub _yysemantics {
    return {
        '4' => {
            '2' => sub 
#line 38 "wisent.y"
{ 
					    my ($self, $token, $defs) = @_;
					    $self->__addTokens($token, $defs);
					},
},
        '5' => {
            '2' => sub 
#line 42 "wisent.y"
{ $_[0]->{__expect} = $_[2] },
},
        '6' => {
            '2' => sub 
#line 43 "wisent.y"
{
	   				    my ($self, undef, $symbol) = @_;

	   				    my @locations = $self->yylocations;
					    $self->{__start} = [
					        $symbol, @locations,
					    ];
	   				},
},
        '7' => {
            '1' => sub 
#line 51 "wisent.y"
{
	   				    my ($self, $code) = @_;
					    my @locations = $self->yylocations;
					    $self->__addIntroCode ($code,
					                           $locations[0]);
	   				},
},
        '8' => {
            '2' => sub 
#line 59 "wisent.y"
{
                                            my ($self, $name, $defs) = @_;
					    my @locations = $self->yylocations;
                                            return [[$name, $locations[0]],
					            @$defs];
				        },
},
        '9' => {
            '1' => sub 
#line 65 "wisent.y"
{ 
                                            my ($self, $name) = @_;
					    my @locations = $self->yylocations;
					    return [[$name, $locations[0]]];
                                        },
},
        '12' => {
            '2' => sub 
#line 80 "wisent.y"
{
                            my ($self, $nterm, $rhss) = @_;
                            my @locations = $self->yylocations;
			    $nterm = [$nterm, $locations[0]];
			    $self->__addRuleset ($nterm, $_[2]) 
			},
},
        '13' => {
            '1' => sub 
#line 88 "wisent.y"
{ [$_[1]] },
},
        '14' => {
            '3' => sub 
#line 89 "wisent.y"
{ [@{$_[1]}, $_[3]] },
},
        '17' => {
            '2' => sub 
#line 94 "wisent.y"
{
					    my ($self, $rhs, $symbol) = @_;
					    my @locations = $self->yylocations;
					    return [@$rhs,
					            [SYMBOL =>
						     $symbol, $locations[1]]];

					},
},
        '18' => {
            '2' => sub 
#line 102 "wisent.y"
{
   					    my ($self, $rhs, $code) = @_;
					    my @locations = $self->yylocations;
					    return [@$rhs,
					            [CODE => 
						     $code, $locations[1]]];
					},
},
        '19' => {
            '3' => sub 
#line 109 "wisent.y"
{
   					    my ($self, $rhs, undef, $symbol) 
					    	= @_;
					    my @locations = $self->yylocations;
					    return [@$rhs,
					            [PREC =>
						     $symbol,
						     $locations[1], 
						     $locations[2]]];
   					},
},
        '20' => {
            '0' => sub 
#line 119 "wisent.y"
{ [] },
},
        '21' => {
            '2' => sub 
#line 122 "wisent.y"
{ my ($self, undef, $code) = @_;
					  my @locations = $self->yylocations;

					  $self->__addEpilogue ($code,
					  			$locations[0]);
					},
},
    };
}


1;
#line 132 "wisent.y"


