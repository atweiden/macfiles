" add signature sans johannesthyssen/vim-signit
let g:signature =<< END
    dBPdBPdBP dBBBBBb
                   BB     Andy Weidenbaum
  dBPdBPdBP    dBP BB     https://ioiojo.com/
 dBPdBPdBP    dBP  BB     https://sr.ht/~ioiojo/
dBBBBBBBP    dBBBBBBB
END
nnoremap <silent> <leader>S "=StringsToCommentBlock(g:signature, 4)<CR>p

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
