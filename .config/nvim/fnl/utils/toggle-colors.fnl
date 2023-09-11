(local constants (require :constants))

(fn toggle-colors []
  (if (= vim.g.colors_name :preto)
    (set vim.go.colorscheme constants.colorscheme)
    (set vim.go.colorscheme :preto)))
