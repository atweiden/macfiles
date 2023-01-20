vim9script

# convert array of strings to comment block with N number of whitespaces
# prepended to each line
#
# Credit: https://github.com/johannesthyssen/vim-signit
export def StringsToCommentBlock(strings: list<string>, n: number): string
  return join(map(copy(strings), (_, v) => printf(&l:commentstring, repeat(' ', n) .. v)), "\n")
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
