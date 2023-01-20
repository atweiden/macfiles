vim9script

# SyntaxItem() - get syntax highlight group under cursor
#
# Credit: https://github.com/kongo2002/dotfiles
export def SyntaxItem(): string
  var syntax_group = synIDattr(synID(line("."), col("."), 1), "name")
  if syntax_group != ""
    return "[" .. syntax_group .. "]"
  else
    return ""
  endif
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
