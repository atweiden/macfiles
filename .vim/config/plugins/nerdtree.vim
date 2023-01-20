vim9script

# show files by default
g:NERDTreeShowFiles = 1

# don't show hidden files by default
g:NERDTreeShowHidden = 0

# don't close nerdtree upon selecting file to open
g:NERDTreeQuitOnOpen = 0

# set window size to 45%
g:NERDTreeWinSize = 45

# highlight the selected entry in the tree
g:NERDTreeHighlightCursorline = 1

# single-click to fold/unfold dirs, double-click to open files
g:NERDTreeMouseMode = 2

# don't recursively open directories that have only a single child dir
g:NERDTreeCascadeOpenSingleChildDir = 0

# disable the bookmarks label
g:NERDTreeMinimalUI = 1

# save bookmarks in $VIMPATH, not $HOME
g:NERDTreeBookmarksFile = $VIMPATH .. '/.NERDTreeBookmarks'

# open nerdtree in current working directory
g:NERDTreeChDirMode = 1

# disable these keymaps (C-J / C-K conflict with vim-tmux-navigator)
g:NERDTreeMapJumpRoot = ''
g:NERDTreeMapJumpParent = ''
g:NERDTreeMapJumpFirstChild = ''
g:NERDTreeMapJumpLastChild = ''
g:NERDTreeMapJumpNextSibling = ''
g:NERDTreeMapJumpPrevSibling = ''

# show lock symbol in place of 'RO' for readonly files
g:NERDTreeGlyphReadOnly = ''

# use M to toggle nerdtree menu, not m
g:NERDTreeMapMenu = 'M'

# facilitate lazy loading
augroup loadnerdtree
  autocmd!
  autocmd User LoadNERDTree ++once packadd nerdtree
augroup END

command! NERDTreeToggle :silent doautocmd User LoadNERDTree | NERDTreeToggle

# toggle nerdtree with F12
nnoremap <silent> <F12> :NERDTreeToggle<CR>
inoremap <silent> <F12> <C-O>:NERDTreeToggle<CR>
vnoremap <silent> <F12> <ESC>:NERDTreeToggle<CR>gv

# if nerdtree is closed, find current file in nerdtree
# if nerdtree is open, close it
def ToggleNERDTreeFind(): void
  if exists('t:NERDTreeBufName') && (bufwinnr(t:NERDTreeBufName) != -1)
    execute 'NERDTreeToggle'
  else
    silent doautocmd User LoadNERDTree
    execute 'NERDTreeFind'
  endif
enddef
command! ToggleNERDTreeFind ToggleNERDTreeFind()
nnoremap <silent> <S-F12> :ToggleNERDTreeFind<CR>

def NERDTreeOpen(dirname: string): void
  if isdirectory(dirname)
    silent doautocmd User LoadNERDTree
  endif
enddef

augroup nerdtree
  autocmd!
  autocmd BufEnter * silent NERDTreeOpen(expand("<amatch>"))
augroup END

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
