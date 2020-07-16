" bind escape key
silent! call arpeggio#load()
silent! Arpeggio noremap jk <ESC>
silent! Arpeggio inoremap jk <ESC>
silent! Arpeggio cnoremap jk <C-C>

" selecting {{{

" visually select the text that was last edited/pasted
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

" find >=2 spaces after a period or question mark (repeatable with n/N)
nnoremap <silent> <localleader><CR> :let @/ = '[\.\?]\ze\s\s\+\S'<CR>:call search(@/, "sz")<CR>

" find >=2 spaces after any non-space character (repeatable with n/N)
nnoremap <silent> <localleader><localleader><CR> :let @/ = '\S\ze\s\s\+\S'<CR>:call search(@/, "sz")<CR>

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
  " (᚛) ogham feather mark
  digraph >\| 5787
  " (᚜) ogham reversed feather mark
  digraph <\| 5788
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
  " (⁅) left square bracket with quill
  digraph [- 8261
  " (⁆) right square bracket with quill
  digraph -] 8262
  " (∈) equivalent to `(elem)`: https://docs.raku.org/routine/(elem),%20infix%20%E2%88%88
  digraph (- 8712
  " (∉) equivalent to `!(elem)`: https://docs.raku.org/routine/%E2%88%89
  digraph (/ 8713
  " (∋) equivalent to `(cont)`: https://docs.raku.org/routine/(cont),%20infix%20%E2%88%8B
  digraph -) 8715
  " (∌) equivalent to `!(cont)`: https://docs.raku.org/routine/%E2%88%8C
  digraph /) 8716
  " (∖) equivalent to `(-)`: https://docs.raku.org/routine/(-),%20infix%20%E2%88%96
  digraph \\ 8726
  " (∩) equivalent to `(&)`: https://docs.raku.org/routine/(&),%20infix%20%E2%88%A9
  digraph (U 8745
  " (∪) equivalent to `(|)`: https://docs.raku.org/routine/(%7C),%20infix%20%E2%88%AA
  digraph )U 8746
  " (≅) equivalent to `=~=`: https://docs.raku.org/routine/=~=
  digraph =~ 8773
  " (≼) equivalent to `(<+)`: https://docs.raku.org/language/unicode_ascii#index-entry-%E2%89%BC
  digraph <+ 8828
  " (≽) equivalent to `(+>)`: https://docs.raku.org/language/unicode_ascii#index-entry-%E2%89%BD
  digraph +> 8829
  " (⊂) equivalent to `(<)`: https://docs.raku.org/routine/(%3C),%20infix%20%E2%8A%82
  digraph (c 8834
  " (⊃) equivalent to `(>)`: https://docs.raku.org/routine/(%3E),%20infix%20%E2%8A%83
  digraph )c 8835
  " (⊄) equivalent to `!(<)`: https://docs.raku.org/routine/%E2%8A%84
  digraph c/ 8836
  " (⊅) equivalent to `!(>)`: https://docs.raku.org/routine/%E2%8A%85
  digraph \c 8837
  " (⊆) equivalent to `(<=)`: https://docs.raku.org/routine/(%3C=),%20infix%20%E2%8A%86
  digraph (_ 8838
  " (⊇) equivalent to `(>=)`: https://docs.raku.org/routine/(%3E=),%20infix%20%E2%8A%87
  digraph )_ 8839
  " (⊈) equivalent to `!(<=)`: https://docs.raku.org/routine/%E2%8A%88
  digraph _/ 8840
  " (⊉) equivalent to `!(>=)`: https://docs.raku.org/routine/%E2%8A%89
  digraph \_ 8841
  " (⊍) equivalent to `(.)`: https://docs.raku.org/routine/(.),%20infix%20%E2%8A%8D
  digraph U. 8845
  " (⊎) equivalent to `(+)`: https://docs.raku.org/routine/(+),%20infix%20%E2%8A%8E
  digraph U+ 8846
  " (⊖) equivalent to `(^)`: https://docs.raku.org/routine/($CIRCUMFLEX_ACCENT),%20infix%20%E2%8A%96
  digraph 0- 8854
  " (✓) checkmark
  digraph ./ 10003
  " (⟅) left s-shaped bag delimiter
  digraph s\ 10181
  " (⟆) right s-shaped bag delimiter
  digraph s/ 10182
endif

" end digraphs }}}
" timestamps {{{

" add ISO 8601 timestamp sans newline
nnoremap <silent> <leader>D a<C-R>=substitute(strtrans(system("date --iso-8601=s")),'\^@','','g')<CR><ESC>

" end timestamps }}}
" toggles {{{

" toggle paste mode
set pastetoggle=<F2>

" toggle line wrap
noremap <silent> <F3> :set nowrap!<CR>
inoremap <silent> <F3> <C-O>:set nowrap!<CR>
vnoremap <silent> <F3> <ESC>:set nowrap!<CR>gv

" toggle line numbers
nnoremap <silent> <F4> :set norelativenumber!<CR>
inoremap <silent> <F4> <C-O>:set norelativenumber!<CR>
vnoremap <silent> <F4> <ESC>:set norelativenumber!<CR>gv

" toggle line and column highlighting
noremap <silent> <F5> :set nocursorline! nocursorcolumn!<CR>
inoremap <silent> <F5> <C-O>:set nocursorline! nocursorcolumn!<CR>
vnoremap <silent> <F5> <ESC>:set nocursorline! nocursorcolumn!<CR>gv

" toggle spell checking
noremap <silent> <F7> :set spell! spelllang=en_us<CR>
inoremap <silent> <F7> <C-O>:set spell! spelllang=en_us<CR>
vnoremap <silent> <F7> <ESC>:set spell! spelllang=en_us<CR>gv

" scroll all windows simultaneously
nnoremap <silent> <F9> :windo set scrollbind!<CR>
inoremap <silent> <F9> <C-O>:windo set scrollbind!<CR>

" convert all tabs into spaces and continue session with spaces
nnoremap <silent><expr> g<M-t> ':set expandtab<CR>:retab!<CR>:echo "Tabs have been converted to spaces"<CR>'

" convert all spaces into tabs and continue session with tabs
nnoremap <silent><expr> g<M-T> ':set noexpandtab<CR>:%retab!<CR>:echo "Spaces have been converted to tabs"<CR>'

" toggle showcmd
nnoremap <silent> <leader>sc :set showcmd!<CR>

" toggle virtualedit=all
nnoremap <silent> <leader><leader>v :let &virtualedit=&virtualedit=="block" ? "all" : "block" <Bar> set virtualedit?<CR>

" end toggles }}}
" split/joins {{{

" keep the cursor in place while joining lines
nnoremap J mzJ`z

" split line
nnoremap <silent> S i<CR><ESC>^mwgk:silent! s/\v +$//<CR>:noh<CR>`w

" end split/joins }}}
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
" whitespacing {{{

" put blank line above current line
nmap [<space> <Plug>PutBlankLineAbove

" put blank line below current line
nmap ]<space> <Plug>PutBlankLineBelow

" set tabstop, shiftwidth and softtabstop to same (specified) value
nnoremap <leader>ts :Stab<CR>

" echo tabstop, shiftwidth, softtabstop and expandtab values
nnoremap <leader>st :call SummarizeTabs()<CR>

" end whitespacing }}}
" folds {{{

" toggle folds with g+spacebar, don't echo error message if not in fold
nnoremap <silent> g<space> :execute ":silent! normal za"<CR>

" focus just the current line with minimal number of folds open
nnoremap <silent> <leader><space> zMzvzz

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
nnoremap <silent> <leader><leader><CR> :redraw!

" end screen }}}

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
