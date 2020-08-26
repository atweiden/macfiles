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
  autocmd BufReadPre,FileReadPre *.ex,*.exs,mix.lock,*.eex,*.leex packadd vim-elixir

  " enc
  autocmd BufNewFile,BufRead *.enc setlocal filetype=enc
  autocmd BufReadPre,FileReadPre *.enc setlocal viminfo= nobackup noswapfile noundofile

  " fennel
  execute printf('autocmd BufReadPre,FileReadPre %s packadd vim-fennel',
      \ g:lispft['fennel'])

  " finn
  autocmd BufReadPre,FileReadPre *.finn packadd vim-finn

  " gpg
  autocmd QuitPre *.gpg silent! call system('pkill gpg-agent')

  " janet
  execute printf('autocmd BufReadPre,FileReadPre %s packadd janet.vim',
      \ g:lispft['janet'])

  " journal
  autocmd BufReadPre,FileReadPre *.txt packadd vim-journal

  " lisp
  execute printf('autocmd BufReadPre,FileReadPre %s packadd vim-sexp',
      \ join(values(g:lispft), ','))
  if has('nvim')
    execute printf('autocmd BufReadPre,FileReadPre %s,%s packadd conjure',
        \ g:lispft['fennel'],
        \ g:lispft['janet'])
  endif

  " raku
  autocmd BufReadPre,FileReadPre *.raku,*.rakumod,*.rakudoc,*.rakutest,*.pm6,*.p6,*.pl6,*.t6,*.t,*.nqp packadd vim-raku

  " toml
  autocmd BufReadPre,FileReadPre *.toml,Gopkg.lock,Cargo.lock,*/.cargo/config,*/.cargo/credentials,Pipfile packadd vim-toml

  " txn
  autocmd BufNewFile,BufRead *.txn setlocal filetype=txn

  " xbps
  autocmd BufReadCmd *.xbps call tar#Browse(expand("<amatch>"))
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
