" enter normal mode from terminal mode
tnoremap <C-W>N <C-\><C-N>

" increase scrollback lines
silent! set termwinscroll=100000
let g:terminal_scrollback_buffer_size = 100000

" open neovim :terminal in insert mode per vim
if has('nvim')
  augroup nvimterminal
    autocmd!
    autocmd TermOpen term://* startinsert
  augroup END
endif

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
