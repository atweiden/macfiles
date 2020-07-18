" don't activate on startup
let g:indent_guides_enable_on_vim_startup = 0

" disable default mapping <leader>ig for toggling indent-guides
let g:indent_guides_default_mapping = 0

" use custom colors
let g:indent_guides_auto_colors = 0
augroup indent-guides
  autocmd!
  autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd ctermbg=234 guibg=#F7F7F7
  autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven ctermbg=235 guibg=#F0F0F0
augroup END

" exclude filetypes
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" don't consider spaces as indention
let g:indent_guides_space_guides = 0

" only match spaces at the beginning of the line
" uncomment if g:indent_guides_space_guides = 1
"let g:indent_guides_soft_pattern = ' '

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
