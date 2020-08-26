" facilitate lazy loading
augroup loadtextmanip
  autocmd!
  autocmd User LoadTextmanip ++once packadd vim-textmanip
augroup END

xmap <silent> <Up>    <ESC>:silent doautocmd User LoadTextmanip<CR>gv<Plug>(textmanip-move-up)
xmap <silent> <Down>  <ESC>:silent doautocmd User LoadTextmanip<CR>gv<Plug>(textmanip-move-down)
xmap <silent> <Left>  <ESC>:silent doautocmd User LoadTextmanip<CR>gv<Plug>(textmanip-move-left)
xmap <silent> <Right> <ESC>:silent doautocmd User LoadTextmanip<CR>gv<Plug>(textmanip-move-right)
xmap <silent> D       <ESC>:silent doautocmd User LoadTextmanip<CR>gv<Plug>(textmanip-duplicate-down)

let g:textmanip_hooks = {}
function! g:textmanip_hooks.finish(tm) abort
  let tm = a:tm
  let helper = textmanip#helper#get()
  " remove trailing white space for blockwise move/duplicate
  " :set virtualedit=block for increased dwim
  call helper.remove_trailing_WS(tm)
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
