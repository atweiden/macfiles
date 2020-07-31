" maintain tmux navigation bindings in insert/visual/command mode
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<CR>
inoremap <silent> <C-H> <C-O>:TmuxNavigateLeft<CR>
vnoremap <silent> <C-H> <ESC>:TmuxNavigateLeft<CR>gv
cnoremap <silent> <C-H> <C-C>:TmuxNavigateLeft<CR>
tnoremap <silent> <C-H> <C-W>:TmuxNavigateLeft<CR>
nnoremap <silent> <C-J> :TmuxNavigateDown<CR>
inoremap <silent> <C-J> <C-O>:TmuxNavigateDown<CR>
vnoremap <silent> <C-J> <ESC>:TmuxNavigateDown<CR>gv
cnoremap <silent> <C-J> <C-C>:TmuxNavigateDown<CR>
tnoremap <silent> <C-J> <C-W>:TmuxNavigateDown<CR>
nnoremap <silent> <C-K> :TmuxNavigateUp<CR>
inoremap <silent> <C-K> <C-O>:TmuxNavigateUp<CR>
vnoremap <silent> <C-K> <ESC>:TmuxNavigateUp<CR>gv
cnoremap <silent> <C-K> <C-C>:TmuxNavigateUp<CR>
tnoremap <silent> <C-K> <C-W>:TmuxNavigateUp<CR>
nnoremap <silent> <C-L> :TmuxNavigateRight<CR>
inoremap <silent> <C-L> <C-O>:TmuxNavigateRight<CR>
vnoremap <silent> <C-L> <ESC>:TmuxNavigateRight<CR>gv
cnoremap <silent> <C-L> <C-C>:TmuxNavigateRight<CR>
tnoremap <silent> <C-L> <C-W>:TmuxNavigateRight<CR>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<CR>
inoremap <silent> <C-\> <C-O>:TmuxNavigatePrevious<CR>
vnoremap <silent> <C-\> <ESC>:TmuxNavigatePrevious<CR>gv
cnoremap <silent> <C-\> <C-C>:TmuxNavigatePrevious<CR>
tnoremap <silent> <C-\> <C-W>:TmuxNavigatePrevious<CR>

" don't disable tmux navigator when zooming vim pane
let g:tmux_navigator_disable_when_zoomed = 0

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
