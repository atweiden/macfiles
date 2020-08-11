function! ToggleConceal()
  if &l:conceallevel == 0
    setlocal conceallevel=2
  else
    setlocal conceallevel=0
  endif
endfunction

command! ToggleConceal call ToggleConceal()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
