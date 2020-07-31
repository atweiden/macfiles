" save fzf history in $VIMPATH
let g:fzf_history_dir = $VIMPATH . '/.fzf-history'

" prepend FZF to commands
let g:fzf_command_prefix = 'FZF'

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
let g:fzf_files_options = printf('--preview "%s {} | head -' . &lines . '"',
  \ g:plugs['fzf.vim'].dir . '/bin/preview.sh')

" paint pleasant monotone statusline in fzf buffer
" fixes disappearing statusline in main vim window
function! s:fzf_statusline()
  highlight fzf1 ctermbg=95 guibg=#DFFFFF
  setlocal statusline=%#fzf1#%{'\ '}
endfunction

augroup fzfstatusline
  autocmd!
  autocmd User FzfStatusLine call <SID>fzf_statusline()
augroup END

" word completion using `cat /usr/share/dict/words`
inoremap <expr> <C-X><C-K> fzf#vim#complete(fzf#wrap({
    \ 'source': 'cat /usr/share/dict/words',
    \ 'window': {
    \   'width': 0.2,
    \   'height': 0.9,
    \   'xoffset': 1,
    \   'highlight': 'NonText',
    \   'border': 'sharp'
    \ }}))

" path completion using rg
inoremap <expr> <C-X><C-F> fzf#vim#complete(fzf#wrap({
    \ 'source': 'rg --hidden --files',
    \ 'window': {
    \   'width': 0.9,
    \   'height': 0.35,
    \   'yoffset': 0.9,
    \   'highlight': 'NonText',
    \   'border': 'sharp'
    \ }}))

" global line completion using rg (not just open buffers)
inoremap <expr> <C-X><C-L> fzf#vim#complete(fzf#wrap({
    \ 'source': 'rg -n ^ --color=always',
    \ 'options': '--ansi --delimiter : --nth 3..',
    \ 'prefix': '^.*$',
    \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }
    \ }))

" open files from cwd
nnoremap <silent> <leader>o :FZFFiles<CR>

" select buffer
nnoremap <silent> <leader>lz :FZFBuffers<CR>

" search lines in current buffer
nnoremap <silent> <M-f> :FZFBLines<CR>

" search lines in loaded buffers
nnoremap <silent> <M-F> :FZFLines<CR>

" search marks
nnoremap <silent> <M-m> :FZFMarks<CR>

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
