" disable insert mode mappings
let g:sexp_enable_insert_mode_mappings = 0

" activate vim-sexp on lisp filetypes
let g:sexp_filetypes = join(keys(g:lispft), ',')

" don't automatically enter insert mode after wrapping
let g:sexp_insert_after_wrap = 0

let g:sexp_mappings = {
    \ 'sexp_outer_list':                'af',
    \ 'sexp_inner_list':                'if',
    \ 'sexp_outer_top_list':            'aF',
    \ 'sexp_inner_top_list':            'iF',
    \ 'sexp_outer_string':              'as',
    \ 'sexp_inner_string':              'is',
    \ 'sexp_outer_element':             'ae',
    \ 'sexp_inner_element':             'ie',
    \ 'sexp_move_to_prev_bracket':      '[]',
    \ 'sexp_move_to_next_bracket':      '][',
    \ 'sexp_move_to_prev_element_head': '-',
    \ 'sexp_move_to_next_element_head': '=',
    \ 'sexp_move_to_prev_element_tail': '_',
    \ 'sexp_move_to_next_element_tail': '+',
    \ 'sexp_flow_to_prev_close':        '<Bar>',
    \ 'sexp_flow_to_next_open':         ')',
    \ 'sexp_flow_to_prev_open':         '(',
    \ 'sexp_flow_to_next_close':        '<Bslash>',
    \ 'sexp_flow_to_prev_leaf_head':    '!',
    \ 'sexp_flow_to_next_leaf_head':    '#',
    \ 'sexp_flow_to_prev_leaf_tail':    '&',
    \ 'sexp_flow_to_next_leaf_tail':    '*',
    \ 'sexp_move_to_prev_top_element':  '[[',
    \ 'sexp_move_to_next_top_element':  ']]',
    \ 'sexp_select_prev_element':       '[e',
    \ 'sexp_select_next_element':       ']e',
    \ 'sexp_indent':                    '<localleader>>',
    \ 'sexp_indent_top':                '<localleader><localleader>>',
    \ 'sexp_round_head_wrap_list':      '<localleader>ss(',
    \ 'sexp_round_tail_wrap_list':      '<localleader>ss)',
    \ 'sexp_square_head_wrap_list':     '<localleader>ss[',
    \ 'sexp_square_tail_wrap_list':     '<localleader>ss]',
    \ 'sexp_curly_head_wrap_list':      '<localleader>ss{',
    \ 'sexp_curly_tail_wrap_list':      '<localleader>ss}',
    \ 'sexp_round_head_wrap_element':   '<localleader>se(',
    \ 'sexp_round_tail_wrap_element':   '<localleader>se)',
    \ 'sexp_square_head_wrap_element':  '<localleader>se[',
    \ 'sexp_square_tail_wrap_element':  '<localleader>se]',
    \ 'sexp_curly_head_wrap_element':   '<localleader>se{',
    \ 'sexp_curly_tail_wrap_element':   '<localleader>se}',
    \ 'sexp_insert_at_list_head':       '<localleader>i',
    \ 'sexp_insert_at_list_tail':       '<localleader>a',
    \ 'sexp_splice_list':               '<localleader>@',
    \ 'sexp_convolute':                 '<localleader>?',
    \ 'sexp_raise_list':                '<localleader>o',
    \ 'sexp_raise_element':             '<localleader>O',
    \ 'sexp_swap_list_backward':        '<localleader>k',
    \ 'sexp_swap_list_forward':         '<localleader>j',
    \ 'sexp_swap_element_backward':     '<localleader>h',
    \ 'sexp_swap_element_forward':      '<localleader>l',
    \ 'sexp_emit_head_element':         '<localleader>J',
    \ 'sexp_emit_tail_element':         '<localleader>K',
    \ 'sexp_capture_prev_element':      '<localleader>H',
    \ 'sexp_capture_next_element':      '<localleader>L',
    \ }

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
