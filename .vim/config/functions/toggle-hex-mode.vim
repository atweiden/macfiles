function! ToggleHexMode() abort
  setlocal binary
  setlocal noendofline
  if get(b:, 'hexmode', 0)
    :%!xxd -r
    let b:hexmode = 0
  else
    :%!xxd
    let b:hexmode = 1
  endif
endfunction

command! ToggleHexMode call ToggleHexMode()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
