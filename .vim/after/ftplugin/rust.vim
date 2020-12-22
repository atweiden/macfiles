setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

nnoremap <silent> <buffer> <localleader>r :RustFmt<CR>
vnoremap <silent> <buffer> <localleader>r :'<,'>RustFmtRange<CR>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
