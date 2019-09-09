function! ToggleFindNerd()
  if IsNERDTreeOpen()
    execute ':NERDTreeToggle'
  else
    execute ':NERDTreeFind'
  endif
endfunction

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
