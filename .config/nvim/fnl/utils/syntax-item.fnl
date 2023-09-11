(fn syntax-item []
  (let [syntax-group (vim.fn.synIDattr (vim.fn.synID (vim.fn.line ".")
                                                     (vim.fn.col ".") 1)
                                       :name)]
    (if (not= syntax-group "") (.. "[" syntax-group "]") "")))
