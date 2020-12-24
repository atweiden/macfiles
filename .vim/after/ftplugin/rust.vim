setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

nnoremap <silent> <buffer> <localleader>r :RustFmt<CR>
vnoremap <silent> <buffer> <localleader>r :'<,'>RustFmtRange<CR>

" don't highlight doc comments as SpecialComment
highlight clear rustCommentLineDoc
highlight default link rustCommentLineDoc Comment

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
