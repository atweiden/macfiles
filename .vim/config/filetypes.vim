let g:lispft = {
    \ 'clojure': '*.clj,*.cljs,*.edn,*.cljx,*.cljc,{build,profile}.boot',
    \ 'fennel': '*.fnl',
    \ 'janet': '*.janet',
    \ 'lisp': '*.lisp,*.cl,*.fasl',
    \ 'racket': '*.rkt,*.rktl',
    \ 'scheme': '*.scm,*.ss'
    \ }

augroup languages
  autocmd!

  " elixir
  autocmd BufNewFile,BufRead *.ex,*.exs,mix.lock,*.eex,*.leex packadd vim-elixir

  " enc
  autocmd BufNewFile,BufRead *.enc setlocal filetype=enc
  autocmd BufReadPre,FileReadPre *.enc setlocal viminfo= nobackup noswapfile noundofile

  " fennel
  execute printf('autocmd BufNewFile,BufRead %s packadd vim-fennel',
      \ g:lispft['fennel'])

  " finn
  autocmd BufNewFile,BufRead *.finn packadd vim-finn

  " gpg
  autocmd QuitPre *.gpg silent! call system('pkill gpg-agent')

  " janet
  execute printf('autocmd BufNewFile,BufRead %s packadd janet.vim',
      \ g:lispft['janet'])

  " journal
  autocmd BufNewFile,BufRead *.txt packadd vim-journal

  " lisp
  execute printf('autocmd BufNewFile,BufRead %s packadd vim-sexp',
      \ join(values(g:lispft), ','))
  if has('nvim')
    execute printf('autocmd BufNewFile,BufRead %s,%s packadd conjure',
        \ g:lispft['fennel'],
        \ g:lispft['janet'])
  endif

  " txn
  autocmd BufNewFile,BufRead *.txn setlocal filetype=txn

  " xbps
  autocmd BufReadCmd *.xbps call tar#Browse(expand("<amatch>"))
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
