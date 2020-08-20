silent! if plug#begin($VIMPATH . '/plugged')

" status
Plug 'itchyny/lightline.vim'

" windows
Plug 'talek/obvious-resize'

" buffers
Plug 'mihaifm/bufstop'

" folds
Plug 'Konfekt/FastFold'
Plug 'Harenome/vim-neatfoldtext'

" filesystem
Plug 'preservim/nerdtree', { 'on': [ 'NERDTree',
                                   \ 'NERDTreeCWD',
                                   \ 'NERDTreeClose',
                                   \ 'NERDTreeFind',
                                   \ 'NERDTreeFocus',
                                   \ 'NERDTreeFromBookmark',
                                   \ 'NERDTreeMirror',
                                   \ 'NERDTreeRefreshRoot',
                                   \ 'NERDTreeToggle',
                                   \ 'NERDTreeToggleVCS',
                                   \ 'NERDTreeVCS' ] }

" keyboard
Plug 'kana/vim-arpeggio'
Plug 'drmikehenry/vim-fixkey'

" search and replace
Plug 'dyng/ctrlsf.vim', { 'on': [ 'CtrlSF',
                                \ 'CtrlSFClose',
                                \ 'CtrlSFOpen',
                                \ 'CtrlSFToggle' ] }
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 't9md/vim-quickhl'

" movement
Plug 'rhysd/clever-f.vim'
Plug 'christoomey/vim-tmux-navigator'

" repeat
Plug 'tpope/vim-repeat'

" undo
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" surround
Plug 'tpope/vim-surround'

" comments
Plug 'tpope/vim-commentary'

" modelines
Plug 'ciaranm/securemodelines'

" registers
Plug 'junegunn/vim-peekaboo'

" align
Plug 'tommcdo/vim-lion'
Plug 't9md/vim-textmanip'

" narrow region
Plug 'atweiden/vim-viewport'

" command runners
Plug 'tpope/vim-tbone'

" ex mode
Plug 'tyru/capture.vim', { 'on': 'Capture' }

" dvcs
Plug 'sjl/splice.vim'

" languages {{{

" --- elixir {{{

Plug 'elixir-editors/vim-elixir', { 'for': [ 'eelixir',
                                           \ 'elixir' ] }

" --- end elixir }}}
" --- journal {{{

Plug 'junegunn/vim-journal', { 'for': 'journal' }
Plug 'atweiden/vim-finn',    { 'branch': 'finn',
                                \ 'for': 'finn' }

" --- end journal }}}
" --- lisp {{{

Plug 'atweiden/vim-fennel', { 'for': 'fennel' }
Plug 'janet-lang/janet.vim', { 'for': 'janet' }

" repl
if has('nvim')
  Plug 'Olical/conjure', { 'for': [ 'fennel',
                                  \ 'janet' ] }
endif

" structured editing
Plug 'guns/vim-sexp', { 'for': g:lispft }

" --- end lisp }}}
" --- raku {{{

Plug 'Raku/vim-raku', { 'for': 'raku' }

" --- end raku }}}
" --- reason {{{

Plug 'jordwalke/vim-reasonml', { 'for': [ 'ocaml',
                                        \ 'reason' ] }

" --- end reason }}}
" --- toml {{{

Plug 'cespare/vim-toml', { 'for': [ 'finn',
                                  \ 'journal',
                                  \ 'markdown',
                                  \ 'toml' ] }

" --- end toml }}}

" end languages }}}

" colors
Plug 'atweiden/seoul256.vim', { 'branch': 'fix-todo-hi' }

" color utilities
Plug 'ntpeters/vim-better-whitespace'
Plug 'mhinz/vim-hugefile'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'guns/xterm-color-table.vim', { 'on': 'XtermColorTable' }

call plug#end()
endif

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
