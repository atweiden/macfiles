" reformat interstitial block quotes
nnoremap <silent> <buffer> <Bar> :execute ".!fmt --prefix='\|'"<CR>

" join interstitial block quote lines
nnoremap <silent> <buffer> <Bslash> mz$Jwdw`z

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
