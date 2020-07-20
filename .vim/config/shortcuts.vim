" bind escape key
silent! call arpeggio#load()
silent! Arpeggio noremap jk <ESC>
silent! Arpeggio inoremap jk <ESC>
silent! Arpeggio cnoremap jk <C-C>

" selecting {{{

" visually select text last edited/pasted
nnoremap <expr> gV '`[' . strpart(getregtype(), 0, 1) . '`]'

" DWIM indenting:
" preserve visual selection
vnoremap > >gv
vnoremap < <gv
" normal mode tab `count` number of times, repeatably
nnoremap <expr> > Repeatable('Indent')
nnoremap <expr> < Repeatable('Dedent')

" end selecting }}}
" search and replace {{{

" remove search highlights
nnoremap <silent> <leader><CR> :nohlsearch<CR>

" find >=2 spaces after a period or question mark (repeatable with n/N)
nnoremap <silent> <localleader><CR> :let @/ = '[\.\?]\zs\s\s\+\ze\S'<CR>:call search(@/, "sz")<CR>

" find >=2 spaces after any non-space character (repeatable with n/N)
nnoremap <silent> <localleader><localleader><CR> :let @/ = '\S\zs\s\s\+\ze\S'<CR>:call search(@/, "sz")<CR>

" find merge conflict markers forward (repeatable with n/N)
nnoremap <silent> <F6> :let @/ = '\v^[<=>]{7}'<CR>:call search(@/, "sz")<CR>

" find merge conflict markers backward (repeatable with n/N)
nnoremap <silent> <S-F6> :let @/ = '\v^[<=>]{7}'<CR>:call search(@/, "bsz")<CR>

" end search and replace }}}
" pasting {{{

" yank to end of line
noremap Y y$

" copy to clipboard
vnoremap <leader>y "+yy<ESC>
nnoremap <leader>y "+y
nnoremap <leader>Y "+y$

" paste from clipboard
noremap <leader>p "+p
noremap <leader>P "+P

" paste from clipboard holding cursor position steady
noremap <leader><leader>p mz"+p`z
noremap <leader><leader>P mz"+p`z

" end pasting }}}
" formatting {{{

" format visual selection with spacebar
vnoremap <space> :!fmt<CR>

" end formatting }}}
" writing {{{

" quick write
nnoremap <silent> <leader>w :w<CR>

" sudo write
command! W execute 'silent! write !sudo tee % >/dev/null' <Bar> edit!

" get path of current buffer
cnoremap <expr> <F1> getcmdtype() == ':' ? expand('%:h') . '/' : ''

" end writing }}}
" redoing {{{

" maintain location in document while redoing
nnoremap . .`[

" qq to record, Q to replay
nnoremap Q @q

" end redoing }}}
" digraphs {{{

if has('digraphs')
  " (¡) inverted exclamation mark
  digraph !! 161
  " (§) section sign
  digraph SS 167
  " (°) degree symbol
  digraph oo 176
  " (¿) inverted question mark
  digraph ?? 191
  " (ʹ) modifier letter prime
  digraph '' 697
  " (฿) thai baht
  digraph B\| 3647
  " (–) en dash
  digraph -- 8211
  " (—) em dash
  digraph -= 8212
  " (‘) curly left single quote
  digraph Ql 8216
  " (’) curly right single quote
  digraph Qr 8217
  " (“) curly left double quote
  digraph ql 8220
  " (”) curly right double quote
  digraph qr 8221
  " (…) ellipsis
  digraph ., 8230
  " (✓) checkmark
  digraph ./ 10003
endif

" end digraphs }}}
" timestamps {{{

" add ISO 8601 timestamp sans newline
nnoremap <silent> <leader>D a<C-R>=substitute(strtrans(system("date --iso-8601=s")),'\^@','','g')<CR><ESC>

" end timestamps }}}
" toggles {{{

" toggle show tab-completed wild menu
nnoremap <silent> <F1> :let &wildmode=&wildmode=~"full" ? "list:longest" : "list:longest,full" <Bar> set wildmode?<CR>

" toggle paste mode
set pastetoggle=<F2>

" toggle line wrap
nnoremap <silent> <F3> :set nowrap!<CR>
inoremap <silent> <F3> <C-O>:set nowrap!<CR>
vnoremap <silent> <F3> <ESC>:set nowrap!<CR>gv

" toggle line numbers
nnoremap <silent> <F4> :set norelativenumber!<CR>
inoremap <silent> <F4> <C-O>:set norelativenumber!<CR>
vnoremap <silent> <F4> <ESC>:set norelativenumber!<CR>gv

" toggle line and column highlighting
nnoremap <silent> <F5> :set nocursorline! nocursorcolumn!<CR>
inoremap <silent> <F5> <C-O>:set nocursorline! nocursorcolumn!<CR>
vnoremap <silent> <F5> <ESC>:set nocursorline! nocursorcolumn!<CR>gv

" toggle minimalist vs nathanaelkane/vim-indent-guides tab highlighting
nnoremap <silent> <F7> :ToggleIndentGuides<CR>
inoremap <silent> <F7> <C-O>:ToggleIndentGuides<CR>
vnoremap <silent> <F7> <ESC>:ToggleIndentGuides<CR>gv

" scroll all windows simultaneously
nnoremap <silent> <F9> :windo set scrollbind!<CR>
inoremap <silent> <F9> <C-O>:windo set scrollbind!<CR>

" toggle showcmd
nnoremap <silent> <leader>sc :set showcmd!<CR>

" convert all tabs into spaces and continue session with spaces
nnoremap <silent> <leader>st :set expandtab<CR>:%retab!<CR>:echo "Tabs have been converted to spaces"<CR>

" convert all spaces into tabs and continue session with tabs
nnoremap <silent> <leader>sT :set noexpandtab<CR>:%retab!<CR>:echo "Spaces have been converted to tabs"<CR>

" toggle virtualedit=all
nnoremap <silent> <leader>sv :let &virtualedit=&virtualedit=="block" ? "all" : "block" <Bar> set virtualedit?<CR>

" end toggles }}}
" lines {{{

" keep the cursor in place while joining lines
nnoremap J mzJ`z

" split line without clobbering search history
nnoremap <silent> S i<CR><ESC>^mwgk:silent! keeppatterns s/\v +$//<CR>:noh<CR>`w

" put blank line above current line
nmap [<space> <Plug>PutBlankLineAbove

" put blank line below current line
nmap ]<space> <Plug>PutBlankLineBelow

" end lines }}}
" deletes {{{

" delete char adjacent-right without moving cursor over one from the left
nnoremap <expr> gx Repeatable('DeleteCharRight')

" end deletes }}}
" movement {{{

" move between beginning and end of line
nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_

" end movement }}}
" folds {{{

" toggle folds with g+spacebar
nnoremap <silent> g<space> za

" focus just the current line with minimal number of folds open
nnoremap <silent> <leader><space> zMzvzz

" navigate folds
nnoremap <silent> <leader>fk zk
nnoremap <silent> <leader>fj zj

" set fold level
nnoremap <silent> <leader>f0 :set foldlevel=0<CR>
nnoremap <silent> <leader>f1 :set foldlevel=1<CR>
nnoremap <silent> <leader>f2 :set foldlevel=2<CR>
nnoremap <silent> <leader>f3 :set foldlevel=3<CR>
nnoremap <silent> <leader>f4 :set foldlevel=4<CR>
nnoremap <silent> <leader>f5 :set foldlevel=5<CR>
nnoremap <silent> <leader>f6 :set foldlevel=6<CR>
nnoremap <silent> <leader>f7 :set foldlevel=7<CR>
nnoremap <silent> <leader>f8 :set foldlevel=8<CR>
nnoremap <silent> <leader>f9 :set foldlevel=9<CR>

" end folds }}}
" buffers {{{

" buffer navigation
nnoremap <silent> gd :bdelete<CR>
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> gB :bprev<CR>
nnoremap <silent> <leader>1 :<C-U>buffer 1<CR>
nnoremap <silent> <leader>2 :<C-U>buffer 2<CR>
nnoremap <silent> <leader>3 :<C-U>buffer 3<CR>
nnoremap <silent> <leader>4 :<C-U>buffer 4<CR>
nnoremap <silent> <leader>5 :<C-U>buffer 5<CR>
nnoremap <silent> <leader>6 :<C-U>buffer 6<CR>
nnoremap <silent> <leader>7 :<C-U>buffer 7<CR>
nnoremap <silent> <leader>8 :<C-U>buffer 8<CR>
nnoremap <silent> <leader>9 :<C-U>buffer 9<CR>

" end buffers }}}
" windows {{{

" map alt-[h,j,k,l] to resizing a window split
" map alt-[N,P] to moving to next and previous window respectively
" map alt-[H,J,K,L] to repositioning a window split
nnoremap <silent> <M-h> :<C-U>ObviousResizeLeft<CR>
nnoremap <silent> <M-j> :<C-U>ObviousResizeDown<CR>
nnoremap <silent> <M-k> :<C-U>ObviousResizeUp<CR>
nnoremap <silent> <M-l> :<C-U>ObviousResizeRight<CR>
nnoremap <silent> <M-N> <C-W><C-W>
nnoremap <silent> <M-P> <C-W><S-W>
nnoremap <silent> <M-H> <C-W>H
nnoremap <silent> <M-J> <C-W>J
nnoremap <silent> <M-K> <C-W>K
nnoremap <silent> <M-L> <C-W>L

" end windows }}}
" screen {{{

" redraw screen
nnoremap <silent> <leader><leader><CR> :redraw!<CR>

" end screen }}}

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
