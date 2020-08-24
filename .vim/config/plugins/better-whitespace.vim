let g:better_whitespace_operator = '<leader>sw'

" disable whitespace highlights for specified filetypes
let g:better_whitespace_filetypes_blacklist = [
    \ 'ctrlsf',
    \ 'diff',
    \ 'help',
    \ 'packager',
    \ 'qf'
    \ ]

" seoul256 whitespace colors
augroup betterwhitespace
  autocmd!
  autocmd VimEnter,ColorScheme * highlight ExtraWhitespace ctermbg=168 guibg=#DF5F87
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
