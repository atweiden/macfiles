" Source: https://github.com/kongo2002/dotfiles/blob/master/vimrc

" SyntaxItem() - get syntax highlight group under cursor
function! SyntaxItem()
  let synGrp = synIDattr(synID(line("."), col("."), 1), "name")
  if synGrp != ""
    return "[" . synGrp . "]"
  else
    return ""
  endif
endfunction

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
