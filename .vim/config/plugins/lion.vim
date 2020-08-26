" facilitate lazy loading
augroup loadlion
  autocmd!
  autocmd User LoadLion ++once packadd vim-lion
augroup END

let g:lion_create_maps = 0
nmap <silent> gl :silent doautocmd User LoadLion<CR><Plug>LionRight
xmap <silent> gl <ESC>:silent doautocmd User LoadLion<CR>gv<Plug>VLionRight
nmap <silent> gL :silent doautocmd User LoadLion<CR><Plug>LionLeft
xmap <silent> gL <ESC>:silent doautocmd User LoadLion<CR>gv<Plug>VLionLeft

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
