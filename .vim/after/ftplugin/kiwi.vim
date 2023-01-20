vim9script

setlocal dictionary=$CFGPATH/dict/fennel.dict
setlocal iskeyword-=-

def HighlightKiwi(): void
  # seoul256
  if has('gui_running')
    highlight clear fennelKiwiKeyword
    highlight default link fennelKiwiKeyword Special
    highlight clear fennelKiwiDefKeyword
    highlight default link fennelKiwiDefKeyword Macro
  else
    highlight clear fennelKiwiKeyword
    highlight default link fennelKiwiKeyword rubyPredefinedIdentifier
    highlight clear fennelKiwiDefKeyword
    highlight default link fennelKiwiDefKeyword rubyRegexp
  endif
enddef

augroup highlightkiwi
  autocmd!
  autocmd ColorScheme * HighlightKiwi()
augroup END

HighlightKiwi()

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
