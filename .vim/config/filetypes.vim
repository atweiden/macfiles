augroup enc
  autocmd!
  autocmd BufNewFile,BufRead *.enc setlocal filetype=enc
  autocmd BufReadPre,FileReadPre *.enc setlocal viminfo= nobackup noswapfile noundofile
augroup END

augroup gpg
  autocmd!
  autocmd QuitPre *.gpg silent! call system('pkill gpg-agent')
augroup END

augroup txn
  autocmd BufNewFile,BufRead *.txn setlocal filetype=txn
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
