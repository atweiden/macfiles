set tabstop=4
set softtabstop=4
set shiftwidth=4
set matchpairs+=<:>
set matchpairs+=«:»
set matchpairs+=「:」

if has('digraphs')
  " (᚛) ogham feather mark
  digraph >\| 5787
  " (᚜) ogham reversed feather mark
  digraph <\| 5788
  " (⁅) left square bracket with quill
  digraph [- 8261
  " (⁆) right square bracket with quill
  digraph -] 8262
  " (∈) equivalent to `(elem)`: https://docs.raku.org/routine/(elem),%20infix%20%E2%88%88
  digraph (- 8712
  " (∉) equivalent to `!(elem)`: https://docs.raku.org/routine/%E2%88%89
  digraph (/ 8713
  " (∋) equivalent to `(cont)`: https://docs.raku.org/routine/(cont),%20infix%20%E2%88%8B
  digraph -) 8715
  " (∌) equivalent to `!(cont)`: https://docs.raku.org/routine/%E2%88%8C
  digraph /) 8716
  " (∖) equivalent to `(-)`: https://docs.raku.org/routine/(-),%20infix%20%E2%88%96
  digraph \\ 8726
  " (∩) equivalent to `(&)`: https://docs.raku.org/routine/(&),%20infix%20%E2%88%A9
  digraph (U 8745
  " (∪) equivalent to `(|)`: https://docs.raku.org/routine/(%7C),%20infix%20%E2%88%AA
  digraph )U 8746
  " (≅) equivalent to `=~=`: https://docs.raku.org/routine/=~=
  digraph =~ 8773
  " (≼) equivalent to `(<+)`: https://docs.raku.org/language/unicode_ascii#index-entry-%E2%89%BC
  digraph <+ 8828
  " (≽) equivalent to `(+>)`: https://docs.raku.org/language/unicode_ascii#index-entry-%E2%89%BD
  digraph +> 8829
  " (⊂) equivalent to `(<)`: https://docs.raku.org/routine/(%3C),%20infix%20%E2%8A%82
  digraph (c 8834
  " (⊃) equivalent to `(>)`: https://docs.raku.org/routine/(%3E),%20infix%20%E2%8A%83
  digraph )c 8835
  " (⊄) equivalent to `!(<)`: https://docs.raku.org/routine/%E2%8A%84
  digraph c/ 8836
  " (⊅) equivalent to `!(>)`: https://docs.raku.org/routine/%E2%8A%85
  digraph \c 8837
  " (⊆) equivalent to `(<=)`: https://docs.raku.org/routine/(%3C=),%20infix%20%E2%8A%86
  digraph (_ 8838
  " (⊇) equivalent to `(>=)`: https://docs.raku.org/routine/(%3E=),%20infix%20%E2%8A%87
  digraph )_ 8839
  " (⊈) equivalent to `!(<=)`: https://docs.raku.org/routine/%E2%8A%88
  digraph _/ 8840
  " (⊉) equivalent to `!(>=)`: https://docs.raku.org/routine/%E2%8A%89
  digraph \_ 8841
  " (⊍) equivalent to `(.)`: https://docs.raku.org/routine/(.),%20infix%20%E2%8A%8D
  digraph U. 8845
  " (⊎) equivalent to `(+)`: https://docs.raku.org/routine/(+),%20infix%20%E2%8A%8E
  digraph U+ 8846
  " (⊖) equivalent to `(^)`: https://docs.raku.org/routine/($CIRCUMFLEX_ACCENT),%20infix%20%E2%8A%96
  digraph 0- 8854
  " (⟅) left s-shaped bag delimiter
  digraph s\ 10181
  " (⟆) right s-shaped bag delimiter
  digraph s/ 10182
endif

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
