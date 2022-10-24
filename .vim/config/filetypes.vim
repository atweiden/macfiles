let g:lispft = {
    \ 'clojure': join([
    \              '*.clj',
    \              '*.cljs',
    \              '*.edn',
    \              '*.cljx',
    \              '*.cljc',
    \              'build.boot',
    \              'profile.boot'
    \            ], ','),
    \ 'fennel': '*.fnl',
    \ 'janet': join([
    \              '*.janet',
    \              '*.jdn',
    \            ], ','),
    \ 'kiwi': '*.kiwi',
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

" facilitate lazy loading
augroup lazylanguages
  autocmd!
  autocmd User LoadElixir ++once packadd vim-elixir
  autocmd User LoadFennel ++once packadd vim-fennel
  autocmd User LoadFinn ++once packadd vim-finn
  autocmd User LoadFsharp ++once packadd vim-fsharp
  autocmd User LoadGo ++once packadd vim-go
  autocmd User LoadJanet ++once packadd janet.vim
  autocmd User LoadJournal ++once packadd vim-journal
  autocmd User LoadKiwi ++once packadd vim-kiwi
  autocmd User LoadConjure ++once packadd conjure
  autocmd User LoadSexp ++once packadd vim-sexp
  autocmd User LoadRaku ++once packadd vim-raku
  autocmd User LoadRust ++once packadd rust.vim
  autocmd User LoadToml ++once packadd vim-toml
  autocmd User LoadZig ++once packadd zig.vim
augroup END

augroup languages
  autocmd!

  " elixir
  execute printf('autocmd BufReadPre,FileReadPre %s silent doautocmd User LoadElixir',
      \ join([
      \   '*.ex',
      \   '*.exs',
      \   'mix.lock',
      \   '*.eex',
      \   '*.heex',
      \   '*.leex',
      \   '*.sface',
      \   '*.lexs'
      \ ], ','))
  autocmd FileType elixir silent doautocmd User LoadElixir
  autocmd FileType eelixir silent doautocmd User LoadElixir

  " enc
  autocmd BufNewFile,BufRead *.enc setlocal filetype=enc

  " fennel
  execute printf('autocmd BufReadPre,FileReadPre %s silent doautocmd User LoadFennel',
      \ join([g:lispft['fennel'], g:lispft['kiwi']], ','))
  autocmd FileType fennel silent doautocmd User LoadFennel

  " finn
  autocmd BufReadPre,FileReadPre *.finn silent doautocmd User LoadFinn
  autocmd FileType finn silent doautocmd User LoadFinn

  " fsharp
  execute printf('autocmd BufReadPre,FileReadPre %s silent doautocmd User LoadFsharp',
      \ join([
      \   '*.fs',
      \   '*.fsx',
      \   '*.fsi'
      \ ], ','))
  autocmd FileType fsharp silent doautocmd User LoadFsharp

  " git
  autocmd BufReadPre,FileReadPre COMMIT_EDITMSG let b:noreturntopos = 1

  " go
  execute printf('autocmd BufReadPre,FileReadPre %s silent doautocmd User LoadGo',
      \ join([
      \   '*.go',
      \   '*.s',
      \   '*.tmpl',
      \   '*.mod'
      \ ], ','))
  autocmd FileType asm silent doautocmd User LoadGo
  autocmd FileType go silent doautocmd User LoadGo
  autocmd FileType gohtmltmpl silent doautocmd User LoadGo
  autocmd FileType gomod silent doautocmd User LoadGo

  " gpg
  autocmd QuitPre *.gpg silent! call system('pkill gpg-agent')

  " hugo
  autocmd BufNewFile,BufRead **/layouts/**.html setlocal filetype=gohtmltmpl

  " janet
  execute printf('autocmd BufReadPre,FileReadPre %s silent doautocmd User LoadJanet',
      \ g:lispft['janet'])
  autocmd FileType janet silent doautocmd User LoadJanet

  " journal
  autocmd FileType journal silent doautocmd User LoadJournal

  " kiwi
  execute printf('autocmd BufReadPre,FileReadPre %s silent doautocmd User LoadKiwi',
      \ g:lispft['kiwi'])
  autocmd FileType kiwi silent doautocmd User LoadKiwi

  " lisp
  execute printf('autocmd BufReadPre,FileReadPre %s silent doautocmd User LoadSexp',
      \ join(values(g:lispft), ','))
  if $NVIM
    execute printf('autocmd BufReadPre,FileReadPre %s silent doautocmd User LoadConjure',
        \ join([
        \   g:lispft['fennel'],
        \   g:lispft['janet']
        \ ], ','))
  endif

  " raku
  execute printf('autocmd BufReadPre,FileReadPre %s silent doautocmd User LoadRaku',
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
  autocmd FileType raku silent doautocmd User LoadRaku

  " rust
  autocmd BufReadPre,FileReadPre *.rs silent doautocmd User LoadRust
  autocmd FileType rust silent doautocmd User LoadRust

  " toml
  execute printf('autocmd BufReadPre,FileReadPre %s silent doautocmd User LoadToml',
      \ join([
      \   '*.toml',
      \   'pdm.lock',
      \   'Gopkg.lock',
      \   'Cargo.lock'
      \ ], ','))
  autocmd FileType toml silent doautocmd User LoadToml

  " txn
  autocmd BufNewFile,BufRead *.txn setlocal filetype=txn

  " xbps
  autocmd BufReadCmd *.xbps call tar#Browse(expand("<amatch>"))

  " zig
  autocmd BufReadPre,FileReadPre *.zig,*.zir silent doautocmd User LoadZig
  autocmd FileType zig silent doautocmd User LoadZig
  autocmd FileType zir silent doautocmd User LoadZig
augroup END

" vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
