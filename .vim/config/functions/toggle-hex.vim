let $in_hex=0
function! ToggleHex() abort
  setlocal binary
  setlocal noeol
  if $in_hex>0
    :%!xxd -r
    let $in_hex=0
  else
    :%!xxd
    let $in_hex=1
  endif
endfunction

command! ToggleHex call ToggleHex()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
