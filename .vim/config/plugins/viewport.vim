" facilitate lazy loading
augroup loadviewport
  autocmd!
  autocmd User LoadViewport ++once packadd vim-viewport
augroup END

vmap <silent> <leader>nr <ESC>:silent doautocmd User LoadViewport<CR>gv<Plug>ViewportTabNew

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
