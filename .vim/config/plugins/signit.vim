vim9script

import autoload $VIMPATH .. '/autoload/home/strings_to_comment_block.vim' as strtocblk

# add signature sans johannesthyssen/vim-signit
g:signature =<< END
    dBPdBPdBP dBBBBBb
                   BB     Andy Weidenbaum
  dBPdBPdBP    dBP BB     https://ioiojo.com/
 dBPdBPdBP    dBP  BB     https://sr.ht/~ioiojo/
dBBBBBBBP    dBBBBBBB
END

g:StringsToCommentBlock = strtocblk.StringsToCommentBlock

nnoremap <silent> <leader>S "=g:StringsToCommentBlock(g:signature, 4)<CR>p

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
