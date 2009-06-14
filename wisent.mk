# Temporary hack: The sources for wisent and ilex are not publicly available.
# We -include the corresponding rules.

include imperia_dir.mk

WISENT_FLAGS = --verbose --shebang="\#! /bin/false"
ILEX_FLAGS   = --shebang="\#! /bin/false"

grammardir = .
sitedir    = ${IMPERIA_DIR}/site
sitebindir = ${sitedir}/bin

wisent     = ${sitebindir}/site_wisent.pl ${WISENT_FLAGS}
ilex       = ${sitebindir}/site_ilex.pl ${ILEX_FLAGS}

pure_all :: lib/Locale/POFile/Parser.pm lib/Locale/POFile/Lexer.pm

lib/Locale/POFile/Parser.pm: pofile.y
	${wisent} --package=Locale::POFile::Parser --output=$@.tmp $< && \
	    perl -e 'undef ${/};$_ = <>; s/__END__.*//s; print $_' \
		${sitedir}/modules/core/Imperia/Wisent/Parser.pm >$@ && \
	    cat $@.tmp >>$@ && \
	    rm $@.tmp

lib/Locale/POFile/Lexer.pm: pofile.l
	${ilex} --package=Locale::POFile::Lexer --output=$@ $<

