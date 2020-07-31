" scrollback lines
if has('nvim')
  let g:terminal_scrollback_buffer_size = 100000
else
  set termwinscroll=100000
endif

" enter normal mode in terminal mode
tnoremap <C-W>N <C-\><C-N>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
