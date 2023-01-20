vim9script

export def FileEncoding(): string
  return winwidth(0) > 70 ? (strlen(&fileencoding) > 0 ? &fileencoding : &encoding) : ''
enddef

export def FileFormat(): string
  return winwidth(0) > 70 ? &fileformat : ''
enddef

export def FileName(): string
  def Modified(): string
    try
      if &modified
        return '+'
      else
        return ''
      endif
    catch
    endtry
    return ''
  enddef

  def ReadOnly(): string
    try
      if &readonly
        return ''
      else
        return ''
      endif
    catch
    endtry
    return ''
  enddef

  return
    \ ('' != ReadOnly() ? ReadOnly() .. ' ' : '') ..
    \ (&filetype == 'ctrlsf' ? '' :
    \  &filetype == 'nerdtree' ? '' :
    \  &filetype == 'packager' ? '' :
    \  &filetype == 'undotree' ? '' :
    \  '' != expand('%:t') ? expand('%:t') : '[No Name]') ..
    \ ('' != Modified() ? ' ' .. Modified() : '')
enddef

export def FileType(): string
  return winwidth(0) > 70 ? (strlen(&filetype) > 0 ? &filetype : 'no ft') : ''
enddef

export def GitBranch(): string
  var git_branch_name = gitbranch#name()
  if strlen(git_branch_name) > 0
    return ' ' .. git_branch_name
  else
    return ''
  endif
enddef

export def Mode(): string
  return
    \ &filetype == 'ctrlsf' ? 'CtrlSF' :
    \ &filetype == 'nerdtree' ? 'NERDTree' :
    \ &filetype == 'packager' ? 'Packager' :
    \ &filetype == 'undotree' ? 'UndoTree' :
    \ winwidth(0) > 60 ? lightline#mode() : ''
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
