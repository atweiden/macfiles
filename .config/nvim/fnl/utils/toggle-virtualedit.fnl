(fn toggle-virtualedit []
  (if (= vim.o.virtualedit "block")
    (set vim.o.virtualedit "all")
    (set vim.o.virtualedit "block"))
  (vim.api.nvim_echo [[(.. "  virtualedit=" vim.o.virtualedit)]] true {}))
