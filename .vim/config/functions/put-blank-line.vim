function! PutBlankLineAbove(ignore) abort
  " number of blank lines to add
  let l:count = v:count1
  " current cursor position
  let b:winsaveview = winsaveview()
  " keep cursor on original line of text
  let b:winsaveview.lnum = b:winsaveview.lnum + l:count
  " put v:count1 blank lines above current line
  for i in range(1, l:count)
    put! _
    call feedkeys(":call winrestview(b:winsaveview)\<CR>:echo ''\<CR>", 'n')
  endfor
endfunction

function! PutBlankLineBelow(ignore) abort
  " number of blank lines to add
  let l:count = v:count1
  " current cursor position
  let b:winsaveview = winsaveview()
  " put v:count1 blank lines below current line
  for i in range(1, l:count)
    put _
    call feedkeys(":call winrestview(b:winsaveview)\<CR>:echo ''\<CR>", 'n')
  endfor
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
