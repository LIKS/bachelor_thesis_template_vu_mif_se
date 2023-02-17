# Vilniaus universiteto Programų sistemų bakalauro darbo LaTeX šablonas

## Pasiruošimas

Šablonas naudoja:  
- `latexmk` kompiliavimo paleidimui  
- `lualatex` PDF generavimui  
- `biblatex` ir `biber` bibliografijos tvarkymui  

Pagrindinis šriftas yra [Palemonas](https://vlkk.lt/palemonas).

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
- `make pdf`  
- `latexmk -lualatex -halt-on-error bakalaurinis.tex` (ta pati komanda, kurią įvykdo kiti du variantai)

### Windows

Įvykdyti `latexmk -lualatex -halt-on-error bakalaurinis.tex`.

## Kitos naudingos komandos

### Linux / macOS

- dokumento žodžių skaičius (apytikslis): `make wordcount`  
- paprastų klaidų patikrinimas (pastaba: praneša apie daugybę dalykų, iš kurių nebūtinai visi aktualūs): `make check`  
- nereikalingų failų išvalymas: `make clean`
