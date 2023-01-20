vim9script

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal formatprg=fmt\ --width=99

nnoremap <silent> <buffer> <localleader>> :RustFmt<CR>
vnoremap <silent> <buffer> <localleader>> :'<,'>RustFmtRange<CR>

def HighlightRust(): void
  # don't highlight doc comments as SpecialComment
  highlight clear rustCommentLineDoc
  highlight default link rustCommentLineDoc Comment
enddef

augroup highlightrust
  autocmd!
  autocmd ColorScheme * HighlightRust()
augroup END

HighlightRust()

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
