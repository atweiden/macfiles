(fn toggle-hex-mode []
  (set vim.opt_local.binary true)
  (set vim.opt_local.endofline false)
  (when (= vim.b.hexmode nil) (set vim.b.hexmode 0))
  (if (= vim.b.hexmode 1)
    (do (vim.cmd "%!xxd -r") (set vim.b.hexmode 0))
    (do (vim.cmd "%!xxd") (set vim.b.hexmode 1))))
