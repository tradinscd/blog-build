" This script converts raw LaTeX to a Jekyll-supported post.

%s/\\section{\(.*\)\.}/## \1\r\r/
%s/\\subsection{\(.*\)\.}/### \1\r\r/

%s/\$/$$/
%s/\\begin{equation\*}/\r$$/
%s/\\end{equation\*}/$$\r/
%s/``/"/
%s/''/"/

" Katex limitations
%s/\\widehat{\(.*\)}/\\hat{\1}/
%s/</\\prec/
%s/\~/ /
%s/{\\rm /{/

" From custom preamble
%s/\\parhead{\(.*\)\.}/__\1.__/
%s/\\g /\\mid /
%s/\\g\\/\\mid\\/
%s/\\mb\([A-Za-z]\)/\\mathbf{\1}/

" Natbib citations
%s/\\citep{\([A-Za-z0-9 ]\+\)}/{% cite \1 --file 2016-09-19 %}
%s/\\citet{\([A-Za-z0-9 ]\+\)}/{% cite \1 --style apa-text --file 2016-09-19 %}

" MANUAL/PARTIAL SOLUTIONS
" align*
%s/\\begin{align\*}/\r$$/
" then search for &= and //
%s/\\end{align\*}/$$\r/
\/\//\r$$/

" citep/citet with commas in key (multiple citations)
" inside the key, replace ',' with ' '
" then run above

" glossaries
" First time, expand glossary manually.
" \Acrlong{},\acrlong{},\glsreset{}
" This assumes the short command is the same as the abbreviation.
%s/\\gls{\([A-Za-z]\+\)}/<span style="font-variant:small-caps;">\L\1<\/span>/
%s/\\acrshort{\([A-Za-z]\+\)}/<span style="font-variant:small-caps;">\L\1<\/span>/
%s/\\Acrshort{\([A-Za-z]\)\([A-Za-z]*\)}/<span style="font-variant:small-caps;">\U\1\L\2<\/span>/

" figures
![]({{site.baseurl}}/assets/2016-09-19-figure.png)
_<center>Top: Old frontpage. Bottom: New frontpage.</center>_
<center>
<img src="{{site.baseurl}}/assets/2016-09-19-figure.png" style="width:200px;"/>
</center>
_Figure 1.
A hierarchical model, with latent variables $$\alpha_k$$ defined locally
per group and latent variables $$\phi$$ defined globally to be shared across groups._

" The following must also be done manually.
" cref
