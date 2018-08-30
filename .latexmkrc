$pdf_mode = 1;
$pdflatex = "pdflatex -f -synctex=1 -src-specials -interaction=nonstopmode " .
            "-file-line-error-style %S";
$clean_ext = "out log bbl fff ttt fls fdb_latexmk aux synctex synctex.gz tex.blg run.xml nav snm blg";
