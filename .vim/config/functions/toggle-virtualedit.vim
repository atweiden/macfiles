function! ToggleVirtualedit() abort
  if &virtualedit ==# "block"
    set virtualedit=all
  else
    set virtualedit=block
  endif
  " echo virtualedit mode
  set virtualedit?
endfunction

command! ToggleVirtualedit call ToggleVirtualedit()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
