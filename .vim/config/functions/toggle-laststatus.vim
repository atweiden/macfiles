function! ToggleLaststatus() abort
  if &laststatus == 2
    set laststatus=0
  else
    set laststatus=2
  endif
endfunction

command! ToggleLaststatus call ToggleLaststatus()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
