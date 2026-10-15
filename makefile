PDFS := $(patsubst %.md,%.md.pdf,$(wildcard *.md))

PREFIX = $(HOME)/.pandoc/md

# Bibliography 
# For use with publications in the resume

BIB = $(HOME)/.bibs/refs.bib
CSL = chicago-fullnote-bibliography

# Main Resume Make

all : $(PDFS)

%.md.pdf : %.md
	pandoc *.md \
	--pdf-engine=xelatex \
	--template=$(PREFIX)/resume.latex \
	-s -o $@  && open $@

clean:
	rm -rf *.pdf *.html *.log *.aux

rebuild:

	make clean && make
