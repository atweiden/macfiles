function! ToggleVirtualedit() abort
  if &l:virtualedit ==# "block"
    setlocal virtualedit=all
  else
    setlocal virtualedit=block
  endif
  " echo virtualedit mode
  setlocal virtualedit?
endfunction

command! ToggleVirtualedit call ToggleVirtualedit()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
