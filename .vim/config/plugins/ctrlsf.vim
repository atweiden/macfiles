" quick launch ctrlsf with Ctrl-F
nnoremap <C-F> :CtrlSF<space>

" toggle ctrlsf with F1
nnoremap <silent> <F1> :CtrlSFToggle<CR>

" start searches without explicit search path from project VCS root
" gleaned from current file, or from cwd if project VCS root not found
let g:ctrlsf_default_root = 'project+fw'

" enter search regexes by default
let g:ctrlsf_regex_pattern = 1

" point ctrlsf to xdg directory spec respecting search util config files
let g:ctrlsf_extra_backend_args = {
    \ 'ack': '--ackrc=' . $HOME . '/.config/ack/ackrc',
    \ 'ag': '--path-to-ignore ' . $HOME . '/.config/search/ignore',
    \ 'rg': '--ignore-file ' . $HOME . '/.config/search/ignore'
    \ }

" open ctrlsf on left at 70% of current vim window width
let g:ctrlsf_position = 'left'
let g:ctrlsf_winsize = '70%'

" don't use Ctrl-{J,K} for next/prev in ctrlsf buffer
let g:ctrlsf_mapping = {
    \ "next": "<C-N>",
    \ "prev": "<C-P>",
    \ }

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
