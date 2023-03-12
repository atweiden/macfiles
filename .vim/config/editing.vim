vim9script

# always keep cursor in the same column if possible
set nostartofline

# enable virtual edit in visual block mode
set virtualedit=block

# use a dialog when an operation has to be confirmed
set confirm

# don't show us the command we're typing
set noshowcmd

# always report the number of lines changed
set report=0

# turn on wildmenu completion
set wildmenu
set wildmode=list:longest,full

# don't wildmatch the following for completion efficiency
set wildignore=

# don't wildmatch archives
set wildignore+=*.7z
set wildignore+=*.bz2
set wildignore+=*.bzip
set wildignore+=*.bzip2
set wildignore+=*.cab
set wildignore+=*.deb
set wildignore+=*.dmg
set wildignore+=*.gz
set wildignore+=*.gzip
set wildignore+=*.iso
set wildignore+=*.lzma
set wildignore+=*.msi
set wildignore+=*.msix
set wildignore+=*.msm
set wildignore+=*.msp
set wildignore+=*.rar
set wildignore+=*.rpm
set wildignore+=*.tar
set wildignore+=*.tgz
set wildignore+=*.txz
set wildignore+=*.xar
set wildignore+=*.xpi
set wildignore+=*.xz
set wildignore+=*.zip

# don't wildmatch media files
set wildignore+=*.3dm
set wildignore+=*.apng
set wildignore+=*.bmp
set wildignore+=*.dib
set wildignore+=*.gif
set wildignore+=*.hdp
set wildignore+=*.ico
set wildignore+=*.j2k
set wildignore+=*.jfi
set wildignore+=*.jfif
set wildignore+=*.jif
set wildignore+=*.jp2
set wildignore+=*.jpe
set wildignore+=*.jpeg
set wildignore+=*.jpf
set wildignore+=*.jpg
set wildignore+=*.jpm
set wildignore+=*.jpx
set wildignore+=*.jxr
set wildignore+=*.max
set wildignore+=*.mj2
set wildignore+=*.mng
set wildignore+=*.pdf
set wildignore+=*.png
set wildignore+=*.raw
set wildignore+=*.svgz
set wildignore+=*.tif
set wildignore+=*.tiff
set wildignore+=*.wdp
set wildignore+=*.webp
set wildignore+=*.xbm

# don't wildmatch compilation artefacts
set wildignore+=*.dSYM/
set wildignore+=*.a
set wildignore+=*.app
set wildignore+=*.def
set wildignore+=*.dll
set wildignore+=*.dylib
set wildignore+=*.elf
set wildignore+=*.exe
set wildignore+=*.exp
set wildignore+=*.gch
set wildignore+=*.hex
set wildignore+=*.i*86
set wildignore+=*.idb
set wildignore+=*.ilk
set wildignore+=*.ko
set wildignore+=*.la
set wildignore+=*.lai
set wildignore+=*.lib
set wildignore+=*.lo
set wildignore+=*.map
set wildignore+=*.o
set wildignore+=*.obj
set wildignore+=*.os
set wildignore+=*.out
set wildignore+=*.pch
set wildignore+=*.pdb
set wildignore+=*.slo
set wildignore+=*.so
set wildignore+=*.so.*
set wildignore+=*.su
set wildignore+=*.x86_64

# don't wildmatch operating system specific files
set wildignore+=*~
set wildignore+=.AppleDouble
set wildignore+=.DS_Store
set wildignore+=.LSOverride
set wildignore+=.DocumentRevisions-V100
set wildignore+=.PKInstallSandboxManager
set wildignore+=.PKInstallSandboxManager-SystemSoftware
set wildignore+=.Spotlight-V100
set wildignore+=.TemporaryItems
set wildignore+=.Trashes
set wildignore+=.VolumeIcon.icns
set wildignore+=.com.apple.timemachine.donotpresent
set wildignore+=.com.apple.timemachine.supported
set wildignore+=.fseventsd
set wildignore+=.hotfiles.btree
set wildignore+=.quota.group
set wildignore+=.quota.user
set wildignore+=.quota.ops.group
set wildignore+=.quota.ops.user
set wildignore+=._*
set wildignore+=\$RECYCLE.BIN/
set wildignore+=Thumbs.db
set wildignore+=Thumbs.db:encryptable
set wildignore+=[Dd]esktop.ini
set wildignore+=ehthumbs.db
set wildignore+=ehthumbs_vista.db
set wildignore+=*.stackdump
set wildignore+=*.lnk

# don't wildmatch software specific files
set wildignore+=.~lock.*#
set wildignore+=.netrwhist
set wildignore+=[._]*.s[a-v][a-z]
set wildignore+=[._]*.sw[a-p]
set wildignore+=[._]s[a-rt-v][a-z]
set wildignore+=[._]ss[a-gi-z]
set wildignore+=[._]sw[a-p]
set wildignore+=[._]*.un~
set wildignore+=.git/
set wildignore+=.hg/
set wildignore+=.subgit/
set wildignore+=.subhg/
set wildignore+=.svn/
set wildignore+=.bzr/
set wildignore+=CVS/
set wildignore+=.peru/
set wildignore+=.xmake/
set wildignore+=.ci/
set wildignore+=.circleci/
set wildignore+=.devcontainer/
set wildignore+=.github/

# don't wildmatch programming language specific files
set wildignore+=*.ali
set wildignore+=.cpcache/
set wildignore+=.lein-plugins/
set wildignore+=.mvn/
set wildignore+=dependency-reduced-pom.xml
set wildignore+=hs_err_pid*
set wildignore+=pom.xml
set wildignore+=pom.xml.asc
set wildignore+=pom.xml.next
set wildignore+=pom.xml.releaseBackup
set wildignore+=pom.xml.tag
set wildignore+=pom.xml.versionsBackup
set wildignore+=.lein-deps-sum
set wildignore+=.lein-repl-history
set wildignore+=.lein-failures
set wildignore+=.nrepl-port
set wildignore+=*.class
set wildignore+=*.ear
set wildignore+=*.jar
set wildignore+=*.nar
set wildignore+=*.war
set wildignore+=ebin/
set wildignore+=_build/
set wildignore+=_checkouts/
set wildignore+=.rebar3/
set wildignore+=erl_crash.dump
set wildignore+=*.ez
set wildignore+=*.beam
set wildignore+=*.plt
set wildignore+=*.test
set wildignore+=paket.lock
set wildignore+=go.sum
set wildignore+=lua_modules/
set wildignore+=nimcache/
set wildignore+=nimblecache/
set wildignore+=bower_components/
set wildignore+=jspm_packages/
set wildignore+=lib-cov/
set wildignore+=node_modules/
set wildignore+=web_modules/
set wildignore+=.cache/
set wildignore+=.grunt/
set wildignore+=.npm/
set wildignore+=.parcel-cache/
set wildignore+=.pnp/
set wildignore+=.yarn/
set wildignore+=report.[0-9]*.[0-9]*.[0-9]*.[0-9]*.json
set wildignore+=.env
set wildignore+=.env.development
set wildignore+=.env.development.local
set wildignore+=.env.local
set wildignore+=.env.production
set wildignore+=.env.production.local
set wildignore+=.env.test
set wildignore+=.env.test.local
set wildignore+=.eslintcache
set wildignore+=.node_repl_history
set wildignore+=.pnp.*
set wildignore+=.yarn-integrity
set wildignore+=*.lcov
set wildignore+=*.pid
set wildignore+=*.pid.lock
set wildignore+=*.tsbuildinfo
set wildignore+=_coverage/
set wildignore+=_esy/
set wildignore+=_opam/
set wildignore+=esy.lock.json
set wildignore+=.bsb.lock
set wildignore+=.esy.lock
set wildignore+=.merlin
set wildignore+=*.annot
set wildignore+=*.byte
set wildignore+=*.cma
set wildignore+=*.cmi
set wildignore+=*.cmo
set wildignore+=*.cmx
set wildignore+=*.cmxa
set wildignore+=*.cmxs
set wildignore+=*.native
set wildignore+=*.egg
set wildignore+=.precomp/
set wildignore+=*.gem
set wildignore+=Cargo.lock
set wildignore+=zig-cache/
set wildignore+=zig-out/

# wildmatch the following with decreased priority
set suffixes=
set suffixes+=.h
set suffixes+=appveyor\.yml
set suffixes+=bsconfig\.json
set suffixes+=crowdin\.yaml
set suffixes+=jbuild-ignore
set suffixes+=package-lock\.json
set suffixes+=tsconfig\.json
set suffixes+=tslint\.json
set suffixes+=webpack\.config\.ts
set suffixes+=.appveyor\.yml
set suffixes+=.bat
set suffixes+=.circle\.yml
set suffixes+=.clang-format
set suffixes+=.codeclimate\.yml
set suffixes+=.coveragerc
set suffixes+=.cpplint
set suffixes+=.dir-locals\.el
set suffixes+=.dockerignore
set suffixes+=.editorconfig
set suffixes+=.eslintignore
set suffixes+=.eslintrc
set suffixes+=.eslintrc\.js
set suffixes+=.eslintrc\.json
set suffixes+=.eslintrc\.yml
set suffixes+=.flake8
set suffixes+=.gdbinit
set suffixes+=.git-blame-ignore-revs
set suffixes+=.jrubyrc
set suffixes+=.jshintignore
set suffixes+=.jshintrc
set suffixes+=.licensed\.yml
set suffixes+=.lock
set suffixes+=.mailmap
set suffixes+=.npmignore
set suffixes+=.npmrc
set suffixes+=.nvmrc
set suffixes+=.prettierignore
set suffixes+=.prettierrc
set suffixes+=.properties
set suffixes+=.rspec
set suffixes+=.rspec_parallel
set suffixes+=.rubocop\.yml
set suffixes+=.shellcheckrc
set suffixes+=.travis\.yml
set suffixes+=.yardopts
set suffixes+=.yarnrc
set suffixes+=.gitattributes
set suffixes+=.gitignore
set suffixes+=.gitmodules
set suffixes+=.hgignore
set suffixes+=.hgsigs
set suffixes+=.hgsub
set suffixes+=.hgsubstate
set suffixes+=.hgtags
set suffixes+=.bzrignore
set suffixes+=.cvsignore
set suffixes+=.diff
set suffixes+=.patch
set suffixes+=.log
set suffixes+=.log\.*
set suffixes+=tags
set suffixes+=.asc
set suffixes+=.sig
set suffixes+=.bak
set suffixes+=.gho
set suffixes+=.ori
set suffixes+=.orig
set suffixes+=.rej
set suffixes+=.tmp

# case sensitive file completion
set nofileignorecase

# use histogram diff algorithm, indent heuristic for internal diff library
set diffopt+=algorithm:histogram
set diffopt+=indent-heuristic

# open vimdiff split vertically
set diffopt+=vertical

# don't fold unchanged lines in vimdiffs
set diffopt+=context:1000000

# disable diff mode for hidden buffers
set diffopt+=hiddenoff

# split windows below and to the right of the current
set splitright
set splitbelow

# generous backspacing
set backspace=2

# break lines at sensible place
set linebreak

# wrap on these chars
set whichwrap+=<,>,[,]

# wrap lines by default
set wrap

# prevent two spaces after punctuation on a line join
set nojoinspaces

# copy indent from current line when starting a new line
set autoindent

# sets the width of a <Tab> character
set tabstop=2

# when enabled, causes spaces to be used instead of <Tab> characters
set expandtab

# when enabled, sets the amount of whitespace to be inserted/removed on
# <Tab> / <BS>
#
# if softtabstop < tabstop, and expandtab is disabled (with noexpandtab),
# vim will start <Tab>s with whitespace
#
# this initial whitespace will be dynamically converted to / from <Tab>
# characters as the indent level of 'tabstop' is reached / unreached
set softtabstop=2

# sets the amount of space to insert / remove while using indentation
# commands in normal mode (>, <)
set shiftwidth=2

# round indent to multiple of shiftwidth
set shiftround

# <Tab> in front of a line inserts blanks according to shiftwidth
set smarttab

# triple matching curly braces form a fold
set foldmethod=marker

# higher numbers close fewer folds, 0 closes all folds
set foldlevel=1

# automatically open folds on these commands
set foldopen=insert,mark,percent,search,tag,undo

# when foldmethod is indent or syntax, don't fold more than N levels deep
set foldnestmax=3

# don't autowrap text as it's being inserted
set textwidth=0

# don't wrap searches around end of file
set nowrapscan

# ignore case in search patterns
set ignorecase

# override ignorecase option if search pattern contains upper case chars
set smartcase

# adjust case of match depending on typed text
set infercase

# match angle bracket pairs
set matchpairs+=<:>

# maintain concealed chars on cursor line in normal, insert, visual mode
set concealcursor=niv

# set timeout value for mappings to 1s, keycodes to 1/20th of a second
set timeout
set nottimeout
set timeoutlen=1000
set ttimeoutlen=50

# don't allow langmap to potentially break mappings
set langnoremap

# automatic formatting options
augroup fmtopts
  autocmd!
  autocmd FileType,Syntax * set formatoptions=rqn2l1j
  #                                           |||||||
  #                                           ||||||+----- Remove comment leader when joining two comments
  #                                           |||||+------ Don't break line after one-letter word
  #                                           ||||+------- Don't break long lines in insert mode
  #                                           |||+-------- Use indent of second line of paragraph for rest of paragraph, not first
  #                                           ||+--------- Recognize numbered lists when formatting text
  #                                           |+---------- Allow formatting of comments with gq
  #                                           +----------- Automatically insert current comment leader after <Enter> in insert mode
augroup END

# use rg/ag/ack for grepping if available
if executable('rg')
  set grepprg=rg
  set grepprg+=\ --vimgrep
  set grepprg+=\ --no-heading
  set grepprg+=\ --color\ never
  set grepprg+=\ --hidden
  set grepprg+=\ --smart-case
  set grepprg+=\ --ignore-file\ $HOME/.config/search/ignore
elseif executable('ag')
  set grepprg=ag
  set grepprg+=\ --nogroup
  set grepprg+=\ --nocolor
  set grepprg+=\ --hidden
  set grepprg+=\ --smart-case
  set grepprg+=\ --path-to-ignore\ $HOME/.config/search/ignore
elseif executable('ack')
  set grepprg=ack
  set grepprg+=\ --nogroup
  set grepprg+=\ --nocolor
  set grepprg+=\ --nopager
  set grepprg+=\ --ackrc=$HOME/.config/ack/ackrc
endif

# don't move back cursor one position upon esc
augroup cursorpos
  autocmd!
  autocmd InsertEnter * b:curcol = col('.')
  autocmd CursorMovedI * b:curcol = col('.')
  autocmd InsertLeave * if col('.') != b:curcol | cursor(0, col('.') + 1) | endif
augroup END

# return to last edit position
augroup cursormem
  autocmd!
  autocmd BufReadPost * ReturnToLastEditPosition
augroup END

# periodically check for/warn about external changes to buffer
augroup checktimestamp
  autocmd!
  autocmd BufEnter,BufWritePost,CursorHold,CursorHoldI,FocusGained <buffer>
    \ silent! checktime
augroup END

# write file and create its parent directories simultaneously
import autoload $ALDPATH .. '/mkdirp.vim'
augroup easydir
  autocmd!
  autocmd BufWritePre,FileWritePre * mkdirp.MkdirP(expand('<afile>:p:h'), v:cmdbang)
augroup END

# disable spell check
set nospell

# don't download spell files from the internet
g:spellfile_URL = '/usr/share/vim/vimfiles/spell'

# vim: set filetype=vim foldmethod=marker foldlevel=0 nowrap:
