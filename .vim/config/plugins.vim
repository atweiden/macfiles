for fpath in split(globpath($CFGPATH.'/plugins', '*.vim'), '\n')
  execute 'source' fpath
endfor

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
