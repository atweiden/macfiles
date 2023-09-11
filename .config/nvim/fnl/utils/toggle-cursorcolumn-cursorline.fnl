(fn toggle-cursorcolumn-cursorline []
  (if (= vim.wo.cursorcolumn vim.wo.cursorline)
      (do (set vim.wo.cursorcolumn (not vim.wo.cursorcolumn))
          (set vim.wo.cursorline (not vim.wo.cursorline)))
      (do (set vim.wo.cursorcolumn false)
          (set vim.wo.cursorline false))))
