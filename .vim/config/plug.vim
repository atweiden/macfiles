silent! if plug#begin($VIMPATH.'/plugged')

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
Plug 'duggiefresh/vim-easydir'
Plug 'preservim/nerdtree'

" keyboard
Plug 'kana/vim-arpeggio'
Plug 'drmikehenry/vim-fixkey'

" search and replace
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

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

" align
Plug 'tommcdo/vim-lion'
Plug 't9md/vim-textmanip'

" textobj
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'

" auto-close
Plug 'tmsvg/pear-tree'

" command runners
Plug 'tpope/vim-tbone'

" languages {{{

" --- elixir {{{

Plug 'elixir-editors/vim-elixir', { 'for': [ 'eelixir', 'elixir' ] }

" --- end elixir }}}
" --- journal {{{

Plug 'junegunn/vim-journal', { 'for': 'journal' }
Plug 'atweiden/vim-finn',    { 'for': 'finn', 'branch': 'finn' }

" --- end journal }}}
" --- raku {{{

Plug 'Raku/vim-raku', { 'for': 'raku' }

" --- end raku }}}
" --- reason {{{

Plug 'jordwalke/vim-reasonml', { 'for': [ 'ocaml', 'reason' ] }

" --- end reason }}}
" --- toml {{{

Plug 'cespare/vim-toml', { 'for': [ 'finn',
                                  \ 'journal',
                                  \ 'markdown',
                                  \ 'toml' ] }

" --- end toml }}}

" end languages }}}

" colors
Plug 'junegunn/seoul256.vim'

" color utilities
Plug 'ntpeters/vim-better-whitespace'
Plug 'mhinz/vim-hugefile'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/rainbow_parentheses.vim'

" macos
Plug 'nickeb96/vitality.vim'

call plug#end()
endif

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
