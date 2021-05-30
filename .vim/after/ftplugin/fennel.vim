setlocal dictionary=$CFGPATH/dict/fennel.dict
setlocal iskeyword-=-

" seoul256
highlight clear fennelKiwiKeyword
highlight default link fennelKiwiKeyword rubyPredefinedIdentifier
highlight clear fennelKiwiDefKeyword
highlight default link fennelKiwiDefKeyword rubyRegexp

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
