if exists('b:did_ftplugin_after')
  finish
endif
let b:did_ftplugin_after = 1

nnoremap <buffer> K <Plug>(ocpindex-echo-type)
nnoremap <buffer> <C-]> <Plug>(ocpindex-jump)
nnoremap <buffer> <C-t> <Plug>(ocpindex-jump-back)
nnoremap <buffer> <leader>tc :call OCamlType()<CR>
