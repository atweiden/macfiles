" save fzf history in $VIMPATH
let g:fzf_history_dir = $VIMPATH . '/.fzf-history'

" jump to the existing window if possible
let g:fzf_buffers_jump = 1

" default to using large, centered popup window
let g:fzf_layout = {
    \ 'window': {
    \   'width': 1,
    \   'height': 0.88,
    \   'xoffset': 0.5,
    \   'yoffset': 0.5,
    \   'highlight': 'NonText',
    \   'border': 'sharp'
    \ }
    \ }

" use light colors for fzf running in gui vim
if has('gui_running')
  let g:fzf_colors = {
      \ 'bg':      ['bg', 'Normal'],
      \ 'bg+':     ['bg', 'Normal'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'fg':      ['bg', 'StatusLine'],
      \ 'fg+':     ['bg', 'PmenuThumb'],
      \ 'header':  ['fg', 'Comment'],
      \ 'hl':      ['fg', 'Identifier'],
      \ 'hl+':     ['bg', 'PmenuSel'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'spinner': ['fg', 'Label']
      \ }
endif

" preview files using highlight
let g:fzf_files_options = printf('--preview "%s {} | head -%d"',
    \ $VIMPATH . '/pack/packager/opt/fzf.vim/bin/preview.sh',
    \ &lines)

" paint pleasant monotone statusline in fzf buffer
" fixes disappearing statusline in main vim window
function! s:FzfStatusLine() abort
  highlight fzf1 ctermbg=95 guibg=#DFFFFF
  setlocal statusline=%#fzf1#%{'\ '}
endfunction

augroup fzfstatusline
  autocmd!
  autocmd User FzfStatusLine call <SID>FzfStatusLine()
augroup END

function! s:LoadFzf() abort
  packadd fzf
  packadd fzf.vim
endfunction

" facilitate lazy loading
augroup loadfzf
  autocmd!
  autocmd User LoadFzf ++once call <SID>LoadFzf()
augroup END

function! s:FzfWordCompletion() abort
  silent doautocmd User LoadFzf
  return fzf#vim#complete(fzf#wrap({
      \ 'source': printf('cat %s',
      \                  empty(&dictionary)
      \                    ? '/usr/share/dict/words'
      \                    : join(split(&dictionary, ","), " ")),
      \ 'window': {
      \   'width': 0.2,
      \   'height': 0.9,
      \   'xoffset': 1,
      \   'highlight': 'NonText',
      \   'border': 'sharp'
      \ }}))
endfunction

" word completion using cat
inoremap <expr> <C-X><C-K> <SID>FzfWordCompletion()

function! s:FzfPathCompletion() abort
  silent doautocmd User LoadFzf
  return fzf#vim#complete(fzf#wrap({
      \ 'source': 'fd --hidden',
      \ 'window': {
      \   'width': 0.9,
      \   'height': 0.35,
      \   'yoffset': 0.9,
      \   'highlight': 'NonText',
      \   'border': 'sharp'
      \ }}))
endfunction

" path completion using fd
inoremap <expr> <C-X><C-F> <SID>FzfPathCompletion()

function s:FzfLineCompletion() abort
  silent doautocmd User LoadFzf
  return fzf#vim#complete(fzf#wrap({
      \ 'source': 'rg -n ^ --color=always',
      \ 'options': '--ansi --delimiter : --nth 3..',
      \ 'prefix': '^.*$',
      \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }
      \ }))
endfunction

" global line completion using rg (not just open buffers)
inoremap <expr> <C-X><C-L> <SID>FzfLineCompletion()

" |:Rg| hidden files with global ignore config and preview window
command! -bang -nargs=* Rg call fzf#vim#grep(join([
    \ 'rg',
    \ '--column',
    \ '--line-number',
    \ '--no-heading',
    \ '--color=always',
    \ '--smart-case',
    \ '--hidden',
    \ '--ignore-file $HOME/.config/search/ignore',
    \ '--ignore-vcs',
    \ '--',
    \ shellescape(<q-args>)
    \ ], ' '),
    \ 1,
    \ fzf#vim#with_preview(),
    \ <bang>0)

" lazy loaded commands from junegunn/fzf.vim/plugin/fzf.vim
command!      -bang -nargs=? -complete=dir FZFFiles       :silent doautocmd User LoadFzf | Files<bang> <args>
command!      -bang -nargs=? FZFGitFiles                  :silent doautocmd User LoadFzf | GitFiles<bang> <args>
command!      -bang -nargs=? FZFGFiles                    :silent doautocmd User LoadFzf | GFiles<bang> <args>
command! -bar -bang -nargs=? -complete=buffer FZFBuffers  :silent doautocmd User LoadFzf | Buffers<bang> <args>
command!      -bang -nargs=* FZFLines                     :silent doautocmd User LoadFzf | Lines<bang> <args>
command!      -bang -nargs=* FZFBLines                    :silent doautocmd User LoadFzf | BLines<bang> <args>
command! -bar -bang FZFColors                             :silent doautocmd User LoadFzf | Colors<bang>
command!      -bang -nargs=+ -complete=dir FZFLocate      :silent doautocmd User LoadFzf | Locate<bang> <args>
command!      -bang -nargs=* FZFAg                        :silent doautocmd User LoadFzf | Ag<bang> <args>
command!      -bang -nargs=* FZFRg                        :silent doautocmd User LoadFzf | Rg<bang> <args>
command!      -bang -nargs=* FZFTags                      :silent doautocmd User LoadFzf | Tags<bang> <args>
command!      -bang -nargs=* FZFBTags                     :silent doautocmd User LoadFzf | BTags<bang> <args>
command! -bar -bang FZFSnippets                           :silent doautocmd User LoadFzf | Snippets<bang>
command! -bar -bang FZFCommands                           :silent doautocmd User LoadFzf | Commands<bang>
command! -bar -bang FZFMarks                              :silent doautocmd User LoadFzf | Marks<bang>
command! -bar -bang FZFHelptags                           :silent doautocmd User LoadFzf | Helptags<bang>
command! -bar -bang FZFWindows                            :silent doautocmd User LoadFzf | Windows<bang>
command! -bar -bang FZFCommits                            :silent doautocmd User LoadFzf | Commits<bang>
command! -bar -bang FZFBCommits                           :silent doautocmd User LoadFzf | BCommits<bang>
command! -bar -bang FZFMaps                               :silent doautocmd User LoadFzf | Maps<bang>
command! -bar -bang FZFFiletypes                          :silent doautocmd User LoadFzf | Filetypes<bang>
command!      -bang -nargs=* FZFHistory                   :silent doautocmd User LoadFzf | History<bang> <args>

" search with rg from cwd
nnoremap <silent> <leader>/ :FZFRg<CR>

" search word under cursor with rg from cwd
if !has('nvim')
  nnoremap <silent> <leader>f :let @z = expand('<cword>')<CR>:FZFRg<CR><C-W>:call term_sendkeys('', @z)<CR>
  xnoremap <silent> <leader>f "zy:FZFRg<CR><C-W>:call term_sendkeys('', @z)<CR>
else
  nnoremap <silent> <leader>f :let @z = expand('<cword>')<CR>:FZFRg<CR><C-\><C-N>:call chansend(b:terminal_job_id, @z)<CR>i
  xnoremap <silent> <leader>f "zy:FZFRg<CR><C-W><C-\><C-N>:call chansend(b:terminal_job_id, @z)<CR>i
endif

" search prefixed by word under cursor with rg from cwd
nnoremap <silent> <leader>F :let @z = expand('<cword>')<CR>:FZFRg <C-R>z<CR>
xnoremap <silent> <leader>F "zy:FZFRg <C-R>z<CR>

" open files from cwd
nnoremap <silent> <leader>o :FZFFiles<CR>

" select window
nnoremap <silent> <leader>O :FZFWindows<CR>

" select buffer
nnoremap <silent> <leader>lz :FZFBuffers<CR>

" search lines in current buffer
nnoremap <silent> <M-f> :FZFBLines<CR>

" search lines in loaded buffers
nnoremap <silent> <M-F> :FZFLines<CR>

" search marks
nnoremap <silent> <M-m> :FZFMarks<CR>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
