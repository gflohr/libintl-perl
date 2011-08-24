# This Makefile snippet contains rules for generating the scanner and parser
# for PO files.  It relies on parts of the Imperia Enterprise Content
# Management System which are included here for completeness.

IMPERIA_WISENT_FILES =
IMPERIA_ILEX_FILES =
-include include_imperia.mk

WISENT_FLAGS = --verbose --shebang="\#! /bin/false"
ILEX_FLAGS   = --shebang="\#! /bin/false"

grammardir = .
sitedir    = imperia/site
sitebindir = ${sitedir}/bin

wisent     = ${sitebindir}/wisent.pl ${WISENT_FLAGS}
ilex       = ${sitebindir}/ilex.pl ${ILEX_FLAGS}

pure_all :: lib/Locale/POFile/Parser.pm lib/Locale/POFile/Lexer.pm

lib/Locale/POFile/Parser.pm: pofile.y ${IMPERIA_WISENT_FILES} module_cat
	${wisent} --package=Locale::POFile::Parser --output=$@.tmp $< && \
	${PERL} ./module_cat ${sitedir}/modules/core/Imperia/Wisent/Parser.pm \
	                     $@.tmp >$@ && \
	    rm $@.tmp

lib/Locale/POFile/Lexer.pm: pofile.l ${IMPERIA_WISENT_FILES} module_cat
	${ilex} --package=Locale::POFile::Lexer --output=$@.tmp $< && \
	${PERL} ./module_cat ${sitedir}/modules/core/Imperia/ILex/Lexer.pm \
	                     $@.tmp >$@ && \
	    rm $@.tmp

