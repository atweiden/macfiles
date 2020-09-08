function! DeleteCharRight(ignore) abort
  " current cursor position
  let b:winsaveview = winsaveview()

  " current line position
  let l:curpos = col(".")
  let l:eolpos = col("$") - 1

  " beginning one character to the right of current cursor position,
  " delete lesser of v:count1 or remaining number of characters on
  " current line
  execute printf('keeppatterns .s/\%%%sc%s//e',
            \ l:curpos + 1,
            \ repeat('.', min([v:count1, l:eolpos - l:curpos])))

  " restore cursor position dot-repeatably, clearing message line to
  " workaround feedkeys silent incompatibility
  call feedkeys(":call winrestview(b:winsaveview)\<CR>:echo ''\<CR>", 'n')
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
