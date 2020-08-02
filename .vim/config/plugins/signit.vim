" add signature sans johannesthyssen/vim-signit
let g:signature = [
    \ "    dBPdBPdBP dBBBBBb",
    \ "                   BB     Andy Weidenbaum",
    \ "  dBPdBPdBP    dBP BB     https://ioiojo.com/",
    \ " dBPdBPdBP    dBP  BB     https://sr.ht/~ioiojo/",
    \ "dBBBBBBBP    dBBBBBBB"
    \ ]
nnoremap <silent> <leader>S "=StringsToCommentBlock(g:signature, 4)<CR>p

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
