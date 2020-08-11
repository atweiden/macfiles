function! ToggleCursorcolumnCursorline() abort
  if &l:cursorcolumn == &l:cursorline
    setlocal nocursorcolumn! nocursorline!
  else
    setlocal nocursorcolumn nocursorline
  endif
endfunction

command! ToggleCursorcolumnCursorline call ToggleCursorcolumnCursorline()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
