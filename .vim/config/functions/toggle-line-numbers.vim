function! ToggleLineNumbers() abort
  if &number == &relativenumber
    set nonumber! norelativenumber!
  else
    set nonumber norelativenumber
  endif
endfunction

command! ToggleLineNumbers call ToggleLineNumbers()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
