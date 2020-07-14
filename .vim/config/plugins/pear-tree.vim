" disable pear tree when editing lisp files
let g:pear_tree_ft_disabled = g:lispft

" prevent <BS>, <CR> and <ESC> keys from being mapped in insert mode
let g:pear_tree_map_special_keys = 0

" make expansion behave like other plugins and text editors
let g:pear_tree_repeatable_expand = 0

" disable smart pairs
let g:pear_tree_smart_openers = 0
let g:pear_tree_smart_closers = 0
let g:pear_tree_smart_backspace = 0

" timeout smart pair functions after 60ms
let g:pear_tree_timeout = 60

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
