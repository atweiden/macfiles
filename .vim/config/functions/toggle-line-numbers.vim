function! ToggleLineNumbers() abort
  if &l:number == &l:relativenumber
    setlocal nonumber! norelativenumber!
  else
    setlocal nonumber norelativenumber
  endif
endfunction

command! ToggleLineNumbers call ToggleLineNumbers()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
