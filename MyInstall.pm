package MyInstall;

use ExtUtils::Install;

use vars qw (@ISA @EXPORT @EXPORT_OK);

@ISA = @ExtUtils::Install::ISA;
@EXPORT = @ExtUtils::Install::EXPORT;
@EXPORT_OK = @ExtUtils::Install::EXPORT_OK;

my $original_code = sub { &$ExtUtils::Install::directory_not_empty };

sub ExtUtils::Install::directory_not_empty ($) {
	my($dir) = @_;

print STDERR "********* Checking $dir ***************\n";

	return 0 if $dir eq 'blib/arch';

	goto &$original_code;
}

sub AUTOLOAD
{
        print STDERR "AUTOLOAD: $AUTOLOAD\n";
                                                                                
        my $name = 'func';
        my $code;
        my $string = "\$code = \\&ExtUtils::Install::$name";
                                                                                
        eval $string;
        *$AUTOLOAD = $code;
                                                                                
        goto &$AUTOLOAD;
}

1;

