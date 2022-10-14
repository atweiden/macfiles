function! ToggleColors() abort
  if get(g:, 'colors_name') == 'preto'
    silent! colorscheme $COLORSCHEME
  else
    silent! colorscheme preto
  endif
endfunction

command! ToggleColors call ToggleColors()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
