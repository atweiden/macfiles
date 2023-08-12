;; Fallback background colour, in case `Normal` highlight group is cleared.
(local bg-default 0)

(fn get-bg []
  "`(get-bg)` returns background colour of `Normal` highlight group, or fallback colour."
  (let [bg (. (vim.api.nvim_get_hl 0 {:name "Normal"}) :bg)] (or bg bg-default)))

(fn highlight-clear [group]
  "`(highlight-clear group)` clears highlight group `group`, i.e. `:highlight clear group`."
  (vim.api.nvim_set_hl 0 group {}))

(fn disable-left-padding []
  (highlight-clear "FoldColumn")
  (set vim.opt.foldcolumn 0))

(fn enable-left-padding []
  (let [bg (get-bg)]
    (vim.api.nvim_set_hl 0 "FoldColumn" {:ctermfg bg
                                         :ctermbg bg
                                         :guifg bg
                                         :guibg bg}))
  (set vim.opt.foldcolumn 1))

(fn cycle-focus-win []
  "`(cycle-focus-win)` cycles through Vim window presentation styles, toggling visibility of
   statusline and linenumbers, and adjusting \"left padding\" as needed to minimise interruption
   of focus and reduce visual distraction.

   `cycle-focus-win` defines a new Vim global variable, `g:focuswinstate`, and cycles its value
   between 1-4:

   1. disable statusline, disable linenumbers (add left padding)
   2. enable statusline, disable linenumbers (add left padding)
   3. disable statusline, enable linenumbers (rm left padding)
   4. enable statusline, enable linenumbers (rm left padding)"
  (let [a-b (fn []
              (set vim.opt.laststatus 0)
              (set vim.opt.nonumber true)
              (set vim.opt.norelativenumber true)
              (enable-left-padding)
              (set vim.g.focuswinstate 2))
        b-c (fn []
              (set vim.opt.laststatus 2)
              (set vim.opt.nonumber true)
              (set vim.opt.norelativenumber true)
              (enable-left-padding)
              (set vim.g.focuswinstate 3))
        c-d (fn []
              (set vim.opt.laststatus 0)
              (set vim.opt.number true)
              (set vim.opt.relativenumber true)
              (disable-left-padding)
              (set vim.g.focuswinstate 4))
        d-a (fn []
              (set vim.opt.laststatus 2)
              (set vim.opt.number true)
              (set vim.opt.relativenumber true)
              (disable-left-padding)
              (set vim.g.focuswinstate 1))]
    (case (vim.fn.get vim.g "focuswinstate" 1)
      1 (a-b)
      2 (b-c)
      3 (c-d)
      4 (d-a))))

cycle-focus-win
