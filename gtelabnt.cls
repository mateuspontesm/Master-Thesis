\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gtelabnt}[2017/08/12 v-1.0.0 GTEL template with ABNT rules]

\RequirePackage{ifthen}

\newcommand{\ifnotempty}[2]{\ifthenelse{\not\equal{#1}{}}{#2}{}}

\newboolean{doutorado}
\newboolean{mestrado}
\DeclareOption{doutorado}{\setboolean{doutorado}{true}\setboolean{mestrado}{false}}
\DeclareOption{mestrado}{\setboolean{doutorado}{false}\setboolean{mestrado}{true}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}
\ProcessOptions\relax
\LoadClass[
	% -- opções da classe memoir --
	12pt,				% tamanho da fonte
	openright,			% capítulos começam em pág ímpar (insere página vazia caso preciso)
	oneside,			% para impressão em verso e anverso. Oposto a oneside
	a4paper,			% tamanho do papel.
	oldfontcommands,
	% -- opções da classe abntex2 --
%	chapter=TITLE,		% títulos de capítulos convertidos em letras maiúsculas
	% -- opções de sumário -- %
	sumario=abnt-6027-2012 % sumário conforme as recomendações da ABNT NBR 6027:2012 (padrão)
]{abntex2}

\RequirePackage{ifxetex}
\ifxetex
	\usepackage{fontspec}
	\setmainfont{Times New Roman}
\else
%	\usepackage{mathptmx}
	\usepackage{bookman}
\fi

%%%%%% Modificações de acordo com o guia de normalização da UFC
% Alteração da fonte dos capítulos, seções, subseções e subsubseções
\renewcommand{\ABNTEXchapterfontsize}{\huge}
\renewcommand{\ABNTEXchapterfont}{\normalfont}
\renewcommand{\ABNTEXsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsectionfont}{\bfseries}
\renewcommand{\ABNTEXsubsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsectionfont}{\bfseries\itshape}
\renewcommand{\ABNTEXsubsubsectionfontsize}{\normalsize}
\renewcommand{\ABNTEXsubsubsectionfont}{\itshape}
\renewcommand{\ABNTEXsubsubsubsectionfontsize}{\normalsize}

% Altera fonte no TOC
\renewcommand{\cftchapterfont}{\normalfont}
\renewcommand{\cftsectionfont}{\normalfont}
\renewcommand{\cftsubsectionfont}{\itshape\normalfont}
\renewcommand{\cftsubsubsectionfont}{\itshape\normalfont}

\cftsetindents{part}{0em}{1.4em}
\cftsetindents{chapter}{0em}{1.4em}
\cftsetindents{section}{1.5em}{2.3em}
\cftsetindents{subsection}{3.8em}{3.2em}
\cftsetindents{subsubsection}{7.0em}{4.1em}
\cftsetindents{paragraph}{10.0em}{5.0em}
\cftsetindents{subparagraph}{12.0em}{6.0em}

  %
\renewcommand{\tocprintchapter}{%
	\addtocontents{toc}{\cftsetindents{chapter}{0em}{1.4em}}}
%
\renewcommand{\tocinnonumchapter}{%
	\addtocontents{toc}{\cftsetindents{chapter}{0em}{1.4em}}%
	\cftinserthook{toc}{A}}
%
\renewcommand{\tocprintchapternonum}{%
	\addtocontents{toc}{\cftsetindents{chapter}{0em}{1.4em}}}
%

\makeatletter
\settocpreprocessor{chapter}{%
	\let\tempf@rtoc\f@rtoc%
	\def\f@rtoc{%
		\texorpdfstring{\bfseries\tempf@rtoc}{\tempf@rtoc}}%
}
\makeatother

\RequirePackage{fancyhdr}
\RequirePackage[Lenny]{fncychap}
%%\RequirePackage[nobottomtitles,clearempty]{titlesec}
\RequirePackage[clearempty,compact]{titlesec}
\RequirePackage{titletoc}

\titleformat{\section}
{%\titlerule%
	%\titlerule*[.25pc]{\Huge.}%
	%\titleline{\rule{.05\linewidth}{3pt}}%
	%\titlerule%
	\vspace{.10ex}%
	\large\bfseries}%
{\thesection}{.5em}{}%
%[\vspace{.05ex}{\titlerule[.25pt]\vspace{2pt}\titlerule[.25pt]}]
%[\vspace{.05ex}{\titlerule[.25pt]}]
%[{\titlerule*[1pc]{.}}]
%[\titlerule]
[\titlerule\titleline{\rule{.05\linewidth}{5pt}}]

\titleformat{\subsection}[hang]
{%\titlerule*[.5pc]{.}%
	%\titleline{\rule{.35\linewidth}{2pt}}%
	%\titlerule%
	%\vspace{.10ex}%
	\normalfont\bfseries}%
%{\rule{.35\linewidth}{.8pt}{\thesubsection}}{.5em}{}%
{\thesubsection}{.5em}{}%

% Altera o "Contents" --> "Summary" em inglês
\addto\captionsenglish{
	\renewcommand{\contentsname}{Table of Contents}
}

% Remove espaço entre capítulos no sumário
%\setlength{\cftbeforechapterskip}{0em}

% O tamanho do parágrafo é dado por:
%\setlength{\parindent}{2cm}

% Espaçamento entre um parágrafo e outro
\setlength{\parskip}{1ex}

% Ajusta os captions das figuras
\RequirePackage{caption}

\captionsetup[figure]{font = singlespacing,
              format = plain,
              font=small,
              justification = justified,
              skip = 0pt,
              singlelinecheck = false}

% \captionsetup[subfigure]{font = singlespacing,
% 	format = plain,
% 	font=small,
% 	justification = justified,
% 	skip = 0pt,
% 	singlelinecheck = false}

\captionsetup[table]{font = singlespacing,
					 format = hang,
					 justification = justified,
					 skip = 0pt,
					 singlelinecheck = false}

\RequirePackage{subcaption}

% Distance between floats on the top or the bottom and the text;
%\setlength{\textfloatsep}{18pt plus 2pt minus 2pt}

% Distance between floats inserted inside the page text (using h) and the text proper.
%\setlength{\intextsep}{18pt plus 2pt minus 2pt}

\makeatletter
\LetLtxMacro{\abnt@fonte}{\fonte}
\renewcommand{\fonte}[2][\fontename]{
	\vspace{2pt}
	\captionsetup{labelsep=colon}
	\abnt@fonte[#1]{#2}
	\vspace{-2pt}
}
\newcommand{\source}[1]{\fonte{#1}}
\makeatother

% Fonte de figuras e tabelas
\newcommand{\ownership}{Elaborada pelo autor.}
\addto\captionsenglish{
	\renewcommand{\ownership}{Created by the author.}
}

% Set spacing in enumerations accordinally to the ABNT
%\setlist{nosep}
%\setlist{itemindent = \parindent}
%\setlist{leftmargin = \parindent}

%%%%%% Configura o estilo de bibliografias para o ABNT numerado
% Aparecem em ordem de citação
\RequirePackage[backend=biber, 			% Gerador de bibliografias
				style=ieee,%abnt-numeric, 	% Modelo ABNT numérico
				sortcites=true, 		% Ordena mútiplas citações bibliografias. Ex.: [3, 4, 8]
				sorting=none,			% Processa as bibliografias em ordem de aparição no texto
				giveninits,				% Iniciais dos nomes dos autores abreviadas
%				justify 				% Imprime o texto justificado em vez de alinhado à esquerda
				]{biblatex}

% Mudança no modelo ABNT - UFC
\DefineBibliographyStrings{brazil}{%
	bibliography = {Referências},
}
\DefineBibliographyStrings{english}{%
	bibliography = {References},
}

% Workaround to fix the bibliography title in the \printbibliography
\RequirePackage{xparse}
\let\oldprintbibliography\printbibliography
\RenewDocumentCommand{\printbibliography}{O{title = {\uppercase{\bibname}}}}{
	\oldprintbibliography[#1]
}

% Títulos de artigos de conferência são em negrito
%\DeclareFieldFormat[inproceedings]{title}{\textbf{#1}}

% Altera os parênteses nas citações por colchetes
%\DeclareCiteCommand{\cite}[\mkbibbrackets]
%{\usebibmacro{prenote}}
%{\usebibmacro{citeindex}\usebibmacro{cite}}
%{\multicitedelim}
%{\usebibmacro{postnote}}
%\DeclareMultiCiteCommand{\cites}[\mkbibbrackets]{\cite}{\multicitedelim}
%
%\DeclareCiteCommand{\parencite}[\mkbibbrackets]
%{\usebibmacro{prenote}}
%{\usebibmacro{citeindex}\usebibmacro{cite}}
%{\multicitedelim}
%{\usebibmacro{postnote}}
%\DeclareMultiCiteCommand{\parencites}[\mkbibbrackets]{\parencite}{\multicitedelim}

% Informações do PDF
\makeatletter
\hypersetup{
	%pagebackref=true,
	pdftitle={\@title},
	pdfauthor={\@author},
	pdfsubject={\imprimirpreambulo},
	pdfcreator={GTEL ABNT},
	pdfkeywords={abnt}{latex}{abntex2}{ufc}{gtel}{monografia}{dissertação}{tese},
	colorlinks=true,       		% false: boxed links; true: colored links
	linkcolor=black,          	% color of internal links
	citecolor=black,        	% color of links to bibliography
	filecolor=black,      		% color of file links
	urlcolor=black,
	bookmarksdepth=4
}
\makeatother

% Bibliotecas Matemáticas
\RequirePackage{mathtools}
\RequirePackage{xfrac}
\RequirePackage{bm}
\RequirePackage{amssymb}
\RequirePackage{amstext}
\RequirePackage{amsfonts}

% Organizar numeração das figuras por capítulo
\numberwithin{figure}{chapter}

% Organizar numeração das tabelas por capítulo
\numberwithin{table}{chapter}

% Pacotes de formatação do texto
\RequirePackage{cmap}				% Mapeia caracteres especiais no PDF
\RequirePackage[T1]{fontenc}		% Seleção de códigos de fonte.
\RequirePackage[utf8]{inputenc}		% Codificação do documento (conversão automática dos acentos)
\RequirePackage{indentfirst}		% Indenta o primeiro parágrafo de cada seção.
\RequirePackage{microtype} 			% Para melhorias de justificação
%\RequirePackage[charter, bigdelims, vvarbb]{newtxmath} % Fontes matemáticas melhores

% Pacotes adicionais
\RequirePackage[svgnames]{xcolor}	% Controle das cores
\RequirePackage{graphicx} 			% Figuras e Gráficos
\RequirePackage[final]{pdfpages}	% Inclusão de páginas em PDF
\RequirePackage{cleveref}			% Referencias inteligentes

%\instituicao{%
%	\MakeUppercase{Universidade Federal do Ceará} \\
%	\MakeUppercase{Centro de Tecnologia} \\
%	\MakeUppercase{Departamento de Engenharia de Teleinformática} \\%\par
%	\MakeUppercase{Programa de Pós-Graduação em Engenharia de Teleinformática}
%}
\instituicao{%
	\MakeUppercase{Federal University of Ceará} \\
	\MakeUppercase{Department of Teleinformatics Engineering} \\
	\MakeUppercase{Postgraduate Program in Teleinformatics Engineering} \\
}

\providecommand{\imprimirpreambuloContraCapa}{}
\newcommand{\preambuloContraCapa}[1]{\renewcommand{\imprimirpreambuloContraCapa}{#1}}

\ifthenelse{\boolean{doutorado}}{
%	\preambuloContraCapa{Tese apresentada ao Curso de Doutorado em Engenharia de Teleinformática da Universidade Federal do Ceará, como parte dos requisitos para obtenção do Título de Doutor em Engenharia de Teleinformática. Área de concentração: Sinais e Sistemas}
	\preambuloContraCapa{Presented Thesis for the Post-graduate Program in Teleinformatics Engineering of Federal University of Ceará as a partial requisite to obtain the Ph.D. degree in Teleinformatics Engineering.}

	\addto\captionsbrazil {
		\tipotrabalho{Tese de Doutorado}
		\preambulo{\imprimirpreambuloContraCapa}
	}
	\addto\captionsenglish{
		\tipotrabalho{Doctorate Thesis}
		\preambulo{Presented Thesis for the Post-graduate Program in Teleinformatics Engineering of Federal University of Ceará as a partial requisite to obtain the Ph.D. degree in Teleinformatics Engineering.}
	}
}{
	\tipotrabalho{Dissertação de Mestrado}
	\preambuloContraCapa{Dissertação apresentada ao Curso de Mestrado em Engenharia de Teleinformática da Universidade Federal do Ceará, como parte dos requisitos para obtenção do Título de Mestre em Engenharia de Teleinformática. Área de concentração: Sinais e Sistemas}

	\addto\captionsbrazil {
		\tipotrabalho{Tese de Doutorado}
		\preambulo{\imprimirpreambuloContraCapa}
	}
	\addto\captionsenglish{
		\tipotrabalho{Master Thesis}
		\preambulo{Presented Thesis for the Post-graduate Program in Teleinformatics Engineering of Federal University of Ceará as a partial requisite to obtain the Master degree in Teleinformatics Engineering.}
	}
}

% Comandos de dados - orientador
\providecommand{\imprimirorientadorInstituicao}{}
\renewcommand{\orientador}[3][\orientadorname]%
{\renewcommand{\imprimirorientadorRotulo}{#1}%
	\renewcommand{\imprimirorientador}{#2}
	\renewcommand{\imprimirorientadorInstituicao}{#3}}

% Comandos de dados - coorientador
\providecommand{\imprimircoorientadorInstituicao}{}
\renewcommand{\coorientador}[3][\coorientadorname]%
{\renewcommand{\imprimircoorientadorRotulo}{#1}%
	\renewcommand{\imprimircoorientador}{#2}
	\renewcommand{\imprimircoorientadorInstituicao}{#3}}

% Comandos de dados - Membros da banca
\RequirePackage{etoolbox} % defines lists and their operations
\newcounter{membroCounter}
\newcommand{\addmembro}[2]{
	\stepcounter{membroCounter}
	\csdef{membro\themembroCounter}{#1}
	\csdef{membroInstituicao\themembroCounter}{#2}
}

\newcommand{\imprimirMembro}[1]{\csuse{membro#1}}
\newcommand{\imprimirMembroInstituicao}[1]{\csuse{membroInstituicao#1}}
\newcommand{\nummembros}{\themembroCounter}

\providecommand{\imprimirdataaprovacao}{}
\newcommand{\dataaprovacao}[1]{
	\renewcommand{\imprimirdataaprovacao}{#1}%
}

% alterando a capa
\makeatletter
\renewcommand{\imprimircapa}{%
	\begin{capa}%
		\center
		{\includegraphics[scale=0.5]{ufc-brasao.pdf}}

		{\bfseries\imprimirinstituicao\vspace*{3.5cm}}

		{\bfseries\MakeUppercase{\imprimirautor}\vspace*{3.5cm}}

		{\bfseries\MakeUppercase{\imprimirtitulo}}
		\vspace*{\fill}

		{\bfseries\MakeUppercase{\imprimirlocal}}
		\par
		{\bfseries\imprimirdata}

		\vspace*{1cm}
	\end{capa}
}

% folha de rosto
\renewcommand{\folhaderostocontent}{
	\begin{center}
		{\MakeUppercase\imprimirautor}

		\vspace*{3.5cm}

		{\MakeUppercase \imprimirtitulo}

		\vspace*{\fill}

		\abntex@ifnotempty{\imprimirpreambulo}{%
			\hspace{.45\textwidth}
			\begin{minipage}{.5\textwidth}
				\SingleSpacing
				\imprimirpreambuloContraCapa
			\end{minipage}%
		}%

		\abntex@ifnotempty{\imprimirorientador}{%
			\hspace{.45\textwidth}
			\begin{minipage}{.5\textwidth}
				\SingleSpacing
%				Orientador: \imprimirorientador
%				\SingleSpacing
%				\abntex@ifnotempty{\imprimircoorientador}{%
%					Coorientador: \imprimircoorientador
%				}%
				Supervisor: \imprimirorientador
				\SingleSpacing
				\abntex@ifnotempty{\imprimircoorientador}{%
				Co-supervisor: \imprimircoorientador
				}%
			\end{minipage}%
			\vspace*{\fill}
		}%

		\vspace*{\fill}

		{\MakeUppercase\imprimirlocal}
		\par
		{\imprimirdata}
		\vspace*{1cm}
	\end{center}
}
\makeatother

\providecommand{\printApprovedAt}{}
\newcommand{\approvedAt}[1]{\renewcommand{\printApprovedAt}{#1}}

\providecommand{\printExaminationBoard}{}
\newcommand{\examinationBoard}[1]{\renewcommand{\printExaminationBoard}{#1}}

\providecommand{\printOrientadorName}{}
\newcommand{\orientadorName}[1]{\renewcommand{\printOrientadorName}{#1}}

\providecommand{\printCoorientadorName}{}
\newcommand{\coorientadorName}[1]{\renewcommand{\printCoorientadorName}{#1}}

\addto\captionsbrazil {
	\approvedAt{Aprovado em}
	\examinationBoard{BANCA EXAMINADORA}
	\orientadorName{Orientador}
	\coorientadorName{Coorientador}
}
\addto\captionsenglish{
	\approvedAt{Approved at}
	\examinationBoard{EXAMINATION BOARD}
	\orientadorName{Supervisor}
	\coorientadorName{Co-supervisor}
}

\newcommand{\imprimirfolhadeaprovacao}{
\begin{folhadeaprovacao}

	\begin{center}
		{\MakeUppercase\imprimirautor}
		\vspace{1cm}

		\begin{center}
			\MakeUppercase\imprimirtitulo
		\end{center}

		\vspace{2cm}
		\hspace{.45\textwidth}
		\begin{minipage}{0.5\textwidth}
			\imprimirpreambulo
			\\ \\ \\
		\end{minipage}%

		\vspace{-0.5cm}

		\begin{minipage}{\textwidth}
			\printApprovedAt: \imprimirdataaprovacao.
		\end{minipage}

		\vspace{0.5cm}
		\printExaminationBoard
	\end{center}

	\def\spacebetweensigns{-12pt}

	\vspace{\spacebetweensigns}
	\assinatura{}
	\vspace{\spacebetweensigns}
	\begin{center}
		{\imprimirorientador \space (\printOrientadorName) \\ \imprimirorientadorInstituicao}
	\end{center}

	\ifnotempty{\imprimircoorientador}{
		\vspace{\spacebetweensigns}
		\assinatura{}
		\vspace{\spacebetweensigns}
		\begin{center}
			{\imprimircoorientador \space (\printCoorientadorName) \\ \imprimircoorientadorInstituicao}
		\end{center}
	}

	% IMPRIME DEMAIS MEMBROS DA BANCA

	\newcounter{impmembro}%
	\setcounter{impmembro}{0}
	\whileboolexpr{ test {\ifnumcomp{\value{impmembro}}{<}{\nummembros}} }{
		\stepcounter{impmembro}
		\vspace{\spacebetweensigns}
		\assinatura{}
		\vspace{\spacebetweensigns}
		\begin{center}
			{\imprimirMembro{\theimpmembro} \\ \imprimirMembroInstituicao{\theimpmembro}}
		\end{center}
	}
\end{folhadeaprovacao}
}


%% Renew the figure, subfigure and table environments to cope with the ABNT

\makeatletter
\newsavebox\abntfig@imagebox
% https://tex.stackexchange.com/questions/116670/duplicating-environments
\let\abntfig@figure\figure
\let\abntfig@endfigure\endfigure
\renewenvironment{figure}[1][]{%
	\LetLtxMacro{\abntfig@caption}{\caption}%
	\let\abntfig@captionargs\@undefined%
	\let\abntfig@captionparam\@undefined%
	\RenewDocumentCommand{\caption}{o m}{
		\IfNoValueTF{##1}{}{
			\gdef\abntfig@captionargs{##1}%
		}
		\gdef\abntfig@captionparam{##2}%
	}%
	%
	\LetLtxMacro{\abntfig@fonte}{\fonte}%
	\let\abntfig@sourceargs\fontename%
	\let\abntfig@sourceparam\ownership%
	\renewcommand{\fonte}[2][\fontename]{%
		\gdef\abntfig@sourceargs{##1}%
		\gdef\abntfig@sourceparam{##2}%
	}%
	%
	\let\abntfig@label\label%
	\let\abntfig@labelparam\@undefined%
	\renewcommand{\label}[1]{%
		\gdef\abntfig@labelparam{##1}%
	}%
	%
	% https://tex.stackexchange.com/questions/329359/subcaption-formatting-changes-when-using-standalone-documentclass/329560
	\let\abntfig@bsphack=\@bsphack
	\let\abntfig@esphack=\@esphack
	\abntfig@figure[#1]%
	\centering%
	\begin{lrbox}{\abntfig@imagebox}%
		\begin{varwidth}{\textwidth}%{\dimexpr\textwidth-2\fboxsep-2\fboxrule}%
			\centering%
			\let\@bsphack=\abntfig@bsphack%
			\let\@esphack=\abntfig@esphack%
}{%
			\setlength{\baselineskip}{0pt}%
		\end{varwidth}%
	\end{lrbox}%
%
%	Width: \the\wd\abntfig@imagebox \\
%	Height: \the\ht\abntfig@imagebox \\
%	Depth: \the\dp\abntfig@imagebox \\
%
%	\captionsetup{width=\wd\abntfig@imagebox, format = hang}%
	\begin{Spacing}{1.} %
		\@ifundefined{abntfig@captionparam}{}{
			\@ifundefined{abntfig@captionargs}{
				\abntfig@caption{\abntfig@captionparam}
			}{
				\abntfig@caption[\abntfig@captionargs]{\abntfig@captionparam}
			}
		}
		\@ifundefined{abntfig@labelparam}{}{
			\abntfig@label{\abntfig@labelparam}
		}
	\end{Spacing} %
	\usebox{\abntfig@imagebox}%
%	\frame{\usebox{\abntfig@imagebox}}%
	\setlength{\baselineskip}{0pt}%
	\abntfig@fonte[\abntfig@sourceargs]{\abntfig@sourceparam}%
	\abntfig@endfigure%
}

\newsavebox\abntsubfig@imagebox
\AtBeginEnvironment{figure} {
	% https://tex.stackexchange.com/questions/116670/duplicating-environments
	\let\abntsubfig@subfigure\subfigure
	\let\abntsubfig@endsubfigure\endsubfigure
	\renewenvironment{subfigure}[2][]{
		\abntsubfig@subfigure[#1]{#2}
		\centering%
		%
		\LetLtxMacro{\abntsubfig@caption}{\caption}%
		\let\abntsubfig@captionargs\@undefined%
		\let\abntsubfig@captionparam\@undefined%
		\RenewDocumentCommand{\caption}{o m}{
			\IfNoValueTF{##1}{}{
				\gdef\abntsubfig@captionargs{##1}%
			}
			\gdef\abntsubfig@captionparam{##2}%
		}%
		\let\abntsubfig@label\abntfig@label%
		\let\abntsubfig@labelparam\@undefined%
		\renewcommand{\label}[1]{%
			\gdef\abntsubfig@labelparam{##1}%
		}%
		% https://tex.stackexchange.com/questions/329359/subcaption-formatting-changes-when-using-standalone-documentclass/329560
		\let\abntsubfig@bsphack=\@bsphack
		\let\abntsubfig@esphack=\@esphack
		\begin{lrbox}{\abntsubfig@imagebox}%
			\begin{varwidth}{\textwidth}%
				\let\@bsphack=\abntsubfig@bsphack%
				\let\@esphack=\abntsubfig@esphack%
	}{%
				\setlength{\baselineskip}{0pt}%
			\end{varwidth}
		\end{lrbox}%
%		\captionsetup{width=\wd\abntsubfig@imagebox}%
		\begin{Spacing}{1.} %
			\@ifundefined{abntsubfig@captionparam}{}{
				\@ifundefined{abntsubfig@captionargs}{
					\abntsubfig@caption{\abntsubfig@captionparam}
				}{
					\abntsubfig@caption[\abntsubfig@captionargs]{\abntsubfig@captionparam}
				}
			}
			\@ifundefined{abntsubfig@labelparam}{}{
				\abntsubfig@label{\abntsubfig@labelparam}
			}
		\end{Spacing} %
		\usebox{\abntsubfig@imagebox}
%		\frame{\usebox{\abntsubfig@imagebox}}
		\abntsubfig@endsubfigure
	}
}


\newsavebox\abnttable@tablebox
% https://tex.stackexchange.com/questions/116670/duplicating-environments
\let\abnttable@table\table
\let\abnttable@endtable\endtable
\renewenvironment{table}[1][]{%
	\LetLtxMacro{\abnttable@caption}{\caption}%
	\let\abnttable@captionargs\@undefined%
	\let\abnttable@captionparam\@undefined%
	\RenewDocumentCommand{\caption}{o m}{
		\IfNoValueTF{##1}{}{
			\gdef\abnttable@captionargs{##1}%
		}
		\gdef\abnttable@captionparam{##2}%
	}%
	%
	\LetLtxMacro{\abnttable@fonte}{\fonte}%
	\let\abnttable@sourceargs\fontename%
	\let\abnttable@sourceparam\ownership%
	\renewcommand{\fonte}[2][\fontename]{%
		\gdef\abnttable@sourceargs{##1}%
		\gdef\abnttable@sourceparam{##2}%
	}%
	%
	\let\abnttable@label\label%
	\let\abnttable@labelparam\@undefined%
	\renewcommand{\label}[1]{%
		\gdef\abnttable@labelparam{##1}%
	}%
	%
	% https://tex.stackexchange.com/questions/329359/subcaption-formatting-changes-when-using-standalone-documentclass/329560
	\let\abnttable@bsphack=\@bsphack
	\let\abnttable@esphack=\@esphack
	\abnttable@table[#1]%
	\centering%
	\begin{lrbox}{\abnttable@tablebox}%
		\begin{varwidth}{\textwidth}%{\dimexpr\textwidth-2\fboxsep-2\fboxrule}%
			\centering%
			\let\@bsphack=\abnttable@bsphack%
			\let\@esphack=\abnttable@esphack%
}{%
			\setlength{\baselineskip}{0pt}%
		\end{varwidth}%
	\end{lrbox}%
	\captionsetup{width=\wd\abnttable@tablebox, format = hang}%
	\begin{Spacing}{1.} %
		\@ifundefined{abnttable@captionparam}{}{
			\@ifundefined{abnttable@captionargs}{
				\abnttable@caption{\abnttable@captionparam}
			}{
				\abnttable@caption[\abnttable@captionargs]{\abnttable@captionparam}
			}
		}
		\@ifundefined{abnttable@labelparam}{}{
			\abnttable@label{\abnttable@labelparam}
		}
	\end{Spacing} %
	\usebox{\abnttable@tablebox}%
%	\frame{\usebox{\abnttable@tablebox}}%
	\setlength{\baselineskip}{0pt}%
	\abnttable@fonte[\abnttable@sourceargs]{\abnttable@sourceparam}%
	\abnttable@endtable%
}

\makeatother
