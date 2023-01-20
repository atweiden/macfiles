vim9script

# "Focus" the current line. Basically:
#
# 1. Close all folds.
# 2. Open just the folds containing the current line.
# 3. Move the line to a little bit (15 lines) above the center of the screen.
#
# Credit: https://bitbucket.org/sjl/dotfiles
export def FocusLine(): void
  var save_pos = getpos('.')
  execute ":silent! normal zM"
  execute ":silent! normal zv"
  execute ":silent! normal zz"
  execute "normal! 15\<C-E>"
  setpos('.', save_pos)
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
