" reformat interstitial block quotes
nnoremap -<bar> :execute ".!fmt --prefix='-\ \|'"<CR>
nnoremap <bar> :execute ".!fmt --prefix='\|'"<CR>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
