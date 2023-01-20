vim9script

export def ToggleLaststatus(): void
  if &laststatus == 2
    set laststatus=0
  else
    set laststatus=2
  endif
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
