" Credit: nathanaelkane/vim-indent-guides/autoload/indent_guides.vim

function! ToggleIndentGuides() abort
  call indent_guides#init_matches()
  if empty(w:indent_guides_matches)
    call SetListCharsTabInvisible()
    call SetListCharsRemaining()
    call indent_guides#enable()
  else
    call indent_guides#disable()
    call SetListCharsTabVisible()
    call SetListCharsRemaining()
  endif
endfunction

command! ToggleIndentGuides call ToggleIndentGuides()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
