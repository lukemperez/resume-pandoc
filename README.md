# resume-pandoc

(c) 2026 Luke M. Perez
LaTex resume template for Pandoc based on John Bokma's revision of 
Jason R. Blevins' template.

- https://github.com/john-bokma/resume-pandoc
- http://jblevins.org/projects/cv-template/.

This fork contains Bokma's resume in markdown as an example. But some edits have been made to conform with my setup in MacOS.

Specifically, I store all my templates in `.pandoc/` on MacOS and use makefiles. For more on makefiles see, [Makefiles (GNU make)](https://www.gnu.org/software/make/manual/html_node/Makefiles.html), and of course [Pandoc](pandoc.org). For more on my Pandoc setup, see my [github repo .pandoc](https://github.com/lukemperez/pandoc-templates).

## Using Make (a brief version)

Install makefile if it is not already. I use [Brew](brew.sh). With Brew, 

```
brew install make
```

Create a file called `makefile` in the same directory as the markdown file. It needs no extension. 

Save this text in the file.

```
PDFS := $(patsubst %.md,%.md.pdf,$(wildcard *.md))

PREFIX = $(HOME)/.pandoc/md

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
```

In your terminal, use the command

```
make
```

The makefile will execute the script. *Note Bene*. The use of `$(HOME)` may not be necessary. I have multiple machines with different file paths. To make it work, `$(HOME)` tells the computer to start in its own home directory.

## YAML Meta Block

These are the settings from Bokma's version. I had to remove some of the special font encodings. 

name
 : the name on the resume.

keywords
 : keywords to be added to the PDF file.

left-column
 : a list of lines you want in the left column, directly under the name
   on the first page.

right-column
 : a list of lines you want in the right column, directly under the
   name on the first page.

fontsize
 : default `10pt`.

fontenc
 : default `T1`.

urlcolor
 : used in PDF, default `blue`.

linkcolor
 : used in PDF, default `magenta`.

numbersections
 : number sections, default off. Can also be controlled using the
 `pandoc` option `-N, --number-sections`.

name-color
 : the SVG name of the font color used for your name on the
 resume. For example `DarkSlateGray`. Note that this option
 also changes the font used for your name to bold and sans serif.

section-color
 : the SVG name of the font color used for sections. For example
 `Tomato`.  Note that this option also changes the section font to
 bold and sans serif.

Regarding the last two options: if you just want to change the font to
sans serif bold you can just use the color `black`.

# Example PDF

See [http://johnbokma.com/documents/perl-programmer-john-bokma-resume.pdf](http://johnbokma.com/documents/perl-programmer-john-bokma-resume.pdf).

# Credits

- John Bokma's repo came up first when searching for an updated template in fall 2026.
- Jason R. Blevins for making the LaTeX resume example that inspired this template.
- Christoph Frings and Andrew for their help with description list; reference
  [enumitem: multiline label with text following label - TeX - LaTeX Stack Exchange](https://tex.stackexchange.com/questions/323903/enumitem-multiline-label-with-text-following-label).
