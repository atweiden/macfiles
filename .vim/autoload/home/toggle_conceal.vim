vim9script

export def ToggleConceal(): void
  if &conceallevel == 0
    set conceallevel=2
  else
    set conceallevel=0
  endif
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
