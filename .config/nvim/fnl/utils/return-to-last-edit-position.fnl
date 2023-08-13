(fn return-to-last-edit-position []
  "`(return-to-last-edit-position)` moves cursor to last edit position if:

   1. `b:noreturntopos` variable is unset or `false`
   2. Last edit position isn't on line 1"
  (and (vim.fn.get vim.b :noreturntopos false)
       (let [line (vim.fn.line "'\"")]
         (and (> line 1) (<= line (vim.fn.line "$"))))
       (vim.cmd "normal! g`\"")))
