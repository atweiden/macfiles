" don't activate on startup
let g:indent_guides_enable_on_vim_startup = 0

" disable default mapping <leader>ig for toggling indent-guides
let g:indent_guides_default_mapping = 0

" don't classify spaces as indention
let g:indent_guides_space_guides = 0

" exclude filetypes
let g:indent_guides_exclude_filetypes = [
    \ 'ctrlsf',
    \ 'help',
    \ 'nerdtree'
    \ ]

" use custom colors
let g:indent_guides_auto_colors = 0

function! s:HighlightIndentGuides() abort
  highlight clear IndentGuidesOdd
  highlight IndentGuidesOdd ctermbg=235 guibg=#F7F7F7
  highlight clear IndentGuidesEven
  highlight IndentGuidesEven ctermbg=234 guibg=#F0F0F0
endfunction

augroup indentguides
  autocmd!
  autocmd VimEnter,ColorScheme * call <SID>HighlightIndentGuides()
augroup END

" facilitate lazy loading
augroup loadindentguides
  autocmd!
  autocmd User LoadIndentGuides ++once packadd vim-indent-guides
augroup END

" toggle minimalist vs nathanaelkane/vim-indent-guides tab highlighting
function! s:ToggleIndentGuides() abort
  silent doautocmd User LoadIndentGuides
  if get(w:, 'igmode', 0)
    call indent_guides#disable()
    call SetListCharsTabVisible()
    call SetListCharsRemaining()
    let w:igmode = 0
  else
    call SetListCharsTabInvisible()
    call SetListCharsRemaining()
    call indent_guides#init_matches()
    call indent_guides#enable()
    let w:igmode = 1
  endif
endfunction
command! ToggleIndentGuides call <SID>ToggleIndentGuides()
nnoremap <silent> <F7> :ToggleIndentGuides<CR>
inoremap <silent> <F7> <C-O>:ToggleIndentGuides<CR>
vnoremap <silent> <F7> <ESC>:ToggleIndentGuides<CR>gv

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
