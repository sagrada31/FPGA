%Version 1.3
%By Jdelhaxhe.  
%Coder la prise en charge du titlepage

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rapport_unif}[2014/10/05 A class to easily design common documents for ULg]

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{ifpdf}
\RequirePackage{ifthen}
\RequirePackage[english]{babel} % Configuration de la langue
\RequirePackage{lastpage}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{graphicx} % Pour l'inclusion d'images
\RequirePackage{geometry}
\RequirePackage{type1cm}
\RequirePackage{eso-pic}
\RequirePackage{eurosym}
\RequirePackage[misc]{ifsym}
  
\newboolean{load-hyper}
\setboolean{load-hyper}{false}
\DeclareOption{hyperlinks}{
	\ifpdf
		\setboolean{load-hyper}{true}
	\else
	\typeout{This is not a PDF generation, hyperlinks directive ignored.}
	\fi
} % Les hyper-liens : Utilisable seulement pour compilation vers PDF

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article} % This class is built on the article standard class

\ifthenelse
	{\boolean{load-hyper}}
	{%
		\definecolor{darkred}{RGB}{99, 41, 22}
		\RequirePackage[bookmarks=false]{hyperref}
		\hypersetup{
			pdffitwindow=true,
			pdfstartview={FitV},
			pdfnewwindow=true,
			colorlinks,
			linktocpage=true,
			linkcolor=darkred,
			urlcolor=darkred%
		}%
	}
	{}

\newcommand{\nomprenomsc}[2][\@empty]{#2 {\sc #1}}
%Cette commande doit etre utilisee dans le preambule

%%%DEFINITION DES ETUDIANTS%%%

\makeatletter

\newboolean{studentOneDefined}
\setboolean{studentOneDefined}{false}
\newboolean{studentOneMailDefined}
\setboolean{studentOneMailDefined}{false}
\newboolean{studentOneYearDefined}
\setboolean{studentOneYearDefined}{false}
\newboolean{studentOneNumberDefined}
\setboolean{studentOneNumberDefined}{false}
\newcommand{\studentOne}{}
\newcommand{\studentOnesc}{}
\newcommand{\studentOneNumber}{}
\newcommand{\studentOneMail}{}
\newcommand{\studentOneYear}{}
\newcommand{\studentOneName}{}
\newcommand{\defStudentOne}[2][\@empty]{\renewcommand{\studentOneName}{#1} \renewcommand{\studentOne}{#2 #1} \renewcommand{\studentOnesc}{\nomprenomsc[#1]{#2}} \setboolean{studentOneDefined}{true}}
\newcommand{\defStudentOneNumber}[1]{\renewcommand{\studentOneNumber}{#1}\setboolean{studentOneNumberDefined}{true}}
\newcommand{\defStudentOneYear}[1]{\renewcommand{\studentOneYear}{#1} \setboolean{studentOneYearDefined}{true}}
\newcommand{\defStudentOneMail}[1]{\renewcommand{\studentOneMail}{#1} \setboolean{studentOneMailDefined}{true}}

\newboolean{studentTwoDefined}
\setboolean{studentTwoDefined}{false}
\newboolean{studentTwoMailDefined}
\setboolean{studentTwoMailDefined}{false}
\newboolean{studentTwoYearDefined}
\setboolean{studentTwoYearDefined}{false}
\newboolean{studentTwoNumberDefined}
\setboolean{studentTwoNumberDefined}{false}
\newcommand{\studentTwo}{}
\newcommand{\studentTwosc}{}
\newcommand{\studentTwoNumber}{}
\newcommand{\studentTwoMail}{}
\newcommand{\studentTwoYear}{}
\newcommand{\studentTwoName}{}
\newcommand{\defStudentTwo}[2][\@empty]{\renewcommand{\studentTwoName}{#1} \renewcommand{\studentTwo}{#2 #1} \renewcommand{\studentTwosc}{\nomprenomsc[#1]{#2}} \setboolean{studentTwoDefined}{true}}
\newcommand{\defStudentTwoNumber}[1]{\renewcommand{\studentTwoNumber}{#1}\setboolean{studentTwoNumberDefined}{true}}
\newcommand{\defStudentTwoYear}[1]{\renewcommand{\studentTwoYear}{#1} \setboolean{studentTwoYearDefined}{true}}
\newcommand{\defStudentTwoMail}[1]{\renewcommand{\studentTwoMail}{#1} \setboolean{studentTwoMailDefined}{true}}

\newboolean{studentThreeDefined}
\setboolean{studentThreeDefined}{false}
\newboolean{studentThreeMailDefined}
\setboolean{studentThreeMailDefined}{false}
\newboolean{studentThreeYearDefined}
\setboolean{studentThreeYearDefined}{false}
\newboolean{studentThreeNumberDefined}
\setboolean{studentThreeNumberDefined}{false}
\newcommand{\studentThree}{}
\newcommand{\studentThreesc}{}
\newcommand{\studentThreeNumber}{}
\newcommand{\studentThreeMail}{}
\newcommand{\studentThreeYear}{}
\newcommand{\studentThreeName}{}
\newcommand{\defStudentThree}[2][\@empty]{\renewcommand{\studentThreeName}{#1} \renewcommand{\studentThree}{#2 #1} \renewcommand{\studentThreesc}{\nomprenomsc[#1]{#2}} \setboolean{studentThreeDefined}{true}}
\newcommand{\defStudentThreeNumber}[1]{\renewcommand{\studentThreeNumber}{#1}\setboolean{studentThreeNumberDefined}{true}}
\newcommand{\defStudentThreeYear}[1]{\renewcommand{\studentThreeYear}{#1} \setboolean{studentThreeYearDefined}{true}}
\newcommand{\defStudentThreeMail}[1]{\renewcommand{\studentThreeMail}{#1} \setboolean{studentThreeMailDefined}{true}}

\newboolean{studentFourDefined}
\setboolean{studentFourDefined}{false}
\newboolean{studentFourMailDefined}
\setboolean{studentFourMailDefined}{false}
\newboolean{studentFourYearDefined}
\setboolean{studentFourYearDefined}{false}
\newboolean{studentFourNumberDefined}
\setboolean{studentFourNumberDefined}{false}
\newcommand{\studentFour}{}
\newcommand{\studentFoursc}{}
\newcommand{\studentFourNumber}{}
\newcommand{\studentFourMail}{}
\newcommand{\studentFourYear}{}
\newcommand{\studentFourName}{}
\newcommand{\defStudentFour}[2][\@empty]{\renewcommand{\studentFourName}{#1} \renewcommand{\studentFour}{#2 #1} \renewcommand{\studentFoursc}{\nomprenomsc[#1]{#2}} \setboolean{studentFourDefined}{true}}
\newcommand{\defStudentFourNumber}[1]{\renewcommand{\studentFourNumber}{#1}\setboolean{studentFourNumberDefined}{true}}
\newcommand{\defStudentFourYear}[1]{\renewcommand{\studentFourYear}{#1} \setboolean{studentFourYearDefined}{true}}
\newcommand{\defStudentFourMail}[1]{\renewcommand{\studentFourMail}{#1} \setboolean{studentFourMailDefined}{true}}

\newboolean{coursDefined}
\setboolean{coursDefined}{false}
%Cette commande doit etre utilisee dans le preambule
\newcommand{\cours}[1]{\newcommand{\@cours}{#1} \setboolean{coursDefined}{true}}

\newboolean{teacherDefined}
\setboolean{teacherDefined}{false}
%Cette commande doit etre utilisee dans le preambule
\newcommand{\teacher}[2][\@empty]{\newcommand{\@teacher}{\nomprenomsc[#1]{#2}} \setboolean{teacherDefined}{true}}

\makeatother

\defStudentOne[Bourghelle]{Florent}
\defStudentOneNumber{s112528}
\defStudentOneMail{fbourghelle@student.ulg.ac.be}
\defStudentOneYear{1st master Electrical Engineering}

\geometry{vmargin=3cm,hmargin=2cm}

\makeatletter
% Titre du document
% ==================
\renewcommand{\maketitle}{%
	\begin{titlepage}%
		\let\footnotesize\small
		\let\footnoterule\relax
		\let \footnote \thanks
  
		\vspace{\stretch{1}}
  
		\begin{center}
			\begin{tabular}{@{}l@{}|@{}r@{}}
				\begin{minipage}{8cm}
					\includegraphics[width=7cm]{ULg_logo_couleur.pdf}
				\end{minipage}
			%    	
			&
			%    	
				%\fboxsep=4mm
				%\fboxrule=0,5pt
				%\fbox{%
				\hspace{8.5mm}
				\begin{minipage}{7cm}
					\ifthenelse
						{\boolean{load-hyper}}
						{%
							\href
								{mailto:\studentOneMail}
								{{\large \studentOnesc} \\ \studentOneYear \\ \studentOneNumber}
							\ifthenelse
								{\boolean{studentTwoDefined}}
								{
									\\[5mm]
									\ifthenelse
										{\boolean{studentTwoMailDefined}}
										{
											\href
												{mailto:\studentTwoMail}
												{
													{\large \studentTwosc}
													\ifthenelse
														{\boolean{studentTwoYearDefined}}
														{\\ \studentTwoYear}
														{}
													\ifthenelse
														{\boolean{studentTwoNumberDefined}}
														{\\ \studentTwoNumber}
														{}
												}
										}
										{
											{\large \studentTwosc}
											\ifthenelse
												{\boolean{studentTwoYearDefined}}
												{\\ \studentTwoYear}
												{}
											\ifthenelse
												{\boolean{studentTwoNumberDefined}}
												{\\ \studentTwoNumber}
												{}
										}
								}
								{}
							\ifthenelse
								{\boolean{studentThreeDefined}}
								{
									\\[5mm]
									\ifthenelse
										{\boolean{studentThreeMailDefined}}
										{
											\href
												{mailto:\studentThreeMail}
												{
													{\large \studentThreesc}
													\ifthenelse
														{\boolean{studentThreeYearDefined}}
														{\\ \studentThreeYear}
														{}
													\ifthenelse
														{\boolean{studentThreeNumberDefined}}
														{\\ \studentThreeNumber}
														{}
												}
										}
										{
											{\large \studentThreesc}
											\ifthenelse
												{\boolean{studentThreeYearDefined}}
												{\\ \studentThreeYear}
												{}
											\ifthenelse
												{\boolean{studentThreeNumberDefined}}
												{\\ \studentThreeNumber}
												{}
										}
								}
								{}
							\ifthenelse
								{\boolean{studentFourDefined}}
								{
									\\[5mm]
									\ifthenelse
										{\boolean{studentFourMailDefined}}
										{
											\href
												{mailto:\studentFourMail}
												{
													{\large \studentFoursc}
													\ifthenelse
														{\boolean{studentFourYearDefined}}
														{\\ \studentFourYear}
														{}
													\ifthenelse
														{\boolean{studentFourNumberDefined}}
														{\\ \studentFourNumber}
														{}
												}
										}
										{
											{\large \studentFoursc}
											\ifthenelse
												{\boolean{studentFourYearDefined}}
												{\\ \studentFourYear}
												{}
											\ifthenelse
												{\boolean{studentFourNumberDefined}}
												{\\ \studentFourNumber}
												{}
										}
								}
								{}
						}
						{
							{\large \studentOnesc}\\
							\studentOneYear\\
							\studentOneNumber
							\ifthenelse
								{\boolean{studentTwoDefined}}
								{
									\\[5mm]
									{\large \studentTwosc}
									\ifthenelse
										{\boolean{studentTwoYearDefined}}
										{\\ \studentTwoYear}
										{}
									\ifthenelse
										{\boolean{studentTwoNumberDefined}}
										{\\ \studentTwoNumber}
										{}
								}
								{}
							\ifthenelse
								{\boolean{studentThreeDefined}}
								{
									\\[5mm]
									{\large \studentThreesc}
									\ifthenelse
										{\boolean{studentThreeYearDefined}}
										{\\ \studentThreeYear}
										{}
									\ifthenelse
										{\boolean{studentThreeNumberDefined}}
										{\\ \studentThreeNumber}
										{}
								}
								{}
							\ifthenelse
								{\boolean{studentFourDefined}}
								{
									\\[5mm]
									{\large \studentFoursc}
									\ifthenelse
										{\boolean{studentFourYearDefined}}
										{\\ \studentFourYear}
										{}
									\ifthenelse
										{\boolean{studentFourNumberDefined}}
										{\\ \studentFourNumber}
										{}
								}
								{}
						}
				\end{minipage}
			\end{tabular}
		\end{center}
		
		\vspace{1.5cm}
		
		\begin{center}
			\fboxsep=5pt
			\fboxrule=0.4pt
			\fbox{%
				\begin{minipage}{0.97\textwidth}
					\centering%
						\vskip 10mm\nobreak
						{\LARGE{\textbf \@title \par}}
						\ifthenelse
							{\boolean{coursDefined}}
							{\vskip 15mm\nobreak {\large{\textbf \@cours \par}}}
							{}
			%       	\vskip 3mm\nobreak
			% 		   	{\large
			%   		   	\begin{tabular}[t]{c}%
			%	  		     	\@author
			%   		   	\end{tabular}\par
			%   		 }
						\ifthenelse
							{\boolean{teacherDefined}}
							{\vskip 5mm\nobreak {\large\@teacher \par}}
							{}
						\ifthenelse
							{\equal
								{\@date}
								{}
							}
							{}
							{\vskip 15mm\nobreak \@date}
						\vskip 10mm\nobreak
				\end{minipage}%
			}
		\end{center}
		
		\vspace{\stretch{2}}
		
		\@thanks
	%	\vfil\null
	\end{titlepage}%
  
	\setcounter{footnote}{0}%
	\global\let\thanks\relax
	\global\let\maketitle\relax
	\global\let\@thanks\@empty
%	\global\let\@author\@empty %\@author utilis� dans les en-tetes
	\global\let\@date\@empty
%	\global\let\@title\@empty %\@Title utilis� dans les en-tetes
	\global\let\title\relax
	\global\let\author\relax
	\global\let\date\relax
	\global\let\and\relax
}

% Filigrane
% ==========
%\setlength{\unitlength}{1mm}
%\AddToShipoutPicture{%    
%	\put(250,100){
%		\begin{minipage}[b]{\textwidth}
%			\includegraphics[width=9cm]{ULg_logo_filligraneONLY_couleur.pdf}
%		\end{minipage}
%	}
%}

% En-t�tes et pieds de page
% ==========================
\RequirePackage{fancyhdr}
\pagestyle{fancy}
%\fancyhf{}

\lhead{
	\ifthenelse
		{\boolean{studentThreeDefined}}
		{\studentOneName{} \--- \studentTwoName}
		{\studentOnesc}
	\ifthenelse
		{\boolean{studentThreeDefined}}
		{ \--- \studentThreeName}
		{}
	\ifthenelse
	{\boolean{studentFourDefined}}
	{ \--- \studentFourName}
	{}
}

\chead{\@title}

\rhead{Page \thepage{} of \pageref{LastPage}}

\makeatother

\setlength{\headheight}{1cm}
%\setlength{\footskip}{0cm}

% Génération du header de document %
%==================================%
\newlength{\rightheader}
\setlength{\rightheader}{74mm}
\newcommand{\makeheader}{
	\begin{center}
		\begin{tabular}{@{}l|r@{}} 		
			\hspace{31mm}
			\begin{minipage}{44mm}
				\includegraphics[width=4cm]{ULg_logo_couleur.pdf}
			\end{minipage}
			%
			&
			%    	
			\hspace{2mm}
			\begin{minipage}{\rightheader}
				\flushleft
					{\large\studentOnesc}
					\\[1mm]
					{\small
						Rue aux Communes, 175\\
						4602 Cheratte
						\\[1mm]
						\Telephone\quad +32 485 66 47 69
						\\[1mm]
						\ \Letter\quad\url{jeremie.delhaxhe@student.ulg.ac.be}
						\par
					}
			\end{minipage}
		\end{tabular}
	\end{center}
}