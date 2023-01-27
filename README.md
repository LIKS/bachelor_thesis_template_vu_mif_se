# Vilniaus universiteto Programų sistemų bakalauro darbo LaTeX šablonas

## Pasiruošimas

Šablonas naudoja:  
- `latexmk` kompiliavimo paleidimui  
- `lualatex` PDF generavimui  
- `biblatex` ir `biber` bibliografijos tvarkymui  

### Linux

Instaliuoti Tex Live.

#### Ubuntu

Užtenka įvydyti `make ubuntu` šio projekto direktorijoje.

### Overleaf

Reikia pakeisti kompiliatorių į LuaLaTeX, žr.: https://www.overleaf.com/learn/how-to/Changing_compiler.

### Windows

Instaliuoti vieną iš:  
- [Tex Live](https://tug.org/texlive/windows.html)  
- [MikTex](https://miktex.org/download), jam reikia papildomai įrašyti `biber`

### macOS

Instaliuoti [MacTex](https://tug.org/mactex).

## PDF generavimas

### Linux / macOS

Įvykdyti vieną iš:  
- `make`  
- `make generuoti`  
- `latexmk -lualatex bakalaurinis.tex` (ta pati komanda, kurią įvykdo kiti du variantai)

### Windows

Įvykdyti `latexmk -lualatex bakalaurinis.tex`.
