xmap <Up>    <Plug>(textmanip-move-up)
xmap <Down>  <Plug>(textmanip-move-down)
xmap <Left>  <Plug>(textmanip-move-left)
xmap <Right> <Plug>(textmanip-move-right)
xmap D       <Plug>(textmanip-duplicate-down)

let g:textmanip_hooks = {}
function! g:textmanip_hooks.finish(tm) abort
  let tm = a:tm
  let helper = textmanip#helper#get()
  " remove trailing white space for blockwise move/duplicate
  " :set virtualedit=block for increased dwim
  call helper.remove_trailing_WS(tm)
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
