" open CtrlSF on left hand side of display
let g:ctrlsf_position = 'left'

" occupy 70% of display width
let g:ctrlsf_winsize = '70%'

" use 'gn' to jump to next match, not C-J
" use 'gN' to jump to prev match, not C-K
let g:ctrlsf_mapping = {
  \ 'next': 'gn',
  \ 'prev': 'gN',
  \ 'open': ['<CR>', 'o'],
  \ 'openb': 'O',
  \ 'quit': 'q',
  \ 'popen': '',
  \ 'pquit': '',
  \ 'split': '',
  \ 'vsplit': '',
  \ 'tab': '',
  \ 'tabb': '',
  \ 'loclist': ''
\ }

" enter search regexes by default
let g:ctrlsf_regex_pattern = 1

" start searches without explicit search path from project VCS root
" gleaned from current file
"
" if project VCS root can't be gleaned, search from cwd
let g:ctrlsf_default_root = 'project+fw'

" put cmd_error_file in $VIMPATH, not $HOME
let g:ctrlsf_cmd_error_file = $VIMPATH.'/.ctrlsf_cmd_error_file'

" prompt CtrlSF on C-F
nnoremap <C-F> :CtrlSF<space>

" toggle CtrlSF window with C-G
nnoremap <silent> <C-G> :call ToggleCtrlSF()<CR>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
