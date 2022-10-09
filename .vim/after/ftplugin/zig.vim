setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal formatprg=fmt\ --width=99

nnoremap <silent> <buffer> <localleader>> :call zig#fmt#Format()<CR>

highlight clear zigComparatorWord
highlight link zigComparatorWord Operator
highlight clear zigStringDelimiter
highlight link zigStringDelimiter Delimiter

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
