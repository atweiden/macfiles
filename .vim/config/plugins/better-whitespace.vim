let g:better_whitespace_operator = '<leader>sw'

" disable whitespace highlights for specified filetypes
let g:better_whitespace_filetypes_blacklist = [
    \ 'diff',
    \ 'help',
    \ 'qf',
    \ 'vim-plug'
    \ ]

" seoul256 whitespace colors
highlight ExtraWhitespace ctermbg=168 guibg=#DF5F87

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
