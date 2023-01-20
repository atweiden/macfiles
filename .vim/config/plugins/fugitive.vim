vim9script

# git blame sans tpope/vim-fugitive
command! -range GitBlame echo join(systemlist("git -C " .. shellescape(expand('%:p:h')) .. " blame -L <line1>,<line2> " .. expand('%:t')), "\n")

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
