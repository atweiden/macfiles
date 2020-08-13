function! ToggleLeftPadding() abort
  if &foldcolumn == 0
    highlight clear FoldColumn
    highlight FoldColumn ctermfg=bg ctermbg=bg guifg=bg guibg=bg
    set foldcolumn=1
  else
    " restore FoldColumn highlighting to original with :q
    highlight clear FoldColumn
    set foldcolumn=0
  endif
endfunction

command! ToggleLeftPadding call ToggleLeftPadding()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
