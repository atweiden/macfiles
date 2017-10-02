function! ToggleConceal()
  if &conceallevel == 0
    setlocal conceallevel=2
  else
    setlocal conceallevel=0
  endif
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
