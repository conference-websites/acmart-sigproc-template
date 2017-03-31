PRJ = sample-sigconf

PYTHON3 := $(shell type -P python3 || echo "")

ifeq ($(PYTHON3),)
BUILD = pdflatex ${EXTRA} ${PRJ} && (ls ${PRJ}.aux | xargs -n 1 bibtex) && pdflatex ${EXTRA} ${PRJ} && pdflatex ${EXTRA}
else
BUILD = .build/latexrun ${PRJ}
endif

.PHONY: all view clean

all : ${PRJ}.pdf

${PRJ}.pdf : *.tex *.bib
	${BUILD}

view : ${PRJ}.pdf
	open ${PRJ}.pdf &

clean:
	rm -Rf latex.out
	rm -f *.toc *.aux *.bbl *.blg *.log *~* *.bak *.out *synctex.gz ${PRJ}.pdf
