% MSU Ph.D Dissertation class file
% Copyright by Clifford E. Weil and MSU Board of Trustees 2017
% This file must not to alter or distributed.
% New users should download the latest distribution from
% http://www.math.msu.edu/~weil/MSU_Ph.D._Dissertation.zip

% Report bugs to Clifford Weil (weil@math.msu.edu).
% Latest revision January 23, 2017
% This version handles appendices as required in the Formatting Guide of 2/2016.

%Updated by Hank Thurston March 28, 2023 to comply
%with new MSU/Proquest formatting guidelines.

% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{msuphddissertation}

% Bring in the regular book class
\LoadClass[12pt,oneside]{book}
	
% Bring in needed packages
\RequirePackage{ifthen}
\RequirePackage{setspace}
\RequirePackage[titles,subfigure]{tocloft}
%\RequirePackage[margin=1in]{geometry}
\usepackage[margin=1in,includehead, headheight=0pt, headsep=0pt]{geometry}
\RequirePackage{pdflscape}
\RequirePackage{titlesec}

%this command formats chapter titles
%\newcommand{\FormatChapterTitles}{\titleformat{\chapter}[block]{\vspace*{.15in}\bfseries\fontsize{22pt}{22pt}\selectfont}{\chaptertitlename~\thechapter.}{10pt}{}}
\newcommand{\FormatChapterTitles}{
	\titleformat{\chapter}[block]{
		\vspace*{0.17in}\bfseries\fontsize{22pt}{22pt}\selectfont
	}{\chaptertitlename~\thechapter.}{
		10pt
	}{}
%	[\vspace*{-1\baselineskip}]
}

%This command formats Appendix titles
\newcommand{\FormatAppTitles}{\titleformat{\chapter}[block]{\vspace*{.325in}\filcenter\bfseries\fontsize{12pt}{12pt}\selectfont}{\chaptertitlename~\thechapter.\negthickspace \negthickspace \negthickspace \negthickspace \negthickspace \negthickspace \negthickspace}{10pt}{}}


\AtBeginDocument{\@ifpackageloaded{hyperref}
{\newcommand{\tocentry}[2]{\addcontentsline{toc}{chapter}{\texorpdfstring{#1}{#2}}}}
{\newcommand{\tocentry}[2]{\addcontentsline{toc}{chapter}{#1}}}}

% Change the definition of \bibname to all Caps.
\renewcommand{\bibname}{BIBLIOGRAPHY}
\newcommand{\bibnamelc}{Bibliography}
\newcommand{\WorksCited}{WORKS CITED}
\newcommand{\LiteratureCited}{LITERATURE CITED}
\newcommand{\References}{REFERENCES}

\ifthenelse{\equal{\bibname}{\WorksCited}}
{\renewcommand{\bibnamelc}{Works Cited}}{\relax}

\ifthenelse{\equal{\bibname}{\LiteratureCited}}
{\renewcommand{\bibnamelc}{Literature Cited}}{\relax}

\ifthenelse{\equal{\bibname}{\References}}
{\renewcommand{\bibnamelc}{References}}{\relax}

\newcommand{\chapname}{Chapter}
\newcommand\covername{APPENDIX}
\renewcommand{\appendixname}{APPENDIX}

% Change to double spacing as defined by MS Word
% Redefine the \doublspacing command
\renewcommand{\doublespacing}{%
	\setstretch {1.9}%  default
	\ifcase \@ptsize \relax % 10pt
	\setstretch {1.9}%
	\or % 11pt
	\setstretch {1.9}%
	\or % 12pt
	\setstretch {1.9}%
	\fi
}

% Number all levels of document divisions
\setcounter{secnumdepth}{6}

% Set depth of table of contents
\setcounter{tocdepth}{6}

% Set second level of sub(super) scripts to 10 pt.
% Thanks to Lee Larson for this fix.
\DeclareMathSizes{12}{12}{10}{10}
\DeclareMathSizes{10}{10}{10}{10}
% Set footnote font size to 12pt.

% Define the command \unit 
\newcommand*{\unit}[1]{\def\fromunit{#1}}

%Define the Title Page
\newcommand\maketitlepage
	{\begin{titlepage}%
	\vspace*{.6in} %modified HMT 2023
	%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\vspace*{-0.2\baselineskip}
	%%%%%%%%%%%%%%%%%%%%%%%%%%%
	\begin{center}%
	\begin{singlespace}
	\MakeUppercase{\@title} %Removed \large{} to comply with sizing requirements HMT 2023
\vspace{4.5\baselineskip}
	\end{singlespace}
        \begin{doublespace}
        \vspace{0.6\baselineskip}
          By % DO NOT REMOVE THE FOLLOWING BLANK LINE
		\vspace{0.17\baselineskip}
		
\vspace{.25\baselineskip}  %Added for spacing compliance HMT 2023
	\begin{tabular}[t]{c}%
	\@author
	\end{tabular}%
	\end{doublespace}
	%\vspace{\fill}
\vspace{13\baselineskip}  %Added for spacing compliance HMT 2023
	{%
	\vspace{-0.5\baselineskip}
	A  DISSERTATION 
	\vspace{1.8\baselineskip}%  %Added for spacing compliance HMT 2023

	Submitted to \\
	Michigan State University \\
	in partial fulfillment of the requirements \\
	for the degree of 
   
	\vspace{0.75\baselineskip}%
	\fromunit % Inserts unit name and degree type%
  
	\vspace{0.85\baselineskip}%  %Added for spacing compliance HMT 2023
	{\number\year}  
	} 
	\vspace{\baselineskip}
	\end{center}
\end{titlepage}}%
 
% Define the command \abstractname
 \newcommand{\abstractname}{\textbf{ABSTRACT}}
 
%Define the abstract environment for the dissertation
  \newenvironment{abstract}{%
	\thispagestyle{empty}
	\pagenumbering{roman}
         \begin{center}%
         \abstractname\vspace{\baselineskip}
         \end{center}
          \vspace*{-2\baselineskip}
         \begin{doublespace}
         \addtocounter{page}{1}
         } 
         {\end{doublespace}\pagestyle{empty}\newpage}

% Define the command \pubabstractname
 \newcommand{\pubabstractname}{\textbf{PUBLIC ABSTRACT}}
 
%Define the pubabstract environment for the dissertation
\newcounter{pubabs}
\newenvironment{pubabstract}{%
	\setcounter{pubabs}{\value{page}}
	\thispagestyle{empty}
	\pagenumbering{roman}
         \begin{center}%
         {\bfseries\pubabstractname}
         
         \vspace{\baselineskip}
         
         \MakeUppercase{\@title}% DO NOT REMOVE THE FOLLOWING BLANK LINE
        
         \vspace{\baselineskip}% DO NOT REMOVE THE FOLLOWING BLANK LINE
       
         By 
	\vspace{\baselineskip}
	      
	\begin{tabular}[t]{c}%
         \@author
         \end{tabular}
         \end{center}
         \vspace*{-.5\baselineskip}
          
     	\begin{doublespace}
	} 
{\end{doublespace}\newpage\setcounter{page}{\value{pubabs}}
	}
   
% Define the Copyright Page
      \newenvironment{copyrt}{%
      \newpage
      \thispagestyle{empty}
      \vspace*{\fill}
      \begin{center}
      \begin{tabular}{l}
      Copyright by\\
      \MakeUppercase{\@author}\\
      \number\year
      \end{tabular}
      \end{center}\vfill}
     {\newpage}
     
% Define the Dedication Page
\newenvironment{dedication}{%
	\centering
	\newpage
	\thispagestyle{plain}
	\pagestyle{plain}
	\vspace*{\fill}}
	{
\vfill}
             
% Define the Acknowledgement Page
\newcommand{\ackname}{ACKNOWLEDGMENTS}
\newenvironment{acknowledgment}{%
	\newpage
	\thispagestyle{plain}
	\pagestyle{plain}
	\begin{center}
	{\bfseries\ackname}
	\vspace{-\baselineskip}
	\end{center}
%    \vspace*{-2\baselineskip}
	\begin{doublespace}
	}
	{\end{doublespace}\thispagestyle{plain}
\pagestyle{plain}}
     
% Define the Preface Page
\newcommand{\prefname}{PREFACE}
\newenvironment{preface}{%
     	\newpage
      	\thispagestyle{plain}
      	\pagestyle{plain}
       	\begin{center}
     	{\bfseries\prefname}
    	\vspace{-1\baselineskip}
     	\end{center}
	\begin{doublespace}
	}
     	{\thispagestyle{plain}
	\end{doublespace}
\pagestyle{plain}}

% Redefine the \@chapter command to put "Chapter" 
% before each chapter entry in the ToC and to put
% "Appendix" before each appendix entry in the ToC.
% Replaced \chaptername by \@chapapp 7-26-12

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
		\if@mainmatter
	\refstepcounter{chapter}%
	\vspace*{-3.6\baselineskip}
	\typeout{\@chapapp\space\thechapter.}%
		\ifx\chaptername\chapname
		\tocentry{\protect\numberline{\@chapapp\space\thechapter.}\negthickspace\negthickspace#1}
		{\@chapapp\space\thechapter #1}%
		\else	
		\ifx\covername\appendixname%						
 		\else%										
			\addcontentsline{toc}{section}%				
    	{{\@chapapp\space\thechapter\space}#1}					
	\fi							 				
				\fi%
		 \else
          \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \else
          \addcontentsline{toc}{chapter}{#1}%
                    \fi
           \chaptermark{#1}%

% Standard practice calls for a little extra space in the LoF and LoT 
% between the last entry in the current chapter and the first entry of 
% the next chapter. To include this extra space, remove the "%" signs 
% in front of the following two lines. 
           %\addtocontents{lof}{\protect\addvspace{10\p@}}%
           %\addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
           \@topnewpage[\@makechapterhead{#2}]%
                   \else
           \@makechapterhead{#2}%
           	\@afterheading
                    \fi}
                    
% Rededefine the table of contents command 
\renewcommand\contentsname{TABLE OF CONTENTS}
\renewcommand\tableofcontents{\begin{singlespace}%
		\if@twocolumn
	\@restonecoltrue\onecolumn
    		\else
	\@restonecolfalse
    		\fi
	\chapter*{\vspace{-2.6\baselineskip}\centerline{\normalsize \MakeUppercase\contentsname}
	\@mkboth{%
	\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
	%\vspace{-2.5\baselineskip}
	\vspace{-3\baselineskip} % HERE
	\@starttoc{toc}%
    		\if@restonecol\twocolumn\fi
	\end{singlespace}}
  
\newcommand{\TOC}{
	\clearpage
	\pagestyle{plain}
	\tableofcontents
	\clearpage
	\pagestyle{plain}}
\renewcommand{\cftchapleader}{\cftdotfill{\cftsecdotsep}}
	\renewcommand{\cftaftertoctitle}{\vspace{\baselineskip}}
     	\setlength{\cftbeforechapskip}{\baselineskip}
	\renewcommand{\cftchapnumwidth}{6.5em}  
	   
%  Define the \LOT command to augment the \listofftables command
\renewcommand\listoftables{%
		\if@twocolumn
	\@restonecoltrue\onecolumn
		\else
	\@restonecolfalse
		\fi
	\chapter*{\vspace{-2.6\baselineskip}\centerline{\normalsize \MakeUppercase\listtablename}}
	\tocentry{\textbf{LIST OF TABLES}}{List of Tables}%
	\@mkboth{\MakeUppercase\listtablesname}%
	{\MakeUppercase\listtablename}%
	\vspace*{-1\baselineskip} 
	\@starttoc{lot}%
		\if@restonecol\twocolumn
		\fi
}
	
\newcommand{\LOT}{
	\clearpage
	\setlength\cftbeforetabskip{\baselineskip}
	\listoftables
	\clearpage
	\pagestyle{plain}}
    
	\renewcommand{\cftafterlottitle}{\vspace{\baselineskip}}
	\renewcommand{\cfttabnumwidth}{5em} 
	\setlength{\cfttabindent}{0em}
	\renewcommand{\cfttabpresnum}{Table  }
 	\renewcommand{\cfttabaftersnum}{:}   
        
% Define the \LOF command to augment the \listoffigures command
	\renewcommand\listoffigures{%
		\if@twocolumn
	\@restonecoltrue\onecolumn
		\else
	\@restonecolfalse
		\fi
	\chapter*{\vspace{-2.6\baselineskip}\centerline{\normalsize \MakeUppercase\listfigurename}}
	\tocentry{\textbf{LIST OF FIGURES}}{List of Figures}%
	 \@mkboth{\MakeUppercase\listfigurename}%
	{\MakeUppercase\listfigurename}%
	\vspace*{-2.5\baselineskip}  
	\@starttoc{lof}%
		\if@restonecol\twocolumn
		\fi
}

\newcommand{\LOF}{
	\clearpage
	\setlength\cftbeforefigskip{\baselineskip}
	\listoffigures
	\clearpage
	\pagestyle{plain}}

	\renewcommand{\cftafterloftitle}{\vspace{\baselineskip}}
	\renewcommand{\cftfignumwidth}{5.5em} 
	\setlength{\cftfigindent}{0em}
	\renewcommand{\cftfigpresnum}{Figure  }
	\renewcommand{\cftfigaftersnum}{:\ }      
	        
% Define the KEY TO SYMBOLS
\newenvironment{symbols}{%
	\clearpage
	\thispagestyle{plain}\pagestyle{plain}
	\phantomsection
	\begin{center}
	\bfseries{\MakeUppercase{\large KEY TO SYMBOLS}}
	\end{center}
	\tocentry{KEY TO SYMBOLS}{Key To Symbols}%
	\vspace*{\baselineskip}}
{\newpage}

% Define the KEY TO ABBREVIATIONS
\newenvironment{abbrev}{%
	\clearpage
	\thispagestyle{plain}\pagestyle{plain}
	\phantomsection
	\begin{center}
	\bfseries{\MakeUppercase{LIST OF ABBREVIATIONS}}
	\end{center}
    \vspace*{-2\baselineskip}
	\tocentry{LIST OF ABBREVIATIONS}{List of Abbreviations}%
	\vspace*{\baselineskip}}
{\newpage}

% Single space quotation environments.
\renewenvironment{quotation}
	{\begin{singlespace}\list{}{\listparindent 1.5em%
	\itemindent    \listparindent
	\rightmargin   \leftmargin
	\parsep  \z@ \@plus\p@}%
	\item\relax}
{\endlist\end{singlespace}}
\renewenvironment{quote}
	{\begin{singlespace}\list{}{\rightmargin\leftmargin}%
	\item\relax}
{\endlist\end{singlespace}}    
               
%Removed class specific appendix commands. The custom commands given here did not seem to work with hyperref well, and the TOC entries would not link to the proper places. Using the standard LaTex Appendix package solves this issue, but also requires a special command to format the appendix titles to comply with MSU/Proquest guidelines. HMT 2023
     


% Single space the bibliography.
% To eliminate cover page number in ToC entry and replace with the actual first Bibliography page number, delete the eighth line down and remove the "%" signs in front of five lines further down.
\renewenvironment{thebibliography}[1]
	{\clearpage\thispagestyle{plain}
%	\vspace*{\fill}
%	\begin{center}
%	\large\textbf{\MakeUppercase{\bibname}}
%	\vspace{\baselineskip}% 
%	\end{center}
%	\tocentry{\bibname}{\bibnamelc}% Delete this line to remove cover page from ToC,
%	\vfill
%	\newpage
	\chapter*{\vspace{-1.9\baselineskip}\centerline{\normalsize\MakeUppercase{\bibname}}}%
%	\vspace*{-2\baselineskip}
	\@mkboth{\bibname}{\bibname}%
	\tocentry{\bibname}{\bibnamelc}%Include this line to move ToC entry.
	\vspace{-1.9\baselineskip}
	\begin{singlespace}
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
	\leftmargin\labelwidth
	\advance\leftmargin\labelsep
	\@openbib@code
	\usecounter{enumiv}%
	\let\p@enumiv\@empty
	\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\setlength{\itemsep}{0.13in}% needed to get appropriate separation of bib items.
	\sloppy
      	\clubpenalty4000
      	\@clubpenalty \clubpenalty
      	\widowpenalty4000%
      	\sfcode`\.\@m}
      	{\def\@noitemerr
       	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist
	\end{singlespace}}
     
% Properly locates page number for landscape
\let\LS@makecol=\@makecol
\let\LS@makefcolumn=\@makefcolumn
\def\LS@rot{%
	\setbox\@outputbox\vbox{\hbox{\rotatebox{90}%
	{\makebox[-4.5in][l]{\raisebox{-.4in}{\the\value{page}}}\box\@outputbox}}}}

% Set the starting page style
\pagestyle{empty} 
 