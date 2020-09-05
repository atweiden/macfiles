" enter normal mode from terminal mode
tnoremap <C-W>N <C-\><C-N>

" increase scrollback lines
silent! set termwinscroll=100000
let g:terminal_scrollback_buffer_size = 100000

" :terminal improved sans BeomjoonGoh/vim-easy-term
" see also: .functions.d/tvim.sh, .vim/config/functions/tvim.vim
command! -bang Terminal call term_start('bash --login', {
    \ 'term_finish': 'close',
    \ 'term_api': 'Tvim',
    \ 'term_name': 'bash',
    \ 'curwin': <bang>0
    \ })

" open neovim :terminal in insert mode per vim
if has('nvim')
  augroup nvimterminal
    autocmd!
    autocmd TermOpen term://* startinsert
  augroup END
endif

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
