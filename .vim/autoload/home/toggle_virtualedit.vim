vim9script

export def ToggleVirtualedit(): void
  if &virtualedit ==# "block"
    set virtualedit=all
  else
    set virtualedit=block
  endif
  # echo virtualedit mode
  set virtualedit?
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
