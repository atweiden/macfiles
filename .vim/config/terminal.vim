if has('nvim')
  " scrollback lines
  let g:terminal_scrollback_buffer_size = 100000
else
  " scrollback lines
  set termwinscroll=100000
endif

" enter normal mode in terminal mode
tnoremap <C-W>N <C-\><C-N>

" switch windows in terminal mode
tnoremap <C-H> <C-\><C-N><C-W>h
tnoremap <C-J> <C-\><C-N><C-W>j
tnoremap <C-K> <C-\><C-N><C-W>k
tnoremap <C-L> <C-\><C-N><C-W>l

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
