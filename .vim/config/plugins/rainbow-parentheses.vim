" toggle rainbow_parentheses.vim
nnoremap <leader>rp :RainbowParentheses!!<CR>

let g:rainbow#max_level = 16
let g:rainbow#pairs = [
\   ['(', ')'],
\   ['[', ']']
\ ]

" don't pick colors from current color scheme per plugin default
" use colors from VimClojure (see: vimclojure#ParenRainbowColorsDark)
let g:rainbow#colors = {
\   'dark': [
\     ['yellow',  'orange1'     ],
\     ['green',   'yellow1'     ],
\     ['cyan',    'greenyellow' ],
\     ['magenta', 'green1'      ],
\     ['red',     'springgreen1'],
\     ['yellow',  'cyan1'       ],
\     ['green',   'slateblue1'  ],
\     ['cyan',    'magenta1'    ],
\     ['magenta', 'purple1'     ]
\   ],
\   'light': [
\     ['darkyellow',  'orangered3'    ],
\     ['darkgreen',   'orange2'       ],
\     ['blue',        'yellow3'       ],
\     ['darkmagenta', 'olivedrab4'    ],
\     ['red',         'green4'        ],
\     ['darkyellow',  'paleturquoise3'],
\     ['darkgreen',   'deepskyblue4'  ],
\     ['blue',        'darkslateblue' ],
\     ['darkmagenta', 'darkviolet'    ]
\   ]
\ }

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
