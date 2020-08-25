setlocal dictionary=$CFGPATH/dict/lua.base.dict

let g:fennel_highlight_aniseed = 0
let g:fennel_highlight_lume = 0
packadd vim-fennel
packadd rainbow_parentheses.vim
packadd vim-sexp
if has('nvim')
  packadd conjure
endif

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
