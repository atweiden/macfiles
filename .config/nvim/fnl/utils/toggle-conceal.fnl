(fn toggle-conceal []
  (if (= vim.o.conceallevel 0)
    (set vim.o.conceallevel 2)
    (set vim.o.conceallevel 0)))
