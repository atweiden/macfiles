" facilitate lazy loading
augroup loadviewport
  autocmd!
  autocmd User LoadViewPort ++once packadd vim-viewport
augroup END

vmap <silent> <leader>nr <ESC>:silent doautocmd User LoadViewPort<CR>gv<Plug>ViewPortTabNew

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
