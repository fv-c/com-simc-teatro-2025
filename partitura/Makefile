LY = /Users/master/Documents/lilypond-2.24.3/bin/lilypond
LIBDIR = ../fv-lib-lilypond/
RELDIR = release
DATE = $(shell date +"%Y-%m-%-d-%H-%M")

score:
	mkdir -p release
	$(LY) -dno-point-and-click --include=$(LIBDIR) --output=$(RELDIR)/$(DATE)-nosebleed-score partitura.ly

guitar:
	mkdir -p release
	$(LY) -dno-point-and-click -e "(define-public part 'guitar)" --include=$(LIBDIR) --output=$(RELDIR)/$(DATE)-nosebleed-guitar parte.ly

parts:
	make guitar

all:
	make score && make parts