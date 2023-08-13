(local set-list-chars {})

(fn set-list-chars.tab-visible []
  (let [tabchar (if (= (vim.fn.has :gui_running) 1) "⎸" "┊")]
    (set vim.opt.listchars.tab (.. tabchar " "))))

(fn set-list-chars.tab-invisible []
  (set vim.opt.listchars.tab "  "))

(fn set-list-chars.remaining []
  (set vim.opt.listchars.nbsp "·")
  (set vim.opt.listchars.extends "›")
  (set vim.opt.listchars.precedes "‹"))

set-list-chars
