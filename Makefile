
generuoti:
	pdflatex bachelor.tex
	bibtex bachelor
	pdflatex bachelor.tex
	pdflatex bachelor.tex
	open bachelor.pdf || xdg-open bachelor.pdf
