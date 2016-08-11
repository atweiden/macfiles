augroup after-object
  autocmd!
  autocmd VimEnter * call after_object#enable(  [']', '['],
                                             \   '=', ':',
                                             \   '-', '#',
                                             \   ' ', '.',
                                             \   ',', '^',
                                             \   '!', '?',
                                             \   '|', '_'    )
  autocmd VimEnter * call after_object#enable(  [']', '['],
                                             \   ']', '[',
                                             \   '}', '{',
                                             \   '<', '>',
                                             \   '/', '\',
                                             \   '$', '@',
                                             \   '%', '&',
                                             \   '+', '*'    )
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
