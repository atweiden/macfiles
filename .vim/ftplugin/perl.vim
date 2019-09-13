" don't highlight packages in variables as a scope reference
" e.g. in $pack::var, pack:: is a scope
let g:perl_no_scope_in_variables = 1

" don't process complex things like @{${"foo"}}
let g:perl_no_extended_vars = 1

" use extra pod syntax highlighting
let g:perl_include_pod = 1

set tabstop=4
set softtabstop=4
set shiftwidth=4

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
