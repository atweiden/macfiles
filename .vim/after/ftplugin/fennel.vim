setlocal dictionary=$CFGPATH/dict/fennel.dict
setlocal iskeyword-=-

" seoul256
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

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
