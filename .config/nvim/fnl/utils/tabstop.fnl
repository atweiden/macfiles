(local tabstop {})

(fn tabstop.summarize []
  (let [msg (.. "tabstop=" vim.bo.tabstop
                " shiftwidth=" vim.bo.shiftwidth
                " softtabstop=" vim.bo.softtabstop
                (if vim.bo.expandtab " expandtab" " noexpandtab"))
        ;; Use `pcall` to handle errors similar to try-catch in Vimscript.
        (ok? err) (pcall (fn [] (vim.api.nvim_echo [[msg "ModeMsg"]] false {})))]
    ;; Print error if there was one.
    (when (not ok?) (print err))
    ;; Reset highlight by printing empty message without highlight group.
    (vim.api.nvim_echo [[""]] false {})))

(fn tabstop.set []
  "`(set)` sets `tabstop`, `softtabstop` and `shiftwidth` to same value."
  (let [tabstop (tonumber (vim.fn.input "set tabstop = softtabstop = shiftwidth = "))]
    (when (> tabstop 0)
      (set vim.bo.softtabstop tabstop)
      (set vim.bo.tabstop tabstop)
      (set vim.bo.shiftwidth tabstop))))

tabstop
