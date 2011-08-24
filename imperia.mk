# This file is generally not included in the Makefile!

ibin = site/bin
ilib = site/modules/core/Imperia

upstream = ${IMPERIA_DIR}
upstream_bin = ${upstream}/${ibin}
upstream_lib = ${upstream}/${ilib}

here = imperia
here_bin = ${here}/${ibin}
here_lib = ${here}/${ilib}

IMPERIA_WISENT_FILES = 					\
	${here_bin}/ilex.pl				\
	${here_lib}/ILex.pm				\
	${here_lib}/ILex/Lexer.pm			\
	${here_lib}/ILex/Bootstrap/Lexer.pm		\
	${here_lib}/ILex/Bootstrap/Parser.pm		\
	${here_bin}/wisent.pl				\
	${here_lib}/Wisent.pm				\
	${here_lib}/Wisent/Parser.pm			\
	${here_lib}/Wisent/Bootstrap/Lexer.pm		\
	${here_lib}/Wisent/Bootstrap/Parser.pm		\
	${here_lib}/Wisent/Bootstrap/ParserBase.pm	\
	${here_lib}/Wisent/PerlReader.pm

${here_bin}/ilex.pl: ${upstream_bin}/site_ilex.pl
	cp -f ${upstream_bin}/site_ilex.pl $@

${here_lib}/ILex.pm: ${upstream_lib}/ILex.pm
	cp -f ${upstream_lib}/ILex.pm $@
	
${here_lib}/ILex/Lexer.pm: ${upstream_lib}/ILex/Lexer.pm
	cp -f ${upstream_lib}/ILex/Lexer.pm $@
	
${here_lib}/ILex/Bootstrap/Lexer.pm: ${upstream_lib}/ILex/Bootstrap/Lexer.pm
	cp -f ${upstream_lib}/ILex/Bootstrap/Lexer.pm $@
	
${here_lib}/ILex/Bootstrap/Parser.pm: ${upstream_lib}/ILex/Bootstrap/Parser.pm
	cp -f ${upstream_lib}/ILex/Bootstrap/Parser.pm $@
	
${here_bin}/wisent.pl: ${upstream_bin}/site_wisent.pl
	cp -f ${upstream_bin}/site_wisent.pl $@

${here_lib}/Wisent.pm: ${upstream_lib}/Wisent.pm
	cp -f ${upstream_lib}/Wisent.pm $@
	
${here_lib}/Wisent/Parser.pm: ${upstream_lib}/Wisent/Parser.pm
	cp -f ${upstream_lib}/Wisent/Parser.pm $@
	
${here_lib}/Wisent/Bootstrap/Lexer.pm: ${upstream_lib}/Wisent/Bootstrap/Lexer.pm
	cp -f ${upstream_lib}/Wisent/Bootstrap/Lexer.pm $@
	
${here_lib}/Wisent/Bootstrap/Parser.pm: ${upstream_lib}/Wisent/Bootstrap/Parser.pm
	cp -f ${upstream_lib}/Wisent/Bootstrap/Parser.pm $@
	
${here_lib}/Wisent/Bootstrap/ParserBase.pm: ${upstream_lib}/Wisent/Bootstrap/ParserBase.pm
	cp -f ${upstream_lib}/Wisent/Bootstrap/ParserBase.pm $@
	
${here_lib}/Wisent/PerlReader.pm: ${upstream_lib}/Wisent/PerlReader.pm
	cp -f ${upstream_lib}/Wisent/PerlReader.pm $@
	
