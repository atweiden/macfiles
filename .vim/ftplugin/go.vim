" don't install go binaries on startup
let g:go_disable_autoinstall = 1

" use gopls for :GoFmt
let g:go_fmt_command = 'gopls'

" use gopls for :GoInfo
let g:go_info_mode = 'gopls'

" use gopls for :GoImports
let g:go_imports_mode = 'gopls'

" use gopls for :GoDef
let g:go_def_mode = 'gopls'

" use gopls for :GoFillStruct
let g:go_fillstruct_mode = 'gopls'

" use gopls for :GoReferrers
let g:go_referrers_mode = 'gopls'

" use gopls for :GoImplements
let g:go_implements_mode = 'gopls'

" use gopls for :GoRename
let g:go_rename_command = 'gopls'

" use fzf for :GoDecls
let g:go_decls_mode = 'fzf'

" disable auto :GoFmt on save
let g:go_fmt_autosave = 0

" disable auto :GoModFmt on save
let g:go_mod_fmt_autosave = 0

" disable auto :GoImports on save
let g:go_imports_autosave = 0

" disable auto :GoMetaLinter on save
let g:go_metalinter_autosave = 0

" disable auto :AsmFmt on save
let g:go_asmfmt_autosave = 0

" disable default mapping (`gd`) for :GoDef
let g:go_def_mapping_enabled = 0

" disable default mapping (`K`) for :GoDoc
let g:go_doc_keywordprg_enabled = 0

" display popup instead of quickfix window on :GoDoc
let g:go_doc_popup_window = 1

" reduce time statusline message is shown to 15 seconds
let g:go_statusline_duration = 15

" disable highlight trailing whitespace
let g:go_highlight_trailing_whitespace_error = 0

" disable highlighting whitespace after `[]`
let g:go_highlight_array_whitespace_error = 0

" disable highlighting whitespace around communications operator (`<-`)
" if not in standard style
let g:go_highlight_chan_whitespace_error = 0

" disable highlighting instances of tabs following spaces
let g:go_highlight_space_tab_error = 0

" disable highlighting spelling errors in strings when spell is also enabled
let g:go_highlight_string_spellcheck = 0

" highlight operators such as `:=` , `==`, `-=`, etc
let g:go_highlight_operators = 1

" highlight variable declarations (`:=`)
let g:go_highlight_variable_declarations = 1

" highlight variable assignments (`=`)
let g:go_highlight_variable_assignments = 1

" highlight function and method declarations
let g:go_highlight_functions = 1

" highlight function and method calls
let g:go_highlight_function_calls = 1

" highlight struct and interface names
let g:go_highlight_types = 1

" highlight field names
let g:go_highlight_fields = 1

" highlight build constraints
let g:go_highlight_build_constraints = 1

" highlight go:generate directives
let g:go_highlight_generate_tags = 1

" highlight printf-style operators inside string literals
let g:go_highlight_format_strings = 1

" enable folding of { .. }, import, var and const blocks
let g:go_fold_enable = ['block', 'import', 'varconst']

" disable pre-filling new go buffers
let g:go_template_autocreate = 0

" don't open browser after posting snippet with :GoPlay
let g:go_play_open_browser = 0

" open new terminal in horizontal split
let g:go_term_mode = 'split'

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
