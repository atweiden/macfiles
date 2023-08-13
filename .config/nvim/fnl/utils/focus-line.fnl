(fn focus-line []
  "`(focus-line)` \"focuses\" the current line. Basically:

   1. Close all folds
   2. Open just the folds containing the current line
   3. Move the line to a little bit (15 lines) above the center of the screen

   Credit: https://bitbucket.org/sjl/dotfiles"
  (let [save-pos (vim.fn.getpos ".")]
    (vim.api.nvim_exec2 "silent! normal zM
                         silent! normal zv
                         silent! normal zz
                         normal! 15<C-E>")
    (vim.fn.setpos "." save-pos)))
