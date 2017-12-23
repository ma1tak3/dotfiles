#!/usr/bin/env perl
$latex = 'platex %O -kanji=utf8 -no-guess-input-enc -synctex=1 %S';
$pdflaetx = 'pdflatex %O -synctex=1 %S';
$bibtex = 'pbibtex %O %B';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'mendex % -o %D %S';
$max_repeat = 10;
$pdf_previewer = '"C:\Program Files\SumatraPDF\SumatraPDF.exe" -reuse-instance %O %S';
