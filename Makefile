NAME:=bakalaurinis
TEX_NAME:=$(NAME).tex
PDF_NAME:=$(NAME).pdf

.PHONY: pdf ubuntu wordcount check clean

pdf:
	latexmk --lualatex --file-line-error --halt-on-error $(TEX_NAME)
	open kursinis.pdf || xdg-open $(PDF_NAME)

ubuntu:
	@echo "Diegiamas LaTeX (LuaTeX, XeTeX ir kt.)"
	sudo apt-get install texlive-full

wordcount:
	texcount -total -utf8 $(TEX_NAME)

check:
	chktex $(TEX_NAME)

clean:
	git clean -dfX
