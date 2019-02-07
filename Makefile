MAIN=bakalaurinis
BIBL=bibliografija

all: view

$(MAIN).pdf: $(MAIN).tex $(MAIN).aux $(MAIN).bbl
	xelatex $<

$(MAIN).aux: $(MAIN).tex
	xelatex $<

$(MAIN).bbl: $(BIBL).bib
	biber $(MAIN)

view: $(MAIN).pdf
	open bakalaurinis.pdf || xdg-open bakalaurinis.pdf

clean:
	git clean -dfx

ubuntu:
	@echo "Diegiamas LaTeX (PdfLaTeX, XeTeX ir kt.)"
	sudo apt-get install texlive-full
	@echo "Diegiama literatūros sąrašo tvarkyklė Biber skirta BibLaTeX paketui"
	sudo apt-get install biber
	@echo "Diegiami OpenType šriftai"
	sudo apt-get install fonts-texgyre
	@echo "Diegiamas Palemonas šriftas į sistemą"
	sudo cp -r Palemonas-2.1 /usr/share/fonts/truetype/

.PHONY: all view clean ubuntu

