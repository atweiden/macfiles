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

" quick substitute
nnoremap gs :s/
xnoremap gs :s/

" highlight word under cursor without moving cursor position
nnoremap <silent> g/ :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>
xnoremap <silent> g/ "zy:let @/ = @z<CR>:set hlsearch<CR>

" remove search highlights
nnoremap <silent> <leader><CR> :nohlsearch<CR>

" find >=2 spaces after a period or question mark (repeatable with n/N)
nnoremap <silent> <localleader><CR> :let @/ = '[\.\?]\(\\\)\@<!\zs\s\s\+\ze\S'<CR>:call search(@/, "sz")<CR>

" find >=2 spaces after any non-space character (repeatable with n/N)
nnoremap <silent> <localleader><localleader><CR> :let @/ = '\S\zs\s\s\+\ze\S'<CR>:call search(@/, "sz")<CR>

" find merge conflict markers forward (repeatable with n/N)
nnoremap <silent> ]x :let @/ = '\v^[<=>]{7}([^=].+)?$'<CR>:call search(@/, "sz")<CR>

" find merge conflict markers backward (repeatable with n/N)
nnoremap <silent> [x :let @/ = '\v^[<=>]{7}([^=].+)?$'<CR>:call search(@/, "bsz")<CR>

" end search and replace }}}
" pasting {{{

" yank to end of line
noremap Y y$

" maintain cursor position post visual mode yank
vnoremap y ygv<ESC>

" copy to clipboard
vnoremap <leader>y "+ygv<ESC>
nnoremap <leader>y "+y
nnoremap <leader>Y "+y$

" paste from clipboard
noremap <leader>p "+p
noremap <leader>P "+P

" paste from clipboard holding cursor position steady
noremap <leader><leader>p mz"+p`z
noremap <leader><leader>P mz"+p`z

" end pasting }}}
" formatting and whitespace {{{

" use K to fmt lines with cursor position maintained
nnoremap <silent> K mzgqq`z
vnoremap <silent> K mzgq`z

" trim trailing whitespace
nnoremap <silent> <leader>ss :FixWhitespace<CR>:echo "Trailing whitespace has been trimmed"<CR>

" convert all tabs into spaces and continue session with spaces
nnoremap <silent> <leader>st :set expandtab<CR>:%retab!<CR>:echo "Tabs have been converted to spaces"<CR>

" convert all spaces into tabs and continue session with tabs
nnoremap <silent> <leader>sT :set noexpandtab<CR>:%retab!<CR>:echo "Spaces have been converted to tabs"<CR>

" end formatting and whitespace }}}
" writing {{{

" quick write
nnoremap <silent> <leader>w :update<CR>

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

" limit macro execution to visual selection
xnoremap Q :'<,'>:normal @q<CR>

" end redoing }}}
" digraphs {{{

" use Ctrl-U to insert digraphs
inoremap <C-U> <C-K>
cnoremap <C-U> <C-K>

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

" toggle paste mode
set pastetoggle=<F2>

" toggle line wrap
nnoremap <silent> <F3> :set nowrap!<CR>
inoremap <silent> <F3> <C-O>:set nowrap!<CR>
vnoremap <silent> <F3> <ESC>:set nowrap!<CR>gv

" toggle relative line numbers
nnoremap <silent> <F4> :set norelativenumber!<CR>
inoremap <silent> <F4> <C-O>:set norelativenumber!<CR>
vnoremap <silent> <F4> <ESC>:set norelativenumber!<CR>gv

" toggle line and column highlighting
nnoremap <silent> <F5> :ToggleCursorcolumnCursorline<CR>
inoremap <silent> <F5> <C-O>:ToggleCursorcolumnCursorline<CR>
vnoremap <silent> <F5> <ESC>:ToggleCursorcolumnCursorline<CR>gv

" toggle line numbers
nnoremap <silent> <F6> :ToggleLineNumbers<CR>
inoremap <silent> <F6> <C-O>:ToggleLineNumbers<CR>
vnoremap <silent> <F6> <ESC>:ToggleLineNumbers<CR>gv

" toggle minimalist vs nathanaelkane/vim-indent-guides tab highlighting
nnoremap <silent> <F7> :ToggleIndentGuides<CR>
inoremap <silent> <F7> <C-O>:ToggleIndentGuides<CR>
vnoremap <silent> <F7> <ESC>:ToggleIndentGuides<CR>gv

" scroll all windows simultaneously
nnoremap <silent> <F9> :windo set scrollbind!<CR>
inoremap <silent> <F9> <C-O>:windo set scrollbind!<CR>

" toggle conceallevel
nnoremap <silent> <F11> :ToggleConceal<CR>
inoremap <silent> <F11> <C-O>:ToggleConceal<CR>
vnoremap <silent> <F11> <ESC>:ToggleConceal<CR>gv

" toggle showcmd
nnoremap <silent> <leader>sc :set showcmd!<CR>

" toggle virtualedit=all
nnoremap <silent> <leader>sv :ToggleVirtualedit<CR>

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
" filetypes {{{

nnoremap <leader>sfa mz:setfiletype ada<CR>`z
nnoremap <leader>sfc mz:setfiletype clojure<CR>`z
nnoremap <leader>sfC mz:setfiletype chicken<CR>`z
nnoremap <leader>sfd mz:setfiletype diff<CR>`z
nnoremap <leader>sfe mz:setfiletype elixir<CR>`z
nnoremap <leader>sfE mz:setfiletype erlang<CR>`z
nnoremap <leader>sff mz:setfiletype finn<CR>`z
nnoremap <leader>sfF mz:setfiletype fennel<CR>`z
nnoremap <leader>sfg mz:setfiletype gitcommit<CR>`z
nnoremap <leader>sfG mz:setfiletype go<CR>`z
nnoremap <leader>sfh mz:setfiletype help<CR>`z
nnoremap <leader>sfj mz:setfiletype journal<CR>`z
nnoremap <leader>sfJ mz:setfiletype janet<CR>`z
nnoremap <leader>sfl mz:setfiletype lisp<CR>`z
nnoremap <leader>sfL mz:setfiletype lua<CR>`z
nnoremap <leader>sfm mz:setfiletype markdown<CR>`z
nnoremap <leader>sfo mz:setfiletype ocaml<CR>`z
nnoremap <leader>sfp mz:setfiletype php<CR>`z
nnoremap <leader>sfr mz:setfiletype raku<CR>`z
nnoremap <leader>sfR mz:setfiletype reason<CR>`z
nnoremap <leader>sfs mz:setfiletype sh<CR>`z
nnoremap <leader>sfS mz:setfiletype scheme<CR>`z
nnoremap <leader>sft mz:setfiletype toml<CR>`z
nnoremap <leader>sfT mz:setfiletype tex<CR>`z
nnoremap <leader>sfu mz:setfiletype rust<CR>`z
nnoremap <leader>sfv mz:setfiletype vim<CR>`z
nnoremap <leader>sfx mz:setfiletype text<CR>`z
nnoremap <leader>sfy mz:setfiletype yaml<CR>`z
nnoremap <leader>sfz mz:setfiletype zig<CR>`z
nnoremap <leader>sF :setfiletype<space>

" end filetypes }}}
" folds {{{

" toggle folds
nnoremap <silent> g<space> :execute ":silent! normal za"<CR>

" focus current line with minimal number of folds open
nnoremap <silent> <leader><space> :call FocusLine()<CR>

" end folds }}}
" buffers {{{

" buffer navigation
nnoremap <silent> gd :bdelete<CR>
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> gB :bprev<CR>

" end buffers }}}
" windows {{{

" use alt-{n,p} to move to next and previous window respectively
" use alt-{H,J,K,L} to reposition window split
nnoremap <silent> <M-n> <C-W><C-W>
inoremap <silent> <M-n> <C-O><C-W><C-W>
vnoremap <silent> <M-n> <ESC><C-W><C-W>gv
cnoremap <silent> <M-n> <C-C><C-W><C-W>
tnoremap <silent> <M-n> <C-W><C-W>
nnoremap <silent> <M-p> <C-W><S-W>
inoremap <silent> <M-p> <C-O><C-W><S-W>
vnoremap <silent> <M-p> <ESC><C-W><S-W>gv
cnoremap <silent> <M-p> <C-C><C-W><S-W>
tnoremap <silent> <M-p> <C-W><S-W>
nnoremap <silent> <M-H> <C-W>H
inoremap <silent> <M-H> <C-O><C-W>H
vnoremap <silent> <M-H> <ESC><C-W>Hgv
cnoremap <silent> <M-H> <C-C><C-W>H
tnoremap <silent> <M-H> <C-W>H
nnoremap <silent> <M-J> <C-W>J
inoremap <silent> <M-J> <C-O><C-W>J
vnoremap <silent> <M-J> <ESC><C-W>Jgv
cnoremap <silent> <M-J> <C-C><C-W>J
tnoremap <silent> <M-J> <C-W>J
nnoremap <silent> <M-K> <C-W>K
inoremap <silent> <M-K> <C-O><C-W>K
vnoremap <silent> <M-K> <ESC><C-W>Kgv
cnoremap <silent> <M-K> <C-C><C-W>K
tnoremap <silent> <M-K> <C-W>K
nnoremap <silent> <M-L> <C-W>L
inoremap <silent> <M-L> <C-O><C-W>L
vnoremap <silent> <M-L> <ESC><C-W>Lgv
cnoremap <silent> <M-L> <C-C><C-W>L
tnoremap <silent> <M-L> <C-W>L

" end windows }}}
" screen {{{

" redraw screen
nnoremap <silent> <leader><leader><CR> :redraw!<CR>:syntax sync fromstart<CR>

" end screen }}}

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
