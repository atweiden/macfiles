vim9script

export def ToggleCursorcolumnCursorline(): void
  if &cursorcolumn == &cursorline
    set nocursorcolumn! nocursorline!
  else
    set nocursorcolumn nocursorline
  endif
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
