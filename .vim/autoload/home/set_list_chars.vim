vim9script

export def SetListCharsTabVisible(): void
  var tabchar = has('gui_running') ? '⎸' : '┊'
  execute printf('set listchars=tab:%s\ ', tabchar)
enddef

export def SetListCharsTabInvisible(): void
  execute printf('set listchars=tab:\ \ ')
enddef

export def SetListCharsRemaining(): void
  set listchars+=nbsp:·
  set listchars+=extends:›
  set listchars+=precedes:‹
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
