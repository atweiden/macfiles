silent! if plug#begin($VIMPATH.'/plugged')

" status
Plug 'itchyny/lightline.vim'

" windows
Plug 'talek/obvious-resize'

" buffers
Plug 'mihaifm/bufstop'
Plug 'vim-scripts/clone'
Plug 'chrisbra/NrrwRgn'
Plug 'chrisbra/Recover.vim'

" folds
Plug 'Konfekt/FastFold'
Plug 'Harenome/vim-neatfoldtext'

" filesystem
Plug 'dockyard/vim-easydir'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" keyboard
Plug 'kana/vim-arpeggio'
if !has('nvim') | Plug 'drmikehenry/vim-fixkey' | endif

" search and replace
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" movement
Plug 'rhysd/clever-f.vim'
Plug 'benjifisher/matchit.zip'
Plug 'christoomey/vim-tmux-navigator'

" repeat
Plug 'tpope/vim-repeat'
Plug 'etihwnad/vim-visualrepeat'

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
Plug 'junegunn/vim-after-object'
Plug 'inkarkat/vim-LineJuggler'
Plug 'inkarkat/vim-LineJugglerCommands'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-entire'
Plug 'reedes/vim-textobj-sentence'

" bookmarks
Plug 'kshenoy/vim-signature'

" auto-close
Plug 'jiangmiao/auto-pairs'

" tags
Plug 'majutsushi/tagbar'

" vcs
Plug 'rhysd/committia.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" crypto
Plug 'jamessan/vim-gnupg'
Plug 'fcharlier/openssl.vim'

" command runners
Plug 'tpope/vim-tbone'

" sonic pi
Plug 'dermusikman/sonicpi.vim'

" languages {{{

" --- c/c++ {{{

Plug 'vim-jp/vim-cpp',                   { 'for': [ 'c', 'cpp' ] }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': [ 'c', 'cpp' ] }

" --- end c/c++ }}}
" --- dart {{{

Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }

" --- end dart }}}
" --- elixir {{{

Plug 'elixir-editors/vim-elixir', { 'for': [ 'eelixir', 'elixir' ] }

" --- end elixir }}}
" --- go {{{

Plug 'fatih/vim-go',        { 'for': 'go' }
Plug 'vim-jp/vim-go-extra', { 'for': 'go' }

" --- end go }}}
" --- journal/finn {{{

Plug 'junegunn/vim-journal', { 'for': 'journal' }
Plug 'atweiden/vim-finn',    { 'for': 'finn', 'branch': 'finn' }

" --- end journal/finn }}}
" --- markdown {{{

Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }

" --- end markdown }}}
" --- nim {{{

Plug 'baabelfish/nvim-nim', { 'for': 'nim' }

" --- end nim }}}
" --- perl/perl6 {{{

Plug 'vim-perl/vim-perl',              { 'for': 'perl' }
Plug 'vim-perl/vim-perl6',             { 'for': 'perl6' }
Plug 'yuuki1/perl-local-lib-path.vim', { 'for': [ 'perl', 'perl6' ] }

" --- end perl/perl6 }}}
" --- reason {{{

Plug 'jordwalke/vim-reason', { 'for': 'reason' }

" --- end reason }}}
" --- toml {{{

Plug 'cespare/vim-toml', { 'for': [ 'finn', 'journal', 'markdown', 'toml' ] }

" --- end toml }}}
" --- vim {{{

Plug 'vim-jp/syntax-vim-ex', { 'for': 'vim' }

" --- end vim }}}

" end languages }}}

" colors
Plug 'guns/jellyx.vim'
Plug 'junegunn/seoul256.vim'

" color utilities
Plug 'ntpeters/vim-better-whitespace'
Plug 'mhinz/vim-hugefile'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/rainbow_parentheses.vim'

" utilities / dependencies
Plug 'inkarkat/vim-ingo-library'
Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-scriptease'
Plug 'kana/vim-textobj-user'

call plug#end()
endif

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
