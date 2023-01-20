vim9script

# Credit: http://vimcasts.org/episodes/tabs-and-spaces/
export def TabstopSummarize(): void
  try
    echohl ModeMsg
    echon 'tabstop=' .. &l:tabstop
    echon ' shiftwidth=' .. &l:shiftwidth
    echon ' softtabstop=' .. &l:softtabstop
    if &l:expandtab
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
enddef

# set tabstop, softtabstop and shiftwidth to the same value
export def TabstopSet(): void
  var tabstop = 1 * str2nr(input('set tabstop = softtabstop = shiftwidth = '))
  if tabstop > 0
    &l:softtabstop = tabstop
    &l:tabstop = tabstop
    &l:shiftwidth = tabstop
  endif
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
