function! IsNERDTreeOpen() abort
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd() abort
  if IsNERDTreeOpen()
    execute ':NERDTreeToggle'
  else
    execute ':NERDTreeFind'
  endif
endfunction

command! ToggleFindNerd call ToggleFindNerd()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
