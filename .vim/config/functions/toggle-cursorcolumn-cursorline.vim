function! ToggleCursorcolumnCursorline() abort
  if &cursorcolumn == &cursorline
    set nocursorcolumn! nocursorline!
  else
    set nocursorcolumn nocursorline
  endif
endfunction

command! ToggleCursorcolumnCursorline call ToggleCursorcolumnCursorline()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
