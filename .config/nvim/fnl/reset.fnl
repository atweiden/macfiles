;; don't load vendored defaults.vim
(set vim.g.skip_defaults_vim 1)

;; disable unnecessary default plugins
(each [_ plugin (ipairs [:zip
                         :zipPlugin
                         :getscript
                         :getscriptPlugin
                         :vimball
                         :vimballPlugin
                         :2html_plugin
                         :logiPat
                         :man
                         :matchparen
                         :spellfile_plugin
                         :rrhelper
                         :netrw
                         :netrwPlugin
                         :netrwSettings
                         :netrwFileHandlers])]
  (set (. :vim :g (.. "loaded_" plugin)) 1))

;; don't use spacebar to push cursor right
(vim.keymap.set [:n :v] "<space>" "<nop>" {:noremap true})

;; don't use backspace to push cursor left
(vim.keymap.set [:n :v] "<BS>" "<nop>" {:noremap true})

;; don't use ! to filter text lines through external program
(vim.keymap.set :n "!" "<nop>" {:noremap true})

;; don't use # or * to search word under cursor
(vim.keymap.set [:n :v] "#" "<nop>" {:noremap true})
(vim.keymap.set [:n :v] "g#" "<nop>" {:noremap true})
(vim.keymap.set [:n :v] "*" "<nop>" {:noremap true})
(vim.keymap.set [:n :v] "g*" "<nop>" {:noremap true})

;; don't use & to repeat last substitute
(vim.keymap.set [:n :v] "&" "<nop>" {:noremap true})
(vim.keymap.set [:n :v] "g&" "<nop>" {:noremap true})

;; don't use -/+ for line-wise navigation
(vim.keymap.set [:n :v] "-" "<nop>" {:noremap true})
(vim.keymap.set [:n :v] "+" "<nop>" {:noremap true})

;; don't use = to indent
(vim.keymap.set [:n :v] "=" "<nop>")

;; don't use z for spelling
;; see: |z|

;; --- spelling {{{

;; give spelling suggestions
(vim.keymap.set [:n :v] "z=" "<nop>" {:noremap true})

;; mark word as good spelled word
(vim.keymap.set [:n :v] "zG" "<nop>" {:noremap true})

;; mark word as wrong (bad) spelled word
(vim.keymap.set [:n :v] "zW" "<nop>" {:noremap true})

;; mark word as good spelled word
(vim.keymap.set [:n :v] "zg" "<nop>" {:noremap true})

;; undo |zw|
(vim.keymap.set [:n :v] "zuw" "<nop>" {:noremap true})

;; undo |zg|
(vim.keymap.set [:n :v] "zug" "<nop>" {:noremap true})

;; undo |zW|
(vim.keymap.set [:n :v] "zuW" "<nop>" {:noremap true})

;; undo |zG|
(vim.keymap.set [:n :v] "zuG" "<nop>" {:noremap true})

;; mark word as wrong (bad) spelled word
(vim.keymap.set [:n :v] "zw" "<nop>" {:noremap true})

;; --- end spelling }}}

;; don't use gQ to enter ex mode
(vim.keymap.set :n "gQ" "<nop>" {:noremap true})

;; don't use gq to format text
(vim.keymap.set :n "gq" "<nop>" {:noremap true})

;; don't use gw to format text
(vim.keymap.set :n "gw" "<nop>" {:noremap true})

;; don't use <C-A> for incrementing, interferes with tmux prefix
(vim.keymap.set [:n :v] "<C-A>" "<nop>" {:noremap true})
(vim.keymap.set [:n :v] "g<C-A>" "<nop>" {:noremap true})

;; don't use <C-X> for decrementing
(vim.keymap.set [:n :v] "<C-X>" "<nop>" {:noremap true})
(vim.keymap.set [:n :v] "g<C-X>" "<nop>" {:noremap true})

;; don't use <C-L> for redrawing screen
(vim.keymap.set [:n :v] "<C-L>" "<nop>" {:noremap true})

;; don't use ZZ or ZQ for writing buffer, exiting
(vim.keymap.set :n "ZZ" "<nop>")
(vim.keymap.set :n "ZQ" "<nop>")

;; don't press F1 for help
(vim.keymap.set [:n :v :i] "<F1>" "<nop>" {:noremap true})

;; don't press K for manpage
(vim.keymap.set [:n :v] "K" "<nop>" {:noremap true})

;; don't press M to position cursor on middle line of window
(vim.keymap.set [:n :v] "M" "<nop>" {:noremap true})

;; don't use Ctrl-H to delete
(vim.keymap.set [:i :c] "<C-H>" "<nop>" {:noremap true})
;; don't use Ctrl-J to begin new line
(vim.keymap.set :i "<C-J>" "<nop>" {:noremap true})
;; don't use Ctrl-J to start entered command
(vim.keymap.set :c "<C-J>" "<nop>" {:noremap true})
;; don't use Ctrl-K to input digraph
(vim.keymap.set [:i :c] "<C-K>" "<nop>" {:noremap true})
;; don't use Ctrl-L to insert ^L or switch to normal mode
(vim.keymap.set :i "<C-L>" "<nop>" {:noremap true})
;; don't use Ctrl-L in pattern match entry
(vim.keymap.set :c "<C-L>" "<nop>" {:noremap true})

;; don't use Ctrl-E to insert character below cursor
(vim.keymap.set :i "<C-E>" "<nop>" {:noremap true})
;; don't use Ctrl-Y to insert character above cursor
(vim.keymap.set :i "<C-Y>" "<nop>" {:noremap true})
;; don't use Ctrl-A to insert previously inserted text
(vim.keymap.set :i "<C-A>" "<nop>" {:noremap true})
;; don't use Ctrl-A to insert all names matching pattern in front of cursor
(vim.keymap.set :c "<C-A>" "<nop>" {:noremap true})
;; don't use Ctrl-@ to insert previously inserted text and stop insert
(vim.keymap.set :i "<C-@>" "<nop>" {:noremap true})

;; don't use Ctrl-W to delete word before cursor
(vim.keymap.set :i "<C-W>" "<nop>" {:noremap true})
;; don't use Ctrl-U to delete characters before cursor on current line
(vim.keymap.set :i "<C-U>" "<nop>" {:noremap true})

;; don't use Shift-← to move cursor one word back
(vim.keymap.set [:i :c] "<S-Left>" "<nop>" {:noremap true})
;; don't use Ctrl-← to move cursor one word back
(vim.keymap.set [:i :c] "<C-Left>" "<nop>" {:noremap true})
;; don't use Shift-→ to move cursor one word forward
(vim.keymap.set [:i :c] "<S-Right>" "<nop>" {:noremap true})
;; don't use Ctrl-→ to move cursor one word forward
(vim.keymap.set [:i :c] "<C-Right>" "<nop>" {:noremap true})
;; don't use Shift-↑ to move window one page up
(vim.keymap.set :i "<S-Up>" "<nop>" {:noremap true})
;; don't use Shift-↑ to recall older command from history
(vim.keymap.set :c "<S-Up>" "<nop>" {:noremap true})
;; don't use Shift-↓ to move window one page down
(vim.keymap.set :i "<S-Down>" "<nop>" {:noremap true})
;; don't use Shift-↓ to recall older command from history
(vim.keymap.set :c "<S-Down>" "<nop>" {:noremap true})
