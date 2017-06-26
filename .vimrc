" to avoid side effects when reloading vimrc, only set nocp when needed
if &compatible | set nocompatible | endif

let $VIMPATH=expand('~/.vim')
let $CFGPATH=$VIMPATH.'/config'

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

if has('nvim')
  call s:source_cfg('neovim-terminal.vim')
endif

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
