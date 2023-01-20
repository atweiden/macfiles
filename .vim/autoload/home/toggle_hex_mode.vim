vim9script

export def ToggleHexMode(): void
  setlocal binary
  setlocal noendofline
  if get(b:, 'hexmode', 0)
    :%!xxd -r
    b:hexmode = 0
  else
    :%!xxd
    b:hexmode = 1
  endif
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
