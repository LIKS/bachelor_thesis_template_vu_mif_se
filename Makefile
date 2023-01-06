generuoti:
	xelatex bakalaurinis.tex
	biber bakalaurinis
	xelatex bakalaurinis.tex
	open bakalaurinis.pdf || xdg-open bakalaurinis.pdf

ubuntu:
	echo "Diegiamas LaTeX (PdfLaTeX, XeTeX ir kt.)"
	sudo apt-get install texlive-full
	echo "Diegiama literatūros sąrašo tvarkyklė Biber skirta BibLaTeX paketui"
	sudo apt-get install biber

clean:
	git clean -dfx
