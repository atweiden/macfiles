" disable conceal
let g:rust_conceal = 0

" disable folding
let g:rust_fold = 0

" disable rustfmt on save
let g:rustfmt_autosave = 0

" disable upstream indentation and textwidth settings overrides
let g:rust_recommended_style = 0

" always run rustfmt on save if applicable and always use stable
let g:rustfmt_autosave_if_config_present = 1
let g:rustfmt_command = "rustfmt +stable"

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
