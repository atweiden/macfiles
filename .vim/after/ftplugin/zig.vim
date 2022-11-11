setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal formatprg=fmt\ --width=99

nnoremap <silent> <buffer> <localleader>> :call zig#fmt#Format()<CR>

function! s:HighlightZig() abort
  highlight clear zigComparatorWord
  highlight link zigComparatorWord Operator
  highlight clear zigDummyVariable
  highlight link zigDummyVariable Identifier
  highlight clear zigStringDelimiter
  highlight link zigStringDelimiter Delimiter
endfunction

augroup highlightzig
  autocmd!
  autocmd ColorScheme * call <SID>HighlightZig()
augroup END

call <SID>HighlightZig()

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
