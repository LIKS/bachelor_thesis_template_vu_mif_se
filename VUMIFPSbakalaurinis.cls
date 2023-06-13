%% VUMIFPSbakalaurinis.cls – „Tik svajotojai-romantikai gali pagerinti nepakeičiamą pasaulį“
%% Created by   „Atviras Kodas Lietuvai“  2015
%
%% Latest version available here: https://github.com/LIKS/bachelor_thesis_template_vu_mif_se
%% Any suggestions or contributions are welcome!  Also see: https://latex.liks.lt!
%
%% License CC BY 4.0 (see more at http://creativecommons.org/licenses/by/4.0/)
% You are free to (a) share - copy and redistribute the material in any medium
% or format (b) adapt - remix, transform, and build upon the material for any
% purpose, even commercially. As long as you give appropriate credit, provide a
% link to the license, and indicate if changes were made.


% Bakalauro baigiamojo darbo apiforminimas pagal Vilniaus universiteto
% Matematikos ir informatikos fakulteto Programų sistemų katedros reikalavimus
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{VUMIFPSbakalaurinis}[2023/06/13 1.7 VU MIF SE bachelor's thesis class]
\LoadClass[12pt, a4paper]{article}
\RequirePackage{LTPlius}  % Nustatymų sulietuvinimas

% Darbo kalba gali būti anglų
\DeclareOption{english}{%
    \def\@ThesisEng{}%
    \setmainlanguage{english}%
    \setotherlanguage{lithuanian}%
}
\ProcessOptions\relax

\RequirePackage{fontspec} % Šrifto pasirinkimui
% Teksto šriftas bus Palemonas.
% Naujos Palemono versijos talpinamos
% https://vlkk.lt/palemonas
\setmainfont[
    Path=fonts/Palemonas3.2.05/,
    Ligatures=TeX,
    Extension=.ttf,
    UprightFont=*-nm,
    BoldFont=*-bd,
    ItalicFont=*-it,
    BoldItalicFont=*-bi,
]{Palem3.2.05}

\RequirePackage{setspace} % Intervalas tarp eilučių
\RequirePackage[
    left=3cm,
    top=2cm,
    right=1.5cm,
    bottom=2cm,
    footskip=0.7cm,
]{geometry}  % Lapo paraštės
% Tolygiai paskirsto tekstą nuo kairės iki dešinės paraštės
% \sloppy alternatyva
\tolerance 1414
\hbadness 1414
\emergencystretch 1.5em
\hfuzz 0.3pt
\widowpenalty=10000
\vfuzz \hfuzz

\RequirePackage[titles]{tocloft} % Turinio eilučių išlygiavimo nustatymui
\RequirePackage{fancyhdr} % Puslapio numerio vietos nustatymui
\pagestyle{fancy}

% Nustatoma puslapio numerio vieta puslapyje
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhf{}
\fancyfoot[R]{\thepage} % Numeris bus puslapio apačioje dešinėje

\RequirePackage{caption}

% Informacijos tituliniame puslapyje kintamieji
\newcommand{\university}[1]{\def\@university{#1}}
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\papertype}[1]{\def\@papertype{#1}}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\reviewer}[1]{\def\@reviewer{#1}}
\newcommand{\titleineng}[1]{\def\@titleineng{#1}}
\newcommand{\secondauthor}[1]{\def\@secondauthor{#1}}
\newcommand{\addsignatureplaces}{\def\@addsignatureplaces}

% Pirma pastraipos eilutė atitraukiama 1 cm
\setlength{\parindent}{1cm}

% Nustatomas bibliografijos stilius
\RequirePackage[
    alldates=iso,
    seconds=true,
    % Iš publikavimo datos rodomi tik metai
    date=year,
    % pakeičiame žodžių skaidymą skiemenimis, kai langid nėra lithuanian
    autolang=hyphen,
    backend=biber,
    eprint=false,
    sortcites=true,
    sorting=anyt,
    giveninits=true,
    style=iso-alphabetic,
    abbreviate=false,
    minalphanames=3,
    maxalphanames=3,
    maxnames=9,
    minnames=4,
]{biblatex}

\DefineBibliographyStrings{lithuanian}{%
    % Literatūros sąrašas.
    references = {Šaltiniai},
    in = {iš},
    % Terminai, vartojami biblatex-iso690 bibliografijos stiliuje.
    % Žr. https://github.com/michal-h21/biblatex-iso690/wiki/Translation-Guideline
    urlalso = {prieiga per internetą},
    urlfrom = {prieiga per internetą},
    urlseen = {žiūrėta},
    % Žr. https://terminai.vlkk.lt/konsultacijos/1986-on-line-prijungtas-prijungtis
    online = {internetinis},
}

% Pliuso ženklas, kuris rodomas esant >3 autoriams, sumažinamas ir pakeliamas
\renewcommand*{\labelalphaothers}{\textsuperscript{+}}


% Biblatex-iso690 pakeitimai

% DOI laukas turėtų spausdinti pilną URL, ne tik identifikatorių. Pakeista iš
% https://github.com/michal-h21/biblatex-iso690/blob/7ae03dbdff1f187cfead57c5108a73a6b5021f68/iso.bbx#L377
\DeclareFieldFormat{doi}{\addcolon\space\url{https://doi.org/#1}}

% Autorius rašomas kaip Vardas Pavardė, ne Pavardė, Vardas
\DeclareNameAlias{default}{given-family}
% Skirtukai tarp autorių padaromi kableliais
\DeclareDelimFormat{multinamedelim}{\addcomma\space}
\DeclareDelimFormat{finalnamedelim}{\addcomma\space}
% Nepaverčiame pavardžių didžiosiomis raidėmis
\renewcommand{\familynameformat}[1]{#1}

% Padarome, kad nepridėtų [internetinis] prie šaltinių, turinčių
% url lauką. Nukopijuota ir pakeista iš
% https://github.com/michal-h21/biblatex-iso690/blob/7ae03dbdff1f187cfead57c5108a73a6b5021f68/iso.bbx#L721-L750
\renewbibmacro*{medium-type}{%
  \iffieldundef{howpublished}{}% Don't print anything
    {\ifboolexpr{
        test {\iffieldequalstr{howpublished}{online}}
        and not test {\iftoggle{bbx:url}}
        and not test {\ifentrytype{online}}
      }
        {}% Don't print 'howpublished' field
        {\printfield{howpublished}}}%
}

% Nutildome įspėjimus dėl neegzistuojančių failų.
\usepackage{silence}
\WarningFilter{biblatex}{File 'american-iso.lbx' not found!}
\WarningFilter{biblatex}{File 'lithuanian-iso.lbx' not found!}


% TODO: pašalinti csquotes.cfg failą 2025 metais, nes csquotes
% paketas pridėjo lietuvišką kabučių stilių 2023-01-24, tad nebereikės
% specialios konfigūracijos, kai nauja versija bus plačiai prieinama
\RequirePackage[autostyle=true]{csquotes}

\RequirePackage[babel=true]{microtype}

% -------------------------------
% Titulinio puslapio formatavimas
% -------------------------------
\newcommand{\@signatureplace}{%
    % Jeigu nenorima įdėti vietų parašams,
    % teksto išdėstymas neturėtų smarkiai keistis
    \@ifundefined{@addsignatureplaces}{\qquad}{%
        \parbox[t]{2.5cm}{%
            \makebox[2.5cm]{\raisebox{-0.9ex}{\scriptsize
                \@ifundefined{@ThesisEng}{(parašas)}{(signature)}%
                }}%
        }}
}

\newcommand{\checkifdefined}[2]{%
    % Patikriname, ar visa reikalinga informacija tituliniam puslapiui
    % buvo nurodyta. #1 yra tikrinama reikšmė (be \ priekyje),
    % #2 - klaidos pranešimas.
    \@ifundefined{#1}{\ClassError{VUMIF}{#2}{Add the missing command}}%
}

\renewcommand\maketitle{\begin{titlepage}%
  \checkifdefined{@university}%
    {Tituliniame puslapyje nenurodytas universitetas (komanda \protect\university)}
  \checkifdefined{@faculty}%
    {Tituliniame puslapyje nenurodytas fakultetas (komanda \protect\faculty)}
  \checkifdefined{@department}%
    {Tituliniame puslapyje nenurodyta studijų programa (komanda \protect\department)}
  \checkifdefined{@papertype}%
    {Tituliniame puslapyje nenurodytas darbo tipas (komanda \protect\papertype)}
  \checkifdefined{@supervisor}%
    {Tituliniame puslapyje nenurodytas darbo vadovas (komanda \protect\supervisor)}
  \checkifdefined{@reviewer}%
    {Tituliniame puslapyje nenurodytas darbo recenzentas (komanda \protect\reviewer)}
  ~
  \begin{center}
      {\setstretch{1.3}\large \MakeUppercase{\@university} \\
         \MakeUppercase{\@faculty} \\
         \MakeUppercase{\@department}\par }

     \null\vfil
     \vskip 3cm
    \@ifundefined{@ThesisEng}{%
        {\singlespacing \LARGE \textbf{\@title} \par}
        {\singlespacing \Large \textbf{\textenglish{\@titleineng}} \par}%
    }{%
        {\singlespacing \LARGE \textbf{\@titleineng} \par}%
        {\singlespacing \Large \textbf{\textlithuanian{\@title}} \par}
    }%
     \vskip 0.8cm
     {\large \@papertype}%
  \end{center}
  \@ifundefined{@secondauthor}{
     \vskip 3cm
     \begin{flushright}
        \large
        \singlespacing
        {\begin{tabular}[t]{l l}%
        \@ifundefined{@ThesisEng}{%
            \bigskip Atliko: &\; \@author \hfill \@signatureplace \\
            \bigskip Darbo vadovas: &\; \@supervisor \hfill \@signatureplace \\
            Darbo recenzentas: &\; \@reviewer \hfill \@signatureplace
        }{%
            \bigskip Author: &\; \@author \hfill \@signatureplace \\
            \bigskip Supervisor: &\; \@supervisor \hfill \@signatureplace \\
            Reviewer: &\; \@reviewer \hfill \@signatureplace
        }%
        \end{tabular} \par}%
     \end{flushright}
  }{
     \vskip 2.8cm
     \begin{flushright}
        \large
        \singlespacing
        {\begin{tabular}[t]{l l}%
        \@ifundefined{@ThesisEng}{%
            \bigskip Atliko: &\; \@author \hfill \@signatureplace \\
            \bigskip &\; \@secondauthor \hfill \@signatureplace \\
            \bigskip Darbo vadovas: &\; \@supervisor \hfill \@signatureplace \\
            Darbo recenzentas: &\; \@reviewer \hfill \@signatureplace
        }{%
            \bigskip Author: &\; \@author \hfill \@signatureplace \\
            \bigskip &\; \@secondauthor \hfill \@signatureplace \\
            \bigskip Supervisor: &\; \@supervisor \hfill \@signatureplace \\
            Reviewer: &\; \@reviewer \hfill \@signatureplace
        }%
        \end{tabular} \par}%
     \end{flushright}
  }
  \vfill
  \begin{center}
    \large\@date%
  \end{center}
  \vskip 0.4cm
  \@thanks
  \end{titlepage}%
  % Tolesni puslapiai numeruojami nuo antro
  \setcounter{page}{2}%
  % Atlaisviname panaudotus kintamuosius
  \global\let\@outputtitle\relax
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@papertype\@empty
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@university\@empty
  \global\let\@faculty\@empty
  \global\let\@department\@empty
  \global\let\@institute\@empty
  \global\let\@papertype\@empty
  \global\let\@supervisor\@empty
  \global\let\@reviewer\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\department\relax
  \global\let\supervisor\relax
  \global\let\@signatureplace\relax
  \global\let\checkifdefined\relax
  \setcounter{footnote}{0}%
  % Nustatome dokumentui 1,5 tarpo tarp eilučių intervalą
  \onehalfspacing
}

% Skyriaus pavadinimas, turinyje neturintis numerio
\newcommand{\sectionnonum}[1]{%
    \section*{#1}%
    \addcontentsline{toc}{section}{#1}%
}

% Skyriaus pavadinimas, neturintis numerio bei neįeinantis į turinį
\newcommand{\sectionnonumnocontent}[1]{%
    \section*{#1}%
    \sectionbookmark{#1}% Sukuriame PDF nuorodą
}

\renewcommand\tableofcontents{%
    % Turinys su viengubu intervalu tarp eilučių
    \sectionnonumnocontent{\contentsname
        \@mkboth{%
            \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \begin{singlespacing}%
        \@starttoc{toc}%
    \end{singlespacing}%
    \newpage%
}

% Tarpai tarp taškų turinyje
\renewcommand{\@dotsep}{1}

% Pakeitimai sekcijos eilutėms turinyje:
% 1. Turinyje turi taškai bėgti ir iki sekcijų
% 2. Nėra vertikalaus tarpo prieš sekcijos turinio eilutę
% 3. Ne pusstoris, o paprastas šriftas
\renewcommand\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{0.6em \@plus\p@}
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      % Skyrių pavadinimai paverčiami vien didžiosiomis raidėmis
      \MakeUppercase{#1}\nobreak\
      \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}
     \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}


% Sekcija (skyrius) pradeda naują puslapį
\renewcommand{\section}{%
    \cleardoublepage%
    \@startsection{section}{1}{\z@}%
        {-3.5ex \@plus -1ex \@minus -.2ex}%
        {2.3ex \@plus.2ex}%
        {\normalfont\Large\bfseries}%
}

% Priedų formatavimas
\renewcommand{\appendix}{%
    \@ifundefined{@firstappendix}{%
        \newcommand{\@firstappendix}{}%
        \newcounter{appendixcounter}%
        \@ifundefined{@ThesisEng}{%
            \sectionnonum{Priedai}%
            \newcommand{\@appendix}{nr. \arabic{appendixcounter}}%
        }{%
            \sectionnonum{Appendixes}%
            \newcommand{\@appendix}{\arabic{appendixcounter}}%
        }%
    }{%
        \cleardoublepage%
    }%
    \secdef\@Appendix\@sAppendix%
}

\def\@Appendix[#1]#2{%
    \refstepcounter{appendixcounter}%
    \@ifundefined{@ThesisEng}{%
        \addcontentsline{toc}{subsection}%
            {\arabic{appendixcounter} priedas.~#2}%
    }{%
        \addcontentsline{toc}{subsection}%
            {\appendixname\ \arabic{appendixcounter}.~#2}%
    }%
    {\large\bfseries\appendixname\ \@appendix\par
     #2\par}% \nohyphens\centering#2\par}%
    \sectionmark{#1}\vspace{\baselineskip}%
    \footnotesize%
}

\def\@sAppendix#1{%
    {\flushright\large\bfseries\appendixname\par
     \centering#1\par}% \nohyphens\centering#1\par}%
    \vspace{\baselineskip}%
    \footnotesize
}

% Apibrėžiame ketvirto lygio skyrius
\newcommand{\subsubsubsection}{\subsubparagraph}

\renewcommand\subsubsubsection{\@startsection{paragraph}{4}{0ex}{-3.25ex plus -1ex minus
-0.2ex}{1.5ex plus 0.2ex}{\normalfont\normalsize\bfseries}}

\stepcounter{secnumdepth}
\stepcounter{tocdepth}
\renewcommand{\paragraph}{\subparagraph}

% Turinio skyrių indentavimo nustatymas. Kiekvienam skyriui nustatoma:
% 1. Atitraukimo iš kairės plotis
% 2. Vietos, skiriamos dalies numeriui, plotis
\renewcommand*\l@subsection{\@dottedtocline{2}{0.63cm}{0.87cm}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{1.33cm}{1.22cm}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{2.03cm}{1.52cm}}

% Raktinių žodžių komandos
\newcommand\keywords[1]{%
    \par \bigskip \par
    % \hangindent=\parindent   % Lygiavimas nuo antros eilutės
    \noindent \textenglish{\textbf{Keywords:}\; \textbf{#1}}
}
\newcommand\raktiniaizodziai[1]{%
    \par \bigskip \par
    % \hangindent=\parindent   % Lygiavimas nuo antros eilutės
    \noindent \textbf{Raktiniai žodžiai:}\; \textbf{#1}
}

% Padarome, kad išnašos visada būtų puslapio apačioje
\RequirePackage[bottom]{footmisc}
% Tarpai tarp išnašų eilučių nustatomi į 1,5 eilutės
\let\oldfootnote\footnote
\renewcommand{\footnote}[1]{\oldfootnote{\onehalfspacing #1}}
% Tarpai tarp išnašų nustatomi į tokius pačius kaip ir tarp išnašų eilučių
\setlength{\footnotesep}{11pt}

% Panaikiname dvigubus tarpus tarp sąrašo elementų,
% jų įtrauką suvienodiname su aplinkinio teksto įtrauka
\RequirePackage{enumitem}
\setlist{nosep, leftmargin=*}
% Pirmo lygio sąrašui pridedame tarpus iš viršaus ir apačios,
% jų įtrauką suvienodiname su pastraipos pirmos eilutės įtrauka
\setlist[1]{topsep=0.2cm, labelindent=\parindent}

% float paketas turi būti užkraunamas anksčiau nei hyperref
\RequirePackage{float}

% Nuorodos turinyje ir kitur padaromos aktyviomis
\RequirePackage[%
    hidelinks,
    linktoc=all,
    pdflang={\@ifundefined{@ThesisEng}{lt}{en-US}},
    bookmarksnumbered=true,
]{hyperref}

% Pataisymas, kad veiktų kompiliavimas su LuaLaTeX.
% TODO: galima pašalinti 2025 m., nes pataisymas jau yra
% naujausioje hyperref paketo versijoje:
% https://github.com/latex3/hyperref/issues/121
% Kompiliavimas su LuaLaTeX padaro, kad veiktų turinio skyrių nuorodos
% į puslapius (su XeLaTeX neveikia).
\RequirePackage{iftex}
\ifLuaTeX
  \let\ORG@hyper@linkstart\hyper@linkstart
  \protected\def\hyper@linkstart#1#2{%
    \lowercase{\ORG@hyper@linkstart{#1}{#2}}}
\fi

% Nustatomas PDF pavadinimas ir autorius
\AtBeginDocument{
    \hypersetup{%
        pdftitle = {\@title},
        pdfsubject = {\@papertype}
    }
    \@ifundefined{@secondauthor}{
        \hypersetup{pdfauthor = {\@author}}
    }{
        \hypersetup{pdfauthor = {\@author, \@secondauthor}}
    }
}

% Paimta iš https://tex.stackexchange.com/a/330535
\RequirePackage{bookmark}
\newcommand*{\sectionbookmark}[1][]{%
  \bookmark[%
    level=section,%
    dest=\@currentHref,%
    #1%
  ]%
}

% Algoritmai apjuosiami kraštine
\RequirePackage{algorithm}

% Sutvarkome lstlistings aplinką:
% 1. pakeičiame pavadinimą į pav. (neaišku, kaip kitaip pavadinti,
%    nes angliškas terminas „listing“ verčiamas kaip „sąrašas“)
% 2. pavadinimą dedame apačioje
% 3. apjuosiame kraštine
% 4. numeruojame taip pat kaip ir paveiksliukus
% https://tex.stackexchange.com/a/117538
\RequirePackage{listings}
\lstset{
    captionpos=b,
    frame=single,
    breaklines=true
}
\@ifundefined{@ThesisEng}{%
    % Teisingai formatuojame paveikslėlių antraštes.
    \captionsetup*[figure]{labelsep=space}

    \DeclareCaptionLabelFormat{alg}{#2 #1}
    \captionsetup*[algorithm]{name=algoritmas.,labelformat=alg,labelsep=space}
    \DeclareCaptionLabelFormat{listing}{#2 #1}
    \captionsetup*[lstlisting]{labelformat=listing, labelsep=space}
    \renewcommand\lstlistingname{pav.}
    % https://tex.stackexchange.com/questions/462810/use-same-reference-count-for-lstlisting-and-figure-graphics
    \AtBeginDocument[A]{\let\c@lstlisting\c@figure}
    % % https://tex.stackexchange.com/questions/422131/how-to-use-the-same-numbering-counter-for-figures-tables-and-listings
    \let\ftype@listings\ftype@figure
}{%
    \captionsetup*[figure]{labelsep=period}
}

% Komandos, skirtos pateikti angliškus terminų vertimus
% Be skliaustų.
\newcommand{\anglnb}[1]{angl.\ \textit{\textenglish{#1}}}
% Su skliaustais.
\newcommand{\angl}[1]{(\anglnb{#1})}
