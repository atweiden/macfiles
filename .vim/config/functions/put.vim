function! PutBlankLineAbove() abort
  let l:count = v:count ? v:count : 1
  normal m`
  for i in range(1, l:count)
    put! _
  endfor
  normal ``
  execute ":normal \<Left>"
endfunction

function! PutBlankLineBelow() abort
  let l:count = v:count ? v:count : 1
  normal m`
  for i in range(1, l:count)
    put _
  endfor
  normal ``
  execute ":normal \<Left>"
endfunction

nnoremap <silent> <Plug>PutBlankLineAbove :<C-U>call PutBlankLineAbove()<CR>
  \ :call repeat#set("\<Plug>PutBlankLineAbove")<CR>

nnoremap <silent> <Plug>PutBlankLineBelow :<C-U>call PutBlankLineBelow()<CR>
  \ :call repeat#set("\<Plug>PutBlankLineBelow")<CR>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
