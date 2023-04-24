vim9script

# keep synced with go.vim

setlocal noexpandtab
setlocal foldmethod=syntax
setlocal foldlevel=3
setlocal formatprg=fmt\ --width=99

# allow formatting unsaved buffers
nnoremap <silent> <buffer> <localleader>> :GoModFmt<CR>

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
