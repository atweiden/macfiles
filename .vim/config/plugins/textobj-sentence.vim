augroup textobj_sentence
  autocmd!
  autocmd FileType markdown call textobj#sentence#init()
  autocmd FileType textile call textobj#sentence#init()
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
