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
use IO::Handle;

use Imperia::ILex;
use Imperia::ILex::Bootstrap::Lexer;

sub usage_error;

my $option_help;
my $option_verbose;
my $option_package;
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
                     
	   help             => \$option_help,
	   'verbose+'       => \$option_verbose
	   ) or exit 1;

pod2usage(0) if $option_help;

my $input_file = $ARGV[0];
usage_error "No input file given!" unless defined $input_file;

my $input_stem;

local *YYIN;
open YYIN, "<$input_file"
    or die "Cannot open '$input_file' for reading: $!\n";

$input_stem = $input_file;
$input_stem =~ s/\.l$//;

my $package = $option_package;
unless (defined $package) {
    $package = $input_stem;
    $package =~ s,.*/,,;
}

unless (defined $option_output) {
    my @parts = split /(?:::|\')/, $package;
    $option_output = $parts[-1] . '.pm';
}

my $parser = Imperia::ILex->new  (input_file => $input_file,
                                  package => $package,
                                  );

if ($option_verbose) {
    my $output = $parser->verboseDescription;
    
    print STDERR $output;
}

my $lexer = Imperia::ILex::Bootstrap::Lexer->new (yyin => \*YYIN,
						  yyin_name => $input_file);
$parser->{lexer} = $lexer;
$parser->yyparse ($lexer, yydebug => $ENV{ILEX_DEBUG});

if (defined $option_shebang) {
    chomp $option_shebang;
    $option_shebang .= "\n";
} else {
    $option_shebang = '';
}
open HANDLE, ">$option_output" 
    or die "Cannot open '$option_output' for writing: $!\n";
print HANDLE $option_shebang . $parser->lexer
    or die "Cannot write '$option_output': $!\n";
close HANDLE
    or die "Cannot close '$option_output': $!\n";

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

site_ilex - Imperia Scanner Generator

=head1 SYNOPSIS

Usage: $0 [OPTIONS] [INPUTFILE]

Mandatory arguments for long options are mandatory for short options, too.

  -p, --package=PACKAGE     package name for output module, defaults to STEM
  -o, --output=OUTPUT_FILE  filename for output file, defaults to the part after
                            the last '::' or "'" of PACKAGE
  -s, --shebang=SHEBANG     Write SHEBANG into the first line of the output
                            file.  A newline is automatically added, if the
			    string does not end in a newline.

  -h, --help                display this help page and exit
  -v, --verbose             write an extra output file STEM.output
                            that contains a description of the details
                            of the parsed grammar

Creates a scanner B<STEM.pm> from the INPUTFILE.  This scanner module will be
a derived class of Imperia::ILex::Lexer(3pm).

Please try the command "perldoc SCRIPT" (replace script with the filename 
of this script) for more detailled information.

In the above information B<STEM> is the stem of the input file with an optional
extender F<.l> stripped off.  B<NAME> is the same as B<STEM> with the directory
part also stripped off.

=head1 DESCRIPTION

To be written ...

=head1 LEXFILE SYNTAX

To be written ...

=head1 COPYRIGHT

Copyright (C) 1995-2011 Imperia AG, http://www.imperia.net/.
All rights reserved. 

This file is part of the Imperia Enterprise Content Management System.  You
can distribute it under the same terms and conditions as Perl itself.

=head1 SEE ALSO

perl(1), Imperia::ILex::Lexer(3pm), Imperia::Wisent(3pm)

=cut

