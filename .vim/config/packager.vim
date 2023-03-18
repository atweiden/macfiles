vim9script

def PackagerSetup(): void
  packadd vim-packager
  packager#init()
  packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

  # status
  packager#add('atweiden/lightline.vim', { 'branch': 'seoul256-light' })
  packager#add('itchyny/vim-gitbranch')

  # windows
  packager#add('talek/obvious-resize')

  # folds
  packager#add('atweiden/vim-neatfoldtext')

  # filesystem
  packager#add('preservim/nerdtree', { 'type': 'opt' })

  # keyboard
  packager#add('kana/vim-arpeggio', { 'type': 'opt' })
  packager#add('drmikehenry/vim-fixkey')

  # search and replace
  packager#add('dyng/ctrlsf.vim', { 'type': 'opt' })
  packager#add('junegunn/fzf', { 'type': 'opt',
                                   'do': './install --bin' })
  packager#add('junegunn/fzf.vim', { 'type': 'opt' })
  packager#add('t9md/vim-quickhl', { 'type': 'opt' })

  # movement
  packager#add('atweiden/clever-f.vim', { 'branch': 'rm-hl-clear' })
  packager#add('christoomey/vim-tmux-navigator')

  # repeat
  packager#add('tpope/vim-repeat')

  # undo
  packager#add('mbbill/undotree', { 'type': 'opt' })

  # surround
  packager#add('tpope/vim-surround')

  # comments
  packager#add('tpope/vim-commentary')

  # modelines
  packager#add('ciaranm/securemodelines')

  # align
  packager#add('tommcdo/vim-lion', { 'type': 'opt' })
  packager#add('t9md/vim-textmanip', { 'type': 'opt' })

  # narrow region
  packager#add('atweiden/vim-viewport', { 'type': 'opt' })

  # command runners
  packager#add('tpope/vim-tbone', { 'type': 'opt' })

  # ex mode
  packager#add('tyru/capture.vim', { 'type': 'opt' })

  # dvcs
  packager#add('sjl/splice.vim', { 'type': 'opt' })

  # languages {{{

  # --- elixir {{{

  packager#add('elixir-editors/vim-elixir', { 'type': 'opt' })

  # --- end elixir }}}
  # --- fsharp {{{

  packager#add('PhilT/vim-fsharp', { 'type': 'opt' })

  # --- end fsharp }}}
  # --- go {{{

  packager#add('fatih/vim-go', { 'type': 'opt' })

  # --- end go }}}
  # --- hare {{{

  packager#add('https://git.sr.ht/~sircmpwn/hare.vim', { 'type': 'opt' })

  # --- end hare }}}
  # --- journal {{{

  packager#add('junegunn/vim-journal', { 'type': 'opt' })
  packager#add('atweiden/vim-finn', { 'branch': 'finn',
                                        'type': 'opt' })

  # --- end journal }}}
  # --- just {{{

  packager#add('NoahTheDuke/vim-just', { 'type': 'opt' })

  # --- end just }}}
  # --- lisp {{{

  packager#add('atweiden/vim-fennel', { 'type': 'opt' })
  packager#add('janet-lang/janet.vim', { 'type': 'opt' })
  packager#add('atweiden/vim-kiwi', { 'type': 'opt' })

  # structured editing
  packager#add('guns/vim-sexp', { 'type': 'opt' })

  # --- end lisp }}}
  # --- raku {{{

  packager#add('Raku/vim-raku', { 'type': 'opt' })

  # --- end raku }}}
  # --- rust {{{

  packager#add('rust-lang/rust.vim', { 'type': 'opt' })

  # --- end rust }}}
  # --- toml {{{

  packager#add('cespare/vim-toml', { 'type': 'opt' })

  # --- end toml }}}
  # --- zig {{{

  packager#add('atweiden/zig.vim', { 'branch': 'develop',
                                       'type': 'opt' })

  # --- end zig }}}

  # end languages }}}

  # colors
  packager#add('atweiden/seoul256.vim', { 'branch': 'fix-todo-hi' })
  packager#add('atweiden/vim-preto')

  # color utilities
  packager#add('ntpeters/vim-better-whitespace')
  packager#add('mhinz/vim-hugefile')
  packager#add('nathanaelkane/vim-indent-guides', { 'type': 'opt' })
  packager#add('junegunn/rainbow_parentheses.vim', { 'type': 'opt' })
  packager#add('guns/xterm-color-table.vim', { 'type': 'opt' })
enddef

command! PackagerSetup PackagerSetup()
command! PackagerInstall PackagerSetup() | packager#install()
command! -bang PackagerUpdate PackagerSetup() | packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean PackagerSetup() | packager#clean()
command! PackagerStatus PackagerSetup() | packager#status()

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
