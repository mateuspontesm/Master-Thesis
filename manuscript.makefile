ALL_FIGURE_NAMES=$(shell cat manuscript.figlist)
ALL_FIGURES=$(ALL_FIGURE_NAMES:%=%.pdf)

allimages: $(ALL_FIGURES)
	@echo All images exist now. Use make -B to re-generate them.

FORCEREMAKE:

include $(ALL_FIGURE_NAMES:%=%.dep)

%.dep:
	mkdir -p "$(dir $@)"
	touch "$@" # will be filled later.

tikz/BLER.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/BLER" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/BLER.pdf: tikz/BLER.md5
tikz/manuscript-figure0.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure0" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure0.pdf: tikz/manuscript-figure0.md5
tikz/manuscript-figure1.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure1" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure1.pdf: tikz/manuscript-figure1.md5
tikz/manuscript-figure2.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure2" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure2.pdf: tikz/manuscript-figure2.md5
tikz/manuscript-figure3.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure3" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure3.pdf: tikz/manuscript-figure3.md5
tikz/manuscript-figure4.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure4" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure4.pdf: tikz/manuscript-figure4.md5
tikz/manuscript-figure5.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure5" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure5.pdf: tikz/manuscript-figure5.md5
tikz/manuscript-figure6.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure6" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure6.pdf: tikz/manuscript-figure6.md5
tikz/manuscript-figure7.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure7" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure7.pdf: tikz/manuscript-figure7.md5
tikz/manuscript-figure8.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure8" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure8.pdf: tikz/manuscript-figure8.md5
tikz/manuscript-figure9.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure9" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure9.pdf: tikz/manuscript-figure9.md5
tikz/manuscript-figure10.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure10" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure10.pdf: tikz/manuscript-figure10.md5
tikz/manuscript-figure11.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure11" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure11.pdf: tikz/manuscript-figure11.md5
tikz/manuscript-figure12.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure12" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure12.pdf: tikz/manuscript-figure12.md5
tikz/manuscript-figure13.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure13" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure13.pdf: tikz/manuscript-figure13.md5
tikz/manuscript-figure14.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure14" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure14.pdf: tikz/manuscript-figure14.md5
tikz/manuscript-figure15.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure15" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure15.pdf: tikz/manuscript-figure15.md5
tikz/manuscript-figure16.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure16" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure16.pdf: tikz/manuscript-figure16.md5
tikz/manuscript-figure17.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure17" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure17.pdf: tikz/manuscript-figure17.md5
tikz/manuscript-figure18.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure18" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure18.pdf: tikz/manuscript-figure18.md5
tikz/manuscript-figure19.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure19" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure19.pdf: tikz/manuscript-figure19.md5
tikz/manuscript-figure20.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure20" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure20.pdf: tikz/manuscript-figure20.md5
tikz/manuscript-figure21.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure21" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure21.pdf: tikz/manuscript-figure21.md5
tikz/manuscript-figure22.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure22" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure22.pdf: tikz/manuscript-figure22.md5
tikz/manuscript-figure23.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure23" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure23.pdf: tikz/manuscript-figure23.md5
tikz/manuscript-figure24.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure24" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure24.pdf: tikz/manuscript-figure24.md5
tikz/manuscript-figure25.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure25" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure25.pdf: tikz/manuscript-figure25.md5
tikz/manuscript-figure26.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure26" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure26.pdf: tikz/manuscript-figure26.md5
tikz/manuscript-figure27.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure27" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure27.pdf: tikz/manuscript-figure27.md5
tikz/manuscript-figure28.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure28" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure28.pdf: tikz/manuscript-figure28.md5
tikz/manuscript-figure29.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure29" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure29.pdf: tikz/manuscript-figure29.md5
tikz/manuscript-figure30.pdf: 
	pdflatex -halt-on-error -interaction=batchmode -jobname "tikz/manuscript-figure30" "\def\tikzexternalrealjob{manuscript}\input{manuscript}"

tikz/manuscript-figure30.pdf: tikz/manuscript-figure30.md5
