vim9script

export def ToggleColors(): void
  if get(g:, 'colors_name') == 'preto'
    silent! colorscheme $COLORSCHEME
  else
    silent! colorscheme preto
  endif
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
