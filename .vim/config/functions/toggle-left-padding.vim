function! EnableLeftPadding() abort
  highlight clear FoldColumn
  highlight FoldColumn ctermfg=bg ctermbg=bg guifg=bg guibg=bg
  set foldcolumn=1
endfunction

function! DisableLeftPadding() abort
  " restore FoldColumn highlighting to original with :q
  highlight clear FoldColumn
  set foldcolumn=0
endfunction

function! ToggleLeftPadding() abort
  if &foldcolumn == 0
    call EnableLeftPadding()
  else
    call DisableLeftPadding()
  endif
endfunction

command! ToggleLeftPadding call ToggleLeftPadding()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
