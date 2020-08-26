let g:lispft = {
    \ 'clojure': join([
    \              '*.clj',
    \              '*.cljs',
    \              '*.edn',
    \              '*.cljx',
    \              '*.cljc',
    \              '{build,profile}.boot'
    \            ], ','),
    \ 'fennel': '*.fnl',
    \ 'janet': '*.janet',
    \ 'lisp': join([
    \           '*.lisp',
    \           '*.cl',
    \           '*.fasl'
    \         ], ','),
    \ 'racket': join([
    \             '*.rkt',
    \             '*.rktl'
    \           ], ','),
    \ 'scheme': join([
    \             '*.scm',
    \             '*.ss'
    \           ], ',')
    \ }

augroup languages
  autocmd!

  " elixir
  execute printf('autocmd BufReadPre,FileReadPre %s packadd vim-elixir',
      \ join([
      \   '*.ex',
      \   '*.exs',
      \   'mix.lock',
      \   '*.eex',
      \   '*.leex'
      \ ], ','))
  autocmd FileType elixir packadd vim-elixir

  " enc
  autocmd BufNewFile,BufRead *.enc setlocal filetype=enc
  execute printf('autocmd BufReadPre,FileReadPre *.enc setlocal %s',
      \ join([
      \   'viminfo=',
      \   'nobackup',
      \   'noswapfile',
      \   'noundofile',
      \   'nowritebackup',
      \   'noshelltemp',
      \   'history=0',
      \   'cryptmethod=blowfish2'
      \ ], ' '))

  " fennel
  execute printf('autocmd BufReadPre,FileReadPre %s packadd vim-fennel',
      \ g:lispft['fennel'])
  autocmd FileType fennel packadd vim-fennel

  " finn
  autocmd BufReadPre,FileReadPre *.finn packadd vim-finn
  autocmd FileType finn packadd vim-finn

  " gpg
  autocmd QuitPre *.gpg silent! call system('pkill gpg-agent')

  " janet
  execute printf('autocmd BufReadPre,FileReadPre %s packadd janet.vim',
      \ g:lispft['janet'])
  autocmd FileType janet packadd janet.vim

  " journal
  autocmd BufReadPre,FileReadPre *.txt packadd vim-journal
  autocmd FileType journal packadd vim-journal

  " lisp
  execute printf('autocmd BufReadPre,FileReadPre %s packadd vim-sexp',
      \ join(values(g:lispft), ','))
  if has('nvim')
    execute printf('autocmd BufReadPre,FileReadPre %s packadd conjure',
        \ join([
        \   g:lispft['fennel'],
        \   g:lispft['janet']
        \ ], ','))
  endif

  " raku
  execute printf('autocmd BufReadPre,FileReadPre %s packadd vim-raku',
      \ join([
      \   '*.raku',
      \   '*.rakumod',
      \   '*.rakudoc',
      \   '*.rakutest',
      \   '*.pm6',
      \   '*.p6',
      \   '*.pl6',
      \   '*.t6',
      \   '*.t',
      \   '*.nqp'
      \ ], ','))
  autocmd FileType raku packadd vim-raku

  " toml
  execute printf('autocmd BufReadPre,FileReadPre %s packadd vim-toml',
      \ join([
      \   '*.toml',
      \   'Gopkg.lock',
      \   'Cargo.lock'
      \ ], ','))
  autocmd FileType toml packadd vim-toml

  " txn
  autocmd BufNewFile,BufRead *.txn setlocal filetype=txn

  " xbps
  autocmd BufReadCmd *.xbps call tar#Browse(expand("<amatch>"))
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
