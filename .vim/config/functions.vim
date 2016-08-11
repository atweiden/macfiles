for fpath in split(globpath($FUNPATH, '*.vim'), '\n')
  execute 'source' fpath
endfor

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
