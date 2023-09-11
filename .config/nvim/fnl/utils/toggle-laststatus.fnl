(fn toggle-laststatus []
  (if (= vim.o.laststatus 2)
    (set vim.o.laststatus 0)
    (set vim.o.laststatus 2)))
