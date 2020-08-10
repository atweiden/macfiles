function! PlugSetup(plugin) abort
  execute 'source' $CFGPATH . '/plugins/lazy/' . a:plugin . '.vim'
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
