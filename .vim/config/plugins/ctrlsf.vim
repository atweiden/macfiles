" facilitate lazy loading
augroup loadctrlsf
  autocmd!
  autocmd User LoadCtrlSF ++once packadd ctrlsf.vim
augroup END

function! s:LoadCtrlSFCompletion(arglead, cmdline, cursorpos) abort
  silent doautocmd User LoadCtrlSF
  return ctrlsf#comp#Completion(a:arglead, a:cmdline, a:cursorpos)
endfunction

" quick launch with Ctrl-F
command! -nargs=* -complete=customlist,<SID>LoadCtrlSFCompletion CtrlSF :silent doautocmd User LoadCtrlSF | CtrlSF <args>
nnoremap <C-F> :CtrlSF<space>

" toggle results pane with F1
nnoremap <silent> <F1> :silent doautocmd User LoadCtrlSF<CR>:CtrlSFToggle<CR>

" start searches without explicit search path from project vcs root
" gleaned from current file, or from cwd if project vcs root not found
let g:ctrlsf_default_root = 'project+fw'

" enter search regexes by default
let g:ctrlsf_regex_pattern = 1

" don't follow symlinks
let g:ctrlsf_follow_symlinks = 0

" point ctrlsf to xdg directory spec respecting search util config files
let g:ctrlsf_extra_backend_args = {
    \ 'ack': '--ackrc=' . $HOME . '/.config/ack/ackrc',
    \ 'ag': '--path-to-ignore ' . $HOME . '/.config/search/ignore',
    \ 'rg': '--ignore-file ' . $HOME . '/.config/search/ignore'
    \ }

" open results pane on left at 70% of current vim window width
let g:ctrlsf_position = 'left'
let g:ctrlsf_winsize = '70%'

" focus results pane at start of search
let g:ctrlsf_auto_focus = { "at": "start" }

" don't use Ctrl-{J,K} for next/prev in results pane
let g:ctrlsf_mapping = {
    \ "next": "<C-N>",
    \ "prev": "<C-P>"
    \ }

" keep cursor in results pane after opening file
let g:ctrlsf_auto_close = 0

function! s:CtrlSFAfterMainWindowInit() abort
  call ctrlsf#JumpTo('open')
  call ctrlsf#win#FocusMainWindow()
endfunction

function! g:CtrlSFAfterMainWindowInit() abort
  nnoremap <silent> <buffer> <CR> :call <SID>CtrlSFAfterMainWindowInit()<CR>
  nnoremap <silent> <buffer> o :call <SID>CtrlSFAfterMainWindowInit()<CR>
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
