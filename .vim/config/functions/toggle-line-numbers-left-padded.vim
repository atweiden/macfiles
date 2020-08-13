function! ToggleLineNumbersLeftPadded() abort
  call ToggleLineNumbers()
  call ToggleLeftPadding()
endfunction

command! ToggleLineNumbersLeftPadded call ToggleLineNumbersLeftPadded()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
