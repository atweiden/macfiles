function! ToggleLaststatus() abort
  if &l:laststatus == 2
    setlocal laststatus=0
  else
    setlocal laststatus=2
  endif
endfunction

command! ToggleLaststatus call ToggleLaststatus()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
