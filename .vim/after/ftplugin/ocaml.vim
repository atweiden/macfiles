vim9script

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal formatprg=fmt\ --width=99

nnoremap <silent> <buffer> <localleader>> mz:%!ocamlformat --name=% -<CR>`z

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
