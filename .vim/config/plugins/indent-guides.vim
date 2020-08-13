" don't activate on startup
let g:indent_guides_enable_on_vim_startup = 0

" disable default mapping <leader>ig for toggling indent-guides
let g:indent_guides_default_mapping = 0

" use custom colors
let g:indent_guides_auto_colors = 0
augroup indentguides
  autocmd!
  autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd ctermbg=234 guibg=#F7F7F7
  autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven ctermbg=235 guibg=#F0F0F0
augroup END

" exclude filetypes
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" don't classify spaces as indention
let g:indent_guides_space_guides = 0

" only match spaces at beginning of line
" uncomment if g:indent_guides_space_guides = 1
"let g:indent_guides_soft_pattern = ' '

" toggle minimalist vs nathanaelkane/vim-indent-guides tab highlighting
function! s:ToggleIndentGuides() abort
  if get(b:, 'igmode', 0)
    call indent_guides#disable()
    call SetListCharsTabVisible()
    call SetListCharsRemaining()
    let b:igmode = 0
  else
    call SetListCharsTabInvisible()
    call SetListCharsRemaining()
    call indent_guides#init_matches()
    call indent_guides#enable()
    let b:igmode = 1
  endif
endfunction
command! ToggleIndentGuides call <SID>ToggleIndentGuides()
nnoremap <silent> <F7> :ToggleIndentGuides<CR>
inoremap <silent> <F7> <C-O>:ToggleIndentGuides<CR>
vnoremap <silent> <F7> <ESC>:ToggleIndentGuides<CR>gv

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
