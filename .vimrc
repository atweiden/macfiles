set nocompatible

let $VIMPATH=expand('~/.vim')
let $CFGPATH=$VIMPATH.'/config'
let $FUNPATH=$VIMPATH.'/functions'

function! s:source_cfg(path)
  execute 'source' fnameescape($CFGPATH.'/'.a:path)
endfunction

call s:source_cfg('base.vim')
call s:source_cfg('plug.vim')
call s:source_cfg('functions.vim')
call s:source_cfg('display.vim')
call s:source_cfg('editing.vim')
call s:source_cfg('shortcuts.vim')
call s:source_cfg('filetypes.vim')
call s:source_cfg('plugins.vim')

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
