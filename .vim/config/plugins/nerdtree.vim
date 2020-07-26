" show files by default
let g:NERDTreeShowFiles = 1

" don't show hidden files by default
let g:NERDTreeShowHidden = 0

" don't close nerdtree upon selecting file to open
let g:NERDTreeQuitOnOpen = 0

" set window size to 30%
let g:NERDTreeWinSize = 30

" highlight the selected entry in the tree
let g:NERDTreeHighlightCursorline = 1

" single-click to fold/unfold dirs, double-click to open files
let g:NERDTreeMouseMode = 2

" don't recursively open directories that have only a single child dir
let g:NERDTreeCascadeOpenSingleChildDir = 0

" disable the bookmarks label
let g:NERDTreeMinimalUI = 1

" save bookmarks in $VIMPATH, not $HOME
let g:NERDTreeBookmarksFile = $VIMPATH . '/.NERDTreeBookmarks'

" open nerdtree in current working directory
let g:NERDTreeChDirMode = 1

" disable these keymaps (C-J / C-K conflict with vim-tmux-navigator)
let g:NERDTreeMapJumpRoot = ''
let g:NERDTreeMapJumpParent = ''
let g:NERDTreeMapJumpFirstChild = ''
let g:NERDTreeMapJumpLastChild = ''
let g:NERDTreeMapJumpNextSibling = ''
let g:NERDTreeMapJumpPrevSibling = ''

" show lock symbol in place of 'RO' for readonly files
let g:NERDTreeGlyphReadOnly = ''

" use M to toggle nerdtree menu, not m
let g:NERDTreeMapMenu = 'M'

" toggle nerdtree with F12
nnoremap <silent> <F12> :NERDTreeToggle<CR>
inoremap <silent> <F12> <C-O>:NERDTreeToggle<CR>
vnoremap <silent> <F12> <ESC>:NERDTreeToggle<CR>gv

" if nerdtree is closed, find current file, if open, close it
nnoremap <silent> <leader>nf <ESC>:call ToggleFindNerd()<CR>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
