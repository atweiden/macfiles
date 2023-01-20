vim9script

export def ReturnToLastEditPosition(): void
  # only return to last edit position if b:noreturntopos variable is unset
  if exists('b:noreturntopos')
    return
  endif
  if line("'\"") > 1 && line("'\"") <= line("$")
    execute "normal! g`\""
  endif
enddef

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
