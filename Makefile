NAME:=bakalaurinis
TEX_NAME:=$(NAME).tex
PDF_NAME:=$(NAME).pdf

LATEXMK_BASE_FLAGS:=--lualatex --file-line-error --halt-on-error --Werror

.PHONY: pdf ubuntu wordcount check clean

pdf:
	latexmk $(LATEXMK_BASE_FLAGS) $(TEX_NAME)
	open $(PDF_NAME) || xdg-open $(PDF_NAME)

watch:
	latexmk $(LATEXMK_BASE_FLAGS) --pvc --view=none $(TEX_NAME) 

ubuntu:
	@echo "Diegiamas LaTeX (LuaTeX, XeTeX ir kt.)"
	sudo apt-get install texlive-full

wordcount:
	texcount -total -utf8 $(TEX_NAME)

check:
	chktex $(TEX_NAME)

clean:
	git clean -dfX
