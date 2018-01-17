" Don't install go binaries on startup
let g:go_disable_autoinstall = 1

" Disable auto :GoFmt on save
let g:go_fmt_autosave = 0

" Disable auto :AsmFmt on save
let g:go_asmfmt_autosave = 0

" Disable default mapping (`gd`) for GoDef
let g:go_def_mapping_enabled = 0

" Disable highlight trailing white space
let g:go_highlight_trailing_whitespace_error = 0

" Disable highlighting white space after `[]`
let g:go_highlight_array_whitespace_error = 0

" Disable highlighting white space around the communications operator
" (`<-`) that doesn't follow the standard style
let g:go_highlight_chan_whitespace_error = 0

" Disable highlighting instances of tabs following spaces
let g:go_highlight_space_tab_error = 0

" Disable highlighting spelling errors in strings when spell is also enabled
let g:go_highlight_string_spellcheck = 0

" Highlight operators such as `:=` , `==`, `-=`, etc
let g:go_highlight_operators = 1

" Highlight variable declarations (`:=`)
let g:go_highlight_variable_declarations = 1

" Highlight variable assignments (`=`)
let g:go_highlight_variable_assignments = 1

" Highlight function and method declarations.
let g:go_highlight_functions = 0

" Highlight function and method calls.
let g:go_highlight_function_calls = 0

" Highlight struct and interface names
let g:go_highlight_types = 1

" Highlight field names
let g:go_highlight_fields = 1

" Highlight build constraints
let g:go_highlight_build_constraints = 1

" Highlight go:generate directives
let g:go_highlight_generate_tags = 1

" Highlight printf-style operators inside string literals
let g:go_highlight_format_strings = 1

" Enable folding of { .. }, import, var and const blocks
let g:go_fold_enable = ['block', 'import', 'varconst']

" Disable pre-filling new Go buffers
let g:go_template_autocreate = 0

" Don't open browser after posting snippet with :GoPlay
let g:go_play_open_browser = 0

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
