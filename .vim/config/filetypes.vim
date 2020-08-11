autocmd BufNewFile,BufRead {*.enc} set filetype=enc
autocmd BufNewFile,BufRead {*.txn} set filetype=txn

augroup enc
  autocmd!
  autocmd BufReadPre,FileReadPre *.enc set viminfo=
  autocmd BufReadPre,FileReadPre *.enc set noswapfile noundofile nobackup
augroup END

augroup gpg
  autocmd!
  autocmd QuitPre *.gpg silent! call system('pkill gpg-agent')
augroup END

augroup xbps
  autocmd!
  autocmd BufReadCmd *.xbps call tar#Browse(expand("<amatch>"))
augroup END

let g:lispft = [
    \ 'clojure',
    \ 'fennel',
    \ 'janet',
    \ 'lisp',
    \ 'racket',
    \ 'scheme'
    \ ]

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
