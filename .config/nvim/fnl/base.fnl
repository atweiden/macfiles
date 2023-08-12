;; set leader to comma
(set vim.g.mapleader ",")

;; set localleader to space
(set vim.g.maplocalleader " ")

;; map ; to :
(vim.keymap.set [:n :v] ";" ":" {:noremap true})

;; Ctrl-Q to quit
(vim.keymap.set :n "<C-Q>" ":qall<CR>" {:noremap true})
(vim.keymap.set :c "<C-Q>" "<C-C>:qall<CR>" {:noremap true})
(vim.keymap.set :i "<C-Q>" "<C-O>:qall<CR>" {:noremap true})
(vim.keymap.set [:o :v] "<C-Q>" "<ESC>:qall<CR>" {:noremap true})

;; Ctrl-Z to suspend in insert mode
(vim.keymap.set :i "<C-Z>" "<C-O>:stop<CR>" {:noremap true})

;; store backups in the same directory
(set vim.opt.backupdir (.. (vim.fn.stdpath "state") "/backups//"))

;; store swap files in the same directory
(set vim.opt.directory (.. (vim.fn.stdpath "state") "/swaps//"))

;; store undo files in the same directory
(set vim.opt.undodir (.. (vim.fn.stdpath "state") "/undo//"))

;; make directories if necessary
(each [_ target (ipairs [:backupdir :directory :undodir])]
  (let [target (. (: (. :vim :opt target) :get) 1)]
    (if (= (vim.fn.isdirectory target) 0) (vim.fn.mkdir target :p))))

;; turn on mouse in all modes
(when (vim.fn.has "mouse")
  (set vim.opt.mouse :a)
  (set vim.opt.mousemodel :popup_setpos))

;; use utf-8 without BOM
(set vim.opt.encoding :utf-8)
(set vim.opt.fileencoding :utf-8)
(set vim.opt.termencoding :utf-8)
(set vim.opt.nobomb true)

;; flush file to disk after writing for protection against data loss
(set vim.opt.nofsync true)

;; greatly restrict local .vimrc and .exrc files
(set vim.opt.secure true)

;; disable modelines, use securemodelines.vim instead
(set vim.opt.nomodeline true)

;; switching buffers
(set vim.opt.switchbuf [;; jump to first open window with specified buffer
                        :useopen
                        ;; consider windows in other tab pages wrt useopen
                        :usetab
                        ;; prefer opening quickfix windows in new tabs
                        :newtab])

;; save and restore session data
(set vim.opt.sessionoptions [;; empty windows
                             :blank
                             ;; hidden and unloaded buffers
                             :buffers
                             ;; the current directory
                             :curdir
                             ;; manually created folds, opened/closed folds, local fold options
                             :folds
                             ;; global variables that start with an uppercase letter and contain
                             ;; at least one lowercase letter
                             :globals
                             ;; the help window
                             :help
                             ;; options and mappings local to a window or buffer
                             :localoptions
                             ;; all options and mappings, global values for local options
                             :options
                             ;; size of vim window
                             :resize
                             ;; all tab pages
                             :tabpages
                             ;; position of vim window
                             :winpos
                             ;; window sizes
                             :winsize])

;; configure ShaDa then read from it
(set vim.opt.shada [;; keep marks for n files
                    "'100"
                    ;; keep n lines for each register
                    "<50"
                    ;; exclude registers greater than n kb
                    "s10"
                    ;; don't restore hlsearch on startup
                    "h"
                    ;; save and restore all-uppercase global variables
                    "!"])
(if (= (vim.fn.filereadable (.. (vim.fn.stdpath "data") "/main.shada")) 1) (vim.cmd.rshada))

;; never write or update the contents of any buffer unless we say so
(set vim.opt.noautowrite true)
(set vim.opt.noautowriteall true)
(set vim.opt.noautoread true)

;; always use unix-style line endings
(set vim.opt.fileformat "unix")

;; read unix, dos and mac file formats
(set vim.opt.fileformats [:unix :dos :mac])

;; save undo history to an undo file
(set vim.opt.undofile true)

;; allow N number of changes to be undone
(set vim.opt.undolevels 500)

;; store N previous vim commands and search patterns
(set vim.opt.history 500)

;; switch buffers without saving
(set vim.opt.hidden true)

;; write swap file every N characters
(set vim.opt.updatecount 20)

;; do not redraw screen when executing macros
(set vim.opt.lazyredraw true)

;; improve redraw performance
(set vim.opt.ttyfast true)

;; make syntax highlighting more robust post vim 8
(set vim.opt.redrawtime 10000)

;; terminal type for mouse codes
(set vim.opt.ttymouse "xterm2")

;; format lines with fmt
(set vim.opt.formatprg "fmt")
