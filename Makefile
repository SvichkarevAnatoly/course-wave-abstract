# Generic make file for LaTeX: requires GNU make

LATEX = latex
BIBTEX = bibtex
PDFLATEX = pdflatex --file-line-error-style --shell-escape
TEXFILE = Svichkarev_abstract.tex
INCLUDES = \
	parts/titlepage.tex \
	parts/intro.tex \
	parts/aspermethod.tex \
	parts/decompmethod.tex \
	parts/solution.tex
BIBLIO = \
	parts/citations.bib
STYLES = \
	parts/utf8gost71u.bst
# FIGURES = \
# 	figs/rastrigin.eps \
# 	figs/m5.eps \
# 	figs/m10.eps \
# 	figs/tukey.eps

.PHONY: pdf clean veryclean

build: $(TEXFILE) $(INCLUDES) $(BIBLIO) $(STYLES) #$(FIGURES)
	$(PDFLATEX) $<;
	$(BIBTEX) $(<:.tex=)
	$(PDFLATEX) $<;
	$(PDFLATEX) $<;
	# $(PDFLATEX) $<;

pdf: build clean
	evince $(TEXFILE:.tex=.pdf) &

clean:
	@rm -f \
	$(INCLUDES:.tex=.aux) \
	$(TEXFILE:.tex=.aux) \
	$(TEXFILE:.tex=.log) \
	$(TEXFILE:.tex=.out) \
	$(TEXFILE:.tex=.toc) \
	$(TEXFILE:.tex=.bbl) \
	$(TEXFILE:.tex=.blg) \
	$(TEXFILE:.tex=.brf) \
	$(TEXFILE:.tex=.bm)

veryclean: clean
	@rm -f \
	$(TEXFILE:.tex=.pdf)
	@rm -f figs/*.pdf

