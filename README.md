**Table of Contents**  *generated with [DocToc](http://doctoc.herokuapp.com/)*

- [wsi - Wahrscheinlichkeitstheorie und Stochastische Prozesse für Informatik](#wsi---wahrscheinlichkeitstheorie-und-stochastische-prozesse-für-informatik)
	- [first steps](#first-steps)
		- [installieren der benötigten software](#installieren-der-benötigten-software)
		- [clone repository](#clone-repository)
		- [dokumente aus den sourcen bauen](#dokumente-aus-den-sourcen-bauen)
	- [wichtige content-container](#wichtige-content-container)
		- [satz](#satz)
		- [hilfssatz](#hilfssatz)
		- [definition](#definition)
		- [bsp](#bsp)
		- [attention](#attention)
	- [indexieren](#indexieren)
		- [indexeintrag erstellen](#indexeintrag-erstellen)
		- [untereintrag erstellen](#untereintrag-erstellen)
		- [2-deutigkeiten](#2-deutigkeiten)
	- [symbolverzeichnis](#symbolverzeichnis)
	- [übungsbeispiele erstellen](#übungsbeispiele-erstellen)
		- [übungsbeispiele erstellen:](#übungsbeispiele-erstellen)
		- [übungsbeispiele in das übungsdokument einfügen:](#übungsbeispiele-in-das-übungsdokument-einfügen)
		- [übungsbeispiele in das skriptum einfügen:](#übungsbeispiele-in-das-skriptum-einfügen)
		- [übungsbeispiele richtig verlinken](#übungsbeispiele-richtig-verlinken)
	- [git howto:](#git-howto)
		- [erstellen eines GitHub-accounts](#erstellen-eines-github-accounts)
		- [dateien unter versionskontrolle stellen:](#dateien-unter-versionskontrolle-stellen)
		- [einen neuen commit erstellen](#einen-neuen-commit-erstellen)
		- [neuigkeiten vom server holen](#neuigkeiten-vom-server-holen)
		- [die letzten commits auf den server spielen:](#die-letzten-commits-auf-den-server-spielen)

wsi - Wahrscheinlichkeitstheorie und Stochastische Prozesse für Informatik
==========================================================================

ich weiß, dass man für gewöhnlich keine pdf's in ein repository gibt, jedoch ist das hier eine meiner meinung nach begründete ausnahme, denn zum bauen braucht man mind. eine minute und 2. man muss ein paar pakete installiert haben.

um nun trotzdem das pdf gleich direkt ansehen zu können, habe ich es in das repository gegeben (wohlwissend, dass es dabei zu öfteren konflikten kommen kann).

first steps
-----------

### installieren der benötigten software ###
als erstes sollte man git und latex installieren:

    apt-get install texlive texlive-latex-extra texlive-latex-recommended texlive-lang-german texlive-extra-utils git

### clone repository ###
    
    git clone https://github.com/gigaarray/wsi_bsp.git

### dokumente aus den sourcen bauen ###
grundsätzlich gibt es 4 dokumente, die wären das skriptum(einmal mit und einmal ohne übungsbeispiele), ein dokument, in dem nur übungsbeispiele vorkommen und die Prüfung vom 10.03.14

am besten baut man gleich am anfgang alles mit 

    make clean all

dabei wird neben dem skriptum samt dem durchsuchbaren index auch noch alles andere erzeugt.

man kann aber auch, wie von latex gewohnt mit pdflatex und makeindex arbeiten. also z.b.: 

    pdflatex wsi.tex
    makeindex -s wsi.ist -t wsi.slg -o wsi.syi wsi.syg
    makeindex -g -s style.mki wsi.idx
    bibtex wsi
    pdflatex wsi.tex


wichtige content-container
--------------------------
ich weiß es nicht wie ich es sonst nennen sollte: 
sie sind alle in der style.sty definiert, falls ihr sie ändern wollt/müsst.

### satz ###

    \begin{satz}\index{indexeintrag nicht vergessen}
        irgend ein schlauer satz
    \end{satz}

### hilfssatz ###
siehe satz (jedoch kaum verwendet)

### definition ###

    \begin{definition}\index{index nicht vergessen}
        irgend eine definition von einem tollen symbol \gls{symb:SYMBOL}:
    \end{definition}

### bsp ###

    \begin{bsp}
        ein kurzes!!! beispiel zur erklärung, komplette übungsbeispiele bitte nicht hier!
        siehe übungsbeispiele
    \end{bsp}

### attention ###

    \attention{irgendwas worauf man acht geben muss! sollte nicht zu lang sein.}


indexieren
----------
### indexeintrag erstellen ###
grundsätzlich lässt sich mit 

    \index{Indexname}
    %im index steht anschließend: Statistik...seite

ein einfacher indexeintrag erstellen und mit

    \index{Statistik|(} %definiert den anfang des eintrags Statistik
    \index{Statistik|)} %definiert das ende des eintrags Statistik
    %im index steht anschließend: Statistik...anfang-ende

ein eintrag über mehrere seiten.

### untereintrag erstellen ###
wenn es beispielsweise ein beispiel aus der übung zu einem satz, oder einer definition gibt, kann man beide über einen index-untereintrag miteinander verlinken: z.B:

    \index{bedingte Wahrscheinlichkeit!Beispiel} %definiert einen untereintrag
    %im index steht anschließend: bedingte wahrscheinlichkeit...seite
    %                                   Beispiel...seite

    \index{Schätzer!Eigenschaften} %definiert einen untereintrag
    %im index steht anschließend: schätzer...seite
    %                                   eigenschaften...seite

### 2-deutigkeiten ###
sollte es 2-deutige namen geben z.B. "Axiome von Kolmogorov" und "Kolmogorov-Axiome" sollte man sich auf einen namen festlegen und die 2. bedeutung auf die 1. zeigen lassen: (hat den vorteil, dass man beispielsweise die übungsbeispiele nicht auf beide bedeutungen zeigen lassen muss)
 
    \index{Axiome von Kolmogorov|see{Kolmogorov-Axiome}} %doppeleinträge
    %im index steht anschließend: Axiome von Kolmogorov siehe Kolmogorov-Axiome


symbolverzeichnis
-----------------
das symbolverzeichnis wächst leider auch nicht von selbst, ist aber ebenfalls sehr einfach:
einfach einen entsprechenden symboleintrag in der symbols.tex erstellen:

    \newglossaryentry{symb:NAME}{
        name=$\NAME$,
        description={DESC},
        sort=symbolNAME, type=symbolslist
    }

abschließend noch bei der erklärung des symbols einfach bei der Erklärung eines neuen Symbols statt $\NAME$ einfach \gls{symb:NAME} verwenden. dann erscheint das symbol beim nächsten mal, wenn das pdf erstellt wird im symbolverzeichnis.


übungsbeispiele erstellen
-------------------------

### übungsbeispiele erstellen: ###
am besten jedes beispiel in ein dokument z.B:

    \begin{uebsp}
    \begin{Exercise}
        irgendeine extrem schwere angabe
    \end{Exercise}
    \begin{Answer}
     \begin{uebsp_theory}
    \end{uebsp_theory}

        \begin{uebsp_theory}
            irgendeine definition, oder einen satz den man braucht, kurz erwähnt, evtl. mit referenz zu der theorie im skriptum
        \end{uebsp_theory}

        \begin{uebsp_theory}
            noch irgendeine definition, oder einen satz den man braucht, kurz erwähnt, evtl. mit referenz zu der theorie im skriptum
        \end{uebsp_theory}

        irgendeine extrem schlaue rechnung
    \end{Answer}
    \end{uebsp}

in den übungsbeispielen sollten immer nur kurze theoretische hintergründe stehen, dafür gibts den typ uebsp_theory:

### übungsbeispiele in das übungsdokument einfügen: ###
die einzelnen übungsbeispiele befinden sich im ordner examples.

zum einfügen eines übungsbeispiels in das übungsbeispiel-dokument muss folgende zeile in uebl.tex eingefügt werden (wobei X und Y entsprechend mit dem übungsblatt und der nummer auf dem übungsblatt ersetzt werden müssen):

    \input{examples/roundX/bspY.tex}

sollte man gerade das erste übungsbeispiel eines übungsblattes (2. übung, 3. übung, usw.)  einfügen wollen, so muss man vor dem input noch die folgende zeile einfügen:

    \newExercPage

am besten man orientiert sich an den bereits gemachten übungsbeispielen.


### übungsbeispiele in das skriptum einfügen: ###
die einzelnen übungsbeispiele befinden sich im ordner examples.

zum einfügen eines übungsbeispiels in das skriptum muss folgende zeile in wsi.tex eingefügt werden (wobei X und Y entsprechend mit dem übungsblatt und der nummer auf dem übungsblatt ersetzt werden müssen):

    \input{examples/roundX/bspY.tex}

ich denke, dass die richtige stelle für das übungsbeispiel das scriptum am ende der section, die das thema des übungsbeispiels behandelt, wäre.

ebenso wie im übungsbeispieldokument gilt auch im skriptum, dass makiert werden muss, wo das neue übungsblatt beginnt: 

    \newExercPage


### übungsbeispiele richtig verlinken ###
um beispielsweise einen satz oder eine definition aus dem skriptum zu verwenden, muss dieser im skriptum als label deklariert werden (siehe z.b. bedingte Wahrscheinlichkeit) außerdem sollte er, wenn man an so einem satz/def. vorbeikommt diesen in den index des skriptums geben:

    \label{def:bedingte_wahrscheinlichkeit}
    \index{bedingte Wahrscheinlichkeit}
    \index{Wahrscheinlichkeit, bedingte|see{bedingte Wahrscheinlichkeit}}

im obigen beispiel sieht man beispielsweise die vorgangsweise bei titeln mit mehreren worten: hier sollte man 2 index-einträge erstellen: den einen mit 'bedingte Wahrscheinlichkeit' und den anderen mit 'Wahrscheinlichkeit, bedingte', jedoch verweisend auf den ersten eintrag.

nun kann man mit dem label 'def:bedingte_wahrscheinlichkeit' in dem übungsbeispiel referenzieren:

    Mit der \reference{Bedingten Wahrscheinlichkeit}{Definition}{def:bedingte_wahrscheinlichkeit} ...

wobei der erste parameter von \reference der angezeigte name ist, der 2. parameter gibt an, ob es sich um einen Satz oder eine Definition handelt und der 3. parameter gibt das label an.

abschließend sollte man nicht vergessen, das übungsbeispiel auch in den index zu geben:

    \index{bedingte Wahrscheinlichkeit!Beispiel}

dieser index-eintrag gibt an, dass als unterpunkt zu bedingte Wahrscheinlichkeit ein beispiel existiert.

git howto:
----------

### erstellen eines GitHub-accounts ###
um änderungen auf den server zurückspielen zu können, muss man sich einen account bei gitHub erstellen,
dieser muss dann noch für das repository freigeschalten werden.

### dateien unter versionskontrolle stellen: ###
einfach beliebig viele dateien angeben.

    git add file1 file2 file3

### einen neuen commit erstellen ###
mit der option -a werden alle dateien, die unter versionskontrolle stehen in den commit miteinbezogen.
mit der option -m kann gleich beim commit eine commit-message angegeben werden und man wird nicht ständig nach der message gefragt.

    git commit -a -m "Commit-Message"

### neuigkeiten vom server holen ###
um das repository immer up-to-date zu halten, muss man nur das folgende kommando angeben:
    
    git pull

### die letzten commits auf den server spielen: ###
um commits auf den server spielen zu können, benötigt man einen github-account. sobald dieser account für wsi freigeschalten wurde, kann man auch änderungen auf den server pushen.

<b>WICHTIG! bevor man auf den server pusht, muss man ein git pull machen!</b>
anschließend kann man mit git push origin master die letzten noch nicht öffentlichen commits auf den server spielen.

    #zuerst einmal einen commit erstellen, mit dem zeug, was man hochladen will...
    git commit -a -m "added new fancy stuff"

    #anschließend hole ich mir die neuigkeiten vom server (WICHTIG!)
    git pull

    #punkt A:
    #meist gibts dann hier irgendwelche konflikte zu lösen, wenn nicht, gehts weiter bei Punkt B
    #konflikte in binaries kann git nicht resolven, daher muss man hier selbst hand anlegen, 
    #konflikte in textdateien müssen jedoch auch manchmal händisch gelöst werden.
    #konflikte in den textdateien kann man finden, indem man nach "=====" sucht:
    #dabei gilt grundsätzlich: das über dem "=====" sind deine änderungen
    #das unter dem "=====" sind die änderungen vom server.
    #hier bitte sehr genau die änderungen rausholen, nicht einfach nur das eigene nehmen.
    #abschließend die files, die zu konflikten geführt haben mit git add als resolved markieren
    #dann wieder einen commit machen und hoffen, dass sich in der zwischenzeit nicht wieder die version
    #am server geändert hat, sonst beginnt das prozedere wieder von vorne.
    git pull
    
    #punkt B: erst, wenn es jetzt keine konflikte mehr gibt, darf man pushen, sonst gehts wieder von punkt A weiter.
    git push origin master
