" open NERDTree in working directory
let g:NERDTreeChDirMode = 1

" show files by default
let g:NERDTreeShowFiles = 1

" show hidden files by default
let g:NERDTreeShowHidden = 1

" close NERDTree upon selecting file to open
let g:NERDTreeQuitOnOpen = 1

" highlight the selected entry in the tree
let g:NERDTreeHighlightCursorline = 1

" use a single click to fold/unfold directories and a double click to open files
let g:NERDTreeMouseMode = 2
let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize = 30
let g:NERDTreeMapJumpFirstChild = 'gK'
let g:NERDTreeGlyphReadOnly = ''
nnoremap <silent> <F12> :NERDTreeToggle<CR>
inoremap <silent> <F12> <C-O>:NERDTreeToggle<CR>
vnoremap <silent> <F12> <ESC>:NERDTreeToggle<CR>gv

" if nerd tree is closed, find current file, if open, close it
nnoremap <silent> <leader>nf <ESC>:call ToggleFindNerd()<CR>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
