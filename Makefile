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
	parts/slowvar.tex \
	parts/secular.tex
# BIBLIO = \
# 	citations.bib
# STYLES = \
# 	thesisby.cls \
# 	utf8gost71u.bst
# FIGURES = \
# 	figs/rastrigin.eps \
# 	figs/m5.eps \
# 	figs/m10.eps \
# 	figs/tukey.eps

.PHONY: pdf clean veryclean

build: $(TEXFILE) $(INCLUDES) #$(STYLES) $(BIBLIO) $(FIGURES)
	$(PDFLATEX) $<;
	# $(BIBTEX) $(<:.tex=)
	$(PDFLATEX) $<;
	# $(PDFLATEX) $<;
	# $(PDFLATEX) $<;

pdf: build clean
	evince $(TEXFILE:.tex=.pdf) &

clean:
	@rm -f \
	$(INCLUDES:.tex=.aux) \
	$(TEXFILE:.tex=.aux) \
	$(TEXFILE:.tex=.log) \
	$(TEXFILE:.tex=.out) \
	$(TEXFILE:.tex=.toc) 

veryclean: clean
	@rm -f \
	$(TEXFILE:.tex=.pdf) \
	$(TEXFILE:.tex=.bbl) \
	$(TEXFILE:.tex=.blg) \
	$(TEXFILE:.tex=.brf) \
	$(TEXFILE:.tex=.bm)
	@rm -f *.pdf

