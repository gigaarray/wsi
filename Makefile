PT=pdflatex
IDX=makeindex
BIBX=bibtex

all: wsi.pdf
all: wsi_bsp.pdf
all: uebl.pdf
all: pruefung_04_03_14.pdf

uebl.pdf:
	${PT} uebl.tex
	${PT} uebl.tex
	${PT} uebl.tex

wsi.pdf:
	${PT} -shell-escape "\input{wsi.tex}"
	${IDX} -s wsi.ist -t wsi.slg -o wsi.syi wsi.syg
	${IDX} -g -s style.mki wsi.idx
	${BIBX} wsi
	${PT} -shell-escape "\input{wsi.tex}"
	${PT} -shell-escape "\input{wsi.tex}"
	${PT} -shell-escape "\input{wsi.tex}"
	${PT} -shell-escape "\input{wsi.tex}"   #yeah, this looks to much, but i experienced, that 3-times is not enough

wsi_bsp.pdf:
	${PT} -shell-escape -jobname=wsi_bsp "\def\uebsps{1}\input{wsi.tex}"
	${IDX} -s wsi_bsp.ist -t wsi_bsp.slg -o wsi_bsp.syi wsi_bsp.syg
	${IDX} -g -s style.mki wsi_bsp.idx
	${BIBX} wsi_bsp
	${PT} -shell-escape -jobname=wsi_bsp "\def\uebsps{1}\input{wsi.tex}"
	${PT} -shell-escape -jobname=wsi_bsp "\def\uebsps{1}\input{wsi.tex}"
	${PT} -shell-escape -jobname=wsi_bsp "\def\uebsps{1}\input{wsi.tex}"
	${PT} -shell-escape -jobname=wsi_bsp "\def\uebsps{1}\input{wsi.tex}"

pruefung_04_03_14.pdf:
	${PT} pruefung_04_03_14.tex
	${PT} pruefung_04_03_14.tex
	${PT} pruefung_04_03_14.tex

update-toc:
	doctoc .

clean:
	rm -rf *.aux *.log *.toc *.pdf *.idx *.out *.ilg *.ind *.slg *.ist *.syi *.gnuplot *.glo *.syg *.table
