function! DeleteCharRight(ignore)
  " number of characters to delete
  let l:count = v:count ? v:count : 1

  " current cursor position
  let b:winsaveview = winsaveview()

  " current line position
  let l:curpos = col(".")
  let l:eolpos = col("$") - 1

  " if requested number of characters to delete is greater than remaining
  " number of characters on current line
  if l:count > l:eolpos - l:curpos
    " delete characters beginning from one character to the right of
    " current cursor position until end of line
    normal ld$
  else
    execute 'normal! l' . l:count . 'x'
  endif

  " clear message line to workaround feedkeys silent incompatibility
  call feedkeys(":call SilentRestoreView()\<CR>", 'n')
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
