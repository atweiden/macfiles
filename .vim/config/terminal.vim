" scrollback lines
set termwinscroll=100000
let g:terminal_scrollback_buffer_size = 100000

" open terminal in lower split
nnoremap <silent> <leader><space> :sp term://bash<CR>

" enter normal mode in terminal mode
tnoremap <C-\><C-\> <C-\><C-N>

" switch windows in terminal mode
tnoremap <C-H> <C-\><C-N><C-W>h
tnoremap <C-J> <C-\><C-N><C-W>j
tnoremap <C-K> <C-\><C-N><C-W>k
tnoremap <C-L> <C-\><C-N><C-W>l

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
