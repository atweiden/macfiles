function! Indent(ignore)
  let l:count = v:count ? v:count : 1
  let b:winsaveview = winsaveview()
  for i in range(1, l:count)
    >
  endfor
  " clear message line to workaround feedkeys silent incompatibility
  call feedkeys(":call SilentRestoreView()\<CR>", 'n')
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
