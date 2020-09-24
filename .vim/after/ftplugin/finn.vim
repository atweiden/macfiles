" add list item to list with ctrl+space
let g:finn_bullet_key = '<C-@>'

" reformat interstitial block quotes
nnoremap <silent> <buffer> <Bar> :execute ".!fmt --prefix='\|'"<CR>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
