" enable insert mode mappings
let g:sexp_enable_insert_mode_mappings = 1

" activate vim-sexp on lisp filetypes
let g:sexp_filetypes = join(g:lispft, ',')

" don't automatically enter insert mode after wrapping
let g:sexp_insert_after_wrap = 0

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
