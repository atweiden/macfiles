vim9script

setlocal noexpandtab
setlocal foldmethod=syntax
setlocal foldlevel=3
setlocal formatprg=fmt\ --width=99

# allow formatting unsaved buffers
if '' != expand('%:t')
  nnoremap <silent> <buffer> <localleader>> :GoFmt<CR>
else
  nnoremap <silent> <buffer> <localleader>> mz:%!gofmt<CR>`z
endif

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
