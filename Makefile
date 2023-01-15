generuoti:
	latexmk -xelatex bakalaurinis.tex
	open kursinis.pdf || xdg-open bakalaurinis.pdf

ubuntu:
	echo "Diegiamas LaTeX (PdfLaTeX, XeTeX ir kt.)"
	sudo apt-get install texlive-full
	echo "Diegiama literatūros sąrašo tvarkyklė Biber skirta BibLaTeX paketui"
	sudo apt-get install biber

wordcount:
	texcount -total -utf8 bakalaurinis.tex

clean:
	git clean -dfx
