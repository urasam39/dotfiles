$latex = 'platex %O -src-specials -shell-escape -synctex=1 -interaction=errorstopmode %O %S -kanji=utf8';
$pdflatex = 'lualatex -synctex=1 -file-line-error -halt-on-error -interaction=nonstopmode %O %S';
$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex = 'pbibtex %O %B';
$makeindex = 'mendex %O -U -o %D %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$dvips = 'dvips %O -z -f %S | convbkmk -u > %D';
$ps2pdf = 'ps2pdf %O %S %D';
$pdf_mode = 1;
@default_files = ("main");
if ($^O eq 'darwin') {
  $pvc_view_file_via_temporary = 0;
  $pdf_previewer = 'open -ga Preview.app';
  $pdf_update_method = 4;
#$pdf_update_command = 'open -a Preview.app %S; open -a MacVim.app';
 $pdf_update_command = 'open -a Preview.app %S; open -a iTerm.app';
} else {
  $pdf_previewer = 'xdg-open';
}
