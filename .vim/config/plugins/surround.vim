" disable insert mode mappings
let g:surround_no_insert_mappings = 1

" disable automatic re-indenting
let g:surround_indent = 0

" before | key in | after
" 'word' |  yssa  | «'word'»
let g:surround_97 = "«\r»"

" before | key in | after
" 'word' |  yssA  | « 'word' »
let g:surround_65 = "« \r »"

" before | key in | after
" 'word' |  yssb  | 「'word'」
let g:surround_98 = "「\r」"

" before | key in | after
" 'word' |  yssB  | 「 'word' 」
let g:surround_66 = "「 \r 」"

" before | key in | after
" 'word' |  yssc  | <['word']>
let g:surround_99 = "<[\r]>"

" before | key in | after
" 'word' |  yssC  | <[ 'word' ]>
let g:surround_67 = "<[ \r ]>"

" before | key in | after
" 'word' |  yssd  | ᚛'word'᚜
let g:surround_100 = "᚛\r᚜"

" before | key in | after
" 'word' |  yssD  | ᚛ 'word' ᚜
let g:surround_68 = "᚛ \r ᚜"

" before | key in | after
" 'word' |  ysse  | ⁅'word'⁆
let g:surround_101 = "⁅\r⁆"

" before | key in | after
" 'word' |  yssE  | ⁅ 'word' ⁆
let g:surround_69 = "⁅ \r ⁆"

" before | key in | after
" 'word' |  ysss  | ⟅'word'⟆
let g:surround_115 = "⟅\r⟆"

" before | key in | after
" 'word' |  yssS  | ⟅ 'word' ⟆
let g:surround_83 = "⟅ \r ⟆"

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
