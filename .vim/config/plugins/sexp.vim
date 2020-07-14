" disable insert mode mappings
let g:sexp_enable_insert_mode_mappings = 0

" activate vim-sexp on lisp filetypes
let g:sexp_filetypes = join(g:lispft, ',')

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
    \ 'sexp_move_to_prev_bracket':      'Z(',
    \ 'sexp_move_to_next_bracket':      'Z)',
    \ 'sexp_move_to_prev_element_head': '-',
    \ 'sexp_move_to_next_element_head': '=',
    \ 'sexp_move_to_prev_element_tail': '_',
    \ 'sexp_move_to_next_element_tail': '+',
    \ 'sexp_flow_to_prev_close':        '<Bar>',
    \ 'sexp_flow_to_next_open':         ')',
    \ 'sexp_flow_to_prev_open':         '(',
    \ 'sexp_flow_to_next_close':        '<Bslash>',
    \ 'sexp_flow_to_prev_leaf_head':    '#',
    \ 'sexp_flow_to_next_leaf_head':    '*',
    \ 'sexp_flow_to_prev_leaf_tail':    '^',
    \ 'sexp_flow_to_next_leaf_tail':    '&',
    \ 'sexp_move_to_prev_top_element':  '[[',
    \ 'sexp_move_to_next_top_element':  ']]',
    \ 'sexp_select_prev_element':       '[e',
    \ 'sexp_select_next_element':       ']e',
    \ 'sexp_indent':                    'z>',
    \ 'sexp_indent_top':                'zz>',
    \ 'sexp_round_head_wrap_list':      'zss(',
    \ 'sexp_round_tail_wrap_list':      'zss)',
    \ 'sexp_square_head_wrap_list':     'zss[',
    \ 'sexp_square_tail_wrap_list':     'zss]',
    \ 'sexp_curly_head_wrap_list':      'zss{',
    \ 'sexp_curly_tail_wrap_list':      'zss}',
    \ 'sexp_round_head_wrap_element':   'zse(',
    \ 'sexp_round_tail_wrap_element':   'zse)',
    \ 'sexp_square_head_wrap_element':  'zse[',
    \ 'sexp_square_tail_wrap_element':  'zse]',
    \ 'sexp_curly_head_wrap_element':   'zse{',
    \ 'sexp_curly_tail_wrap_element':   'zse}',
    \ 'sexp_insert_at_list_head':       'zi',
    \ 'sexp_insert_at_list_tail':       'za',
    \ 'sexp_splice_list':               'z@',
    \ 'sexp_convolute':                 'z?',
    \ 'sexp_raise_list':                'zo',
    \ 'sexp_raise_element':             'zO',
    \ 'sexp_swap_list_backward':        'zk',
    \ 'sexp_swap_list_forward':         'zj',
    \ 'sexp_swap_element_backward':     'zh',
    \ 'sexp_swap_element_forward':      'zl',
    \ 'sexp_emit_head_element':         'zJ',
    \ 'sexp_emit_tail_element':         'zK',
    \ 'sexp_capture_prev_element':      'zH',
    \ 'sexp_capture_next_element':      'zL',
    \ }

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
