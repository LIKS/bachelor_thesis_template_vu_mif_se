generuoti:
	latexmk -lualatex bakalaurinis.tex
	open kursinis.pdf || xdg-open bakalaurinis.pdf

ubuntu:
	@echo "Diegiamas LaTeX (LuaTeX, XeTeX ir kt.)"
	sudo apt-get install texlive-full
	@echo "Diegiama literatūros sąrašo tvarkyklė Biber skirta BibLaTeX paketui"
	sudo apt-get install biber

wordcount:
	texcount -total -utf8 bakalaurinis.tex

check:
	chktex bakalaurinis.tex

clean:
	git clean -dfx
