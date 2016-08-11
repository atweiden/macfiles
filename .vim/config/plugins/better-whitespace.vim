" disable whitespace highlights for specified filetypes
let g:better_whitespace_filetypes_blacklist=[ 'calendar',
                                            \ 'conque_term',
                                            \ 'ctrlsf',
                                            \ 'diff',
                                            \ 'help',
                                            \ 'qf',
                                            \ 'unite',
                                            \ 'vimfiler',
                                            \ 'vim-plug' ]

" seoul256 whitespace colors
highlight ExtraWhitespace ctermbg=168 guibg=#df5f87

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
