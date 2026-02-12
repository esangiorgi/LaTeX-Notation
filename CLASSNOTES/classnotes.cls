
\ProvidesClass{classnotes}[2024/06/01 v1.0 Class Notes LaTeX Class]


\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}

\newcommand{\@titleimage}{}
% \newcommand{\titleimage}[1]{\renewcommand{\@titleimage}{#1}}
\newcommand{\@titleimageoptions}{width=0.4\textwidth} % Opzioni (default)

\NewDocumentCommand{\titleimage}{ O{width=0.4\textwidth} m }{
    \renewcommand{\@titleimageoptions}{#1}
    \renewcommand{\@titleimage}{#2}
}


\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{report}%
}
\ProcessOptions\relax


\LoadClass[twoside]{report}

\RequirePackage[
    a4paper,
    top=3cm,
    bottom=2.5cm,
    hmarginratio=1:1 % Forza il rapporto 1:1 tra i margini orizzontali
]{geometry}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[italian]{babel}
\RequirePackage{emptypage}
\RequirePackage{graphicx}
\RequirePackage[width=.8\textwidth]{caption}
\RequirePackage{pgfplots}\pgfplotsset{compat=1.18}
\RequirePackage{tikz,pgf} 
\RequirePackage[normalem]{ulem}
\RequirePackage{acronym}
\RequirePackage{xcolor}
\RequirePackage{colortbl}
\RequirePackage[most]{tcolorbox}
\RequirePackage{array}
\RequirePackage{hhline}
\RequirePackage{multirow}
\RequirePackage[inline]{enumitem}
\RequirePackage{float} % per [H]
\RequirePackage{fancyhdr}
\RequirePackage{amsthm}   % - Per \theoremstyle
\RequirePackage{hyperref} % - Per mettere link 
\RequirePackage{setspace} % Per l'interlinea
\RequirePackage{etoolbox}
% \RequirePackage{parskip}


% === Definizione Colori === 
\definecolor{blueviolet}{rgb}{0.54, 0.17, 0.89}
\definecolor{cadmiumorange}{rgb}{0.93, 0.53, 0.18}
\definecolor{dark gray}{rgb}{0.35, 0.35, 0.35}
\definecolor{ao(english)}{rgb}{0.0, 0.5, 0.0}
\definecolor{blue-green}{rgb}{0.0, 0.87, 0.87}
\definecolor{ballblue}{rgb}{0.13, 0.67, 0.8}
\definecolor{azure(colorwheel)}{rgb}{0.0, 0.5, 1.0}
\definecolor{aquamarine}{rgb}{0.5, 1.0, 0.83}
\definecolor{aqua}{rgb}{0.0, 1.0, 1.0}
\definecolor{ao}{rgb}{0.0, 0.0, 1.0}
\definecolor{aureolin}{rgb}{0.99, 0.93, 0.0}
\definecolor{arylideyellow}{rgb}{0.91, 0.84, 0.42}
\definecolor{atomictangerine}{rgb}{1.0, 0.6, 0.4}
\definecolor{amber(sae/ece)}{rgb}{1.0, 0.49, 0.0}
\definecolor{amber}{rgb}{1.0, 0.75, 0.0}
\definecolor{amaranth}{rgb}{0.9, 0.17, 0.31}
\definecolor{brightgreen}{rgb}{0.4, 1.0, 0.0}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}
\definecolor{brightpink}{rgb}{1.0, 0.0, 0.5}
\definecolor{citrine}{rgb}{0.89, 0.82, 0.04}
\definecolor{azure(colorwheel)}{rgb}{0.0, 0.5, 1.0}

\colorlet{blueline}{blue!50!black!90}
\colorlet{redline}{red!50!black!90}
\colorlet{greenline}{green!50!black!90}





% === Setup del documento ===
\onehalfspacing
\raggedbottom

\hypersetup{                             % Opzioni di 
    colorlinks=true,                     % Visuazlizzazione 
    linkcolor=black, % Colore indice     % Link
    filecolor=magenta,   
    urlcolor=cyan, % Colore Link Url
    pdftitle={},
    pdfpagemode=FullScreen,
    }
\pagestyle{fancy}
\fancyhf{} % Pulisce tutti i campi (header e footer)

% --- 1. Gestione del Nome Capitolo (No tutto maiuscolo) ---
\renewcommand{\chaptermark}[1]{\markboth{\thechapter\quad #1}{}}

% --- 2. Intestazione (Header) ---
\fancyhead[LE]{ \leftmark}
\fancyhead[LO]{\@author}
\fancyhead[RO]{\@title}

% --- 3. Piè di pagina (Footer) ---
% Numero di pagina in basso al centro (come di default)
\fancyfoot[C]{\thepage}

% --- 4. Linea Blu dell'intestazione ---
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\headrule}{%
  {\hrule width\headwidth height\headrulewidth \vskip-\headrulewidth}%
}

% --- 5. Rimuovere la linea del piè di pagina (opzionale, di solito è 0pt) ---
\renewcommand{\footrulewidth}{0pt}

% Spazio extra per l'intestazione
\setlength{\headheight}{15pt}






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% AMBIENTI                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %% dimostrazione
% \thmboxoptions{                 % Ridefinisce lo stile 
% titlestyle={ $\quad$#1},        % thmbox con i font che
% bodystyle=\normalfont,}         % desideriamo, vedi documentazione

% \declaretheorem[
%     thmbox=M,
%     name=Dimostrazione,
%     numberwithin=chapter
% ]{dm}


\newtheorem{teorema}{Teorema}[chapter]

\theoremstyle{definition}
\newtheorem{definizione}{Definizione}[chapter]

\theoremstyle{remark}
\newtheorem*{ricordo}{Ricordo}


%% Nota
\newtcolorbox{nota}[1][]{
    breakable,
    enhanced,
    colframe=blue!40!black!60,
    boxrule=0.5pt,
    colback=cyan!18,
    left=0.5em,
    right=0.5em,
    top=0.2em,
    bottom=0.2em,
    fontupper=\small,
    before upper={\textbf{Nota\ifstrempty{#1}{}{ (#1)}}:\;},
    drop shadow={black!30!white}
}



%% ndr
\newenvironment{ndr}{
    [\textbf{ndr}: \slshape \hspace{-1.1em}    
}{
    \normalfont \hspace{-0.8em}].
}


\tcbset{
    commonstyle/.style={
        enhanced, breakable,
        arc=3pt, boxrule=0.8pt,
        drop shadow={black!30!white}, % Ombra più discreta e professionale
        fonttitle=\bfseries,
        attach boxed title to top left={xshift=3mm, yshift=-3mm, yshifttext=-1mm},
        boxed title style={boxrule=0.5pt},
        before skip=1.5em, after skip=1.5em
    }
}

% ESEMPIO (Blu)
\newtcolorbox[auto counter, number within=chapter]{esempio}[2][]{
    commonstyle,
    colback=gray!5, colframe=gray,
    colbacktitle=gray,
    title={Esempio \thetcbcounter\ifstrempty{#2}{}{: #2}}, #1
}

% APPROFONDIMENTO (Ambr)
\newtcolorbox[auto counter, number within=chapter]{appr}[2][]{
    commonstyle,
    colback=amber!5, colframe=amber!80!black,
    colbacktitle=orange!80!black,
    title={Approfondimento \thetcbcounter\ifstrempty{#2}{}{: #2}}, #1
}

% RIASSUNTO (Viola)
\newtcolorbox{riassunto}[2][]{
    commonstyle,
    colback=purple!5, colframe=purple!70!black,
    colbacktitle=purple!70!black,
    title={Riassunto\ifstrempty{#2}{}{: #2}}, #1
}

% CUSTOMBOX 
\newtcolorbox{custombox}[2][]{
    commonstyle,
    colback=blueline!5, colframe=blueline,
    colbacktitle=blueline,
    title={#2},
    #1
}


\NewDocumentCommand{\HRule}{}{\rule{\linewidth}{0.5mm}} 

\newlength{\linemargin}
\setlength{\linemargin}{1.3cm}
\RenewDocumentCommand{\maketitle}{}{
    \begin{titlepage}
        % === Stile cornice ===
        \begin{tikzpicture}[remember picture, overlay]
            % Cornice esterna (sottile)
            \draw[line width=0.5pt, color=blueline, rounded corners=0.5cm] 
                ([xshift=\linemargin, yshift=-\linemargin]current page.north west) 
                rectangle 
                ([xshift=-\linemargin, yshift=\linemargin]current page.south east);
                
            % Cornice interna (più spessa)
            % Usiamo \dimexpr per aggiungere 0.2cm alla variabile senza modificarla globalmente
            \draw[line width=2pt, color=blueline, rounded corners=0.25cm] 
                ([xshift=\dimexpr\linemargin+0.2cm\relax, yshift=-\dimexpr\linemargin+0.2cm\relax]current page.north west) 
                rectangle 
                ([xshift=-\dimexpr\linemargin+0.2cm\relax, yshift=\dimexpr\linemargin+0.2cm\relax]current page.south east);
        \end{tikzpicture}

        % === Copertina ===
        \centering
        \vspace*{2cm} % Aumentato leggermente lo spazio iniziale

        % Blocco Titolo Simmetrico
        {\color{blueline}\rule{0.8\linewidth}{2pt}}\\[0.8cm] % Spazio sopra
        {\Huge \bfseries \@title }\\[0.5cm]      % Spazio sotto (identico)
        {\color{blueline}\rule{0.8\linewidth}{2pt}}
        
        \vspace{2cm} % Più spazio dopo il titolo per farlo "respirare"
        
        {\large\textsl{Redatti da}}\\[0.8cm] % Aumentato spazio
        {\Large \@author}
        % {\Large Anna Rossato}
        
        \vfill
        \ifdefempty{\@titleimage}
        {
            \vfill
        }
        {
            \IfFileExists{\@titleimage}
            {
                %Il file esiste -> Lo mostro
                \begin{center}
                    % \includegraphics[\@titleimageoptions]{\@titleimage}
                    \expandafter\includegraphics\expandafter[\@titleimageoptions]{\@titleimage}
                \end{center}
                \vspace*{1.5cm}
            }
            {
                %Il file NON esiste -> Avviso nel log e metto un box di "errore"
                \ClassWarning{classnotes}{Immagine '\@titleimage' non trovata! Controlla il percorso.}
                \begin{center}
                    % Disegno un rettangolo rosso con una X per evidenziare il problema visivamente
                    \begin{tikzpicture}
                        \draw[red, thick] (0,0) rectangle (4,3);
                        \node[red] at (2,1.5) {Img non trovata};
                    \end{tikzpicture}
                \end{center}
                \vspace*{1.5cm}
            }
        }
        \vfill
        {\large \the\year{} \par}
        \vspace{1cm} 
        \cleardoublepage
    \end{titlepage}
}