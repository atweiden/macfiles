" disable conceal
let g:rust_conceal = 0

" disable folding
let g:rust_fold = 0

" disable upstream indentation and textwidth settings overrides
let g:rust_recommended_style = 0

" use stable rustfmt
let g:rustfmt_command = "rustfmt +stable"

" disable rustfmt on save
let g:rustfmt_autosave = 0

" run rustfmt on save if applicable
let g:rustfmt_autosave_if_config_present = 1

" don't show quickfix window on rustfmt error
let g:rustfmt_fail_silently = 1

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
