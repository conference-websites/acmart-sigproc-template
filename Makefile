PRJ = sample-sigconf

# Small cheat to allow synchronization between PDF and .tex for supported editors (run `make S=1`)
ifdef S
EXTRA = -synctex=1
endif

PYTHON3 := $(shell type -P python3 || echo "")

ifeq ($(PYTHON3),)
BUILD = pdflatex ${EXTRA} $< && (ls *.aux | xargs -n 1 bibtex) || pdflatex ${EXTRA} $< || pdflatex ${EXTRA} $<
else
BUILD = .build/latexrun -O . --latex-args="${EXTRA}" $<
endif

SOURCES=$(shell find . -name '*.tex' -or -name '*.bib' -or -name '*.sty')
IMAGES=$(shell find figures -name '*.pdf')

all: $(addsuffix .pdf,${PRJ})

%.pdf: %.tex ${SOURCES} ${IMAGES}
	${BUILD}

view: $(addsuffix .view,${PRJ})

%.view: %.pdf
	open $< &

.PHONY: figures
figures:
	make -C figures

clean:
	/bin/rm -rf *.toc *.aux $(addsuffix .bbl,${PRJ}) *.blg *.log *~* *.bak *.out $(addsuffix .pdf,${PRJ}) cut.sh .latexrun.db* *.fls *.rel _region_.* *.synctex.gz
