function! ToggleConceal() abort
  if &conceallevel == 0
    set conceallevel=2
  else
    set conceallevel=0
  endif
endfunction

command! ToggleConceal call ToggleConceal()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
