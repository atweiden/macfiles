# ==============================================================================
# base {{{

# if not running interactively, don't do anything
[[ $- != *i* ]] \
  && return

# system defaults
[[ -f "/etc/bashrc" ]] \
  && source /etc/bashrc

# end base }}}
# ==============================================================================
# bash settings {{{

# --- editor {{{

set -o vi
export EDITOR='vim'
export FCEDIT='vim'
export VISUAL='vim'
export SUDO_EDITOR='rvim'

# --- end editor }}}
# --- history {{{

export HISTCONTROL='ignoreboth'
export HISTIGNORE='l:ls:cd:exit'
export HISTSIZE=
export HISTFILESIZE=

# --- end history }}}
# --- less {{{

export LESS='-RSX'

# --- end less }}}
# --- locale {{{

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# --- end locale }}}
# --- man pages {{{

export MANPAGER="less $LESS"

# --- end man pages }}}
# --- opener {{{

export OPENER='open'

# --- end opener }}}
# --- safety {{{

# do not overwrite existing file by redirect `>`
# use `>|` to override this setting
set -o noclobber

# --- end safety }}}
# --- shopt {{{

# check the window size after each command and, if necessary, update
# the values of LINES and COLUMNS
shopt -s checkwinsize

# save multi-line commands in history as single line
shopt -s cmdhist

# append to the history file, don't overwrite it
shopt -s histappend

# add failed commands to the bash history
shopt -s histreedit

# edit a recalled history line before executing
shopt -s histverify

# don't attempt completion if cmdline empty
shopt -s no_empty_cmd_completion

# --- end shopt }}}
# --- tmpdir {{{

[[ -z "$TMPDIR" ]] \
  && export TMPDIR='/tmp'

# --- end tmpdir }}}
# --- xdg {{{

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# --- end xdg }}}

# end bash settings }}}
# ==============================================================================
# terminal settings {{{

# --- terminfo {{{

export TERMINFO='/usr/local/Cellar/ncurses/6.1/share/terminfo'

# --- end terminfo }}}
# --- display {{{

if [[ "x$DISPLAY" != 'x' ]]; then
  export HAS_256_COLORS='yes'
  alias tmux='tmux -2'
  if [[ "$TERM" == 'xterm' ]]; then
    export TERM='xterm-256color'
  fi
else
  if [[ "$TERM" == 'xterm' || "$TERM" =~ '256color' ]]; then
    export HAS_256_COLORS='yes'
    alias tmux='tmux -2'
  fi
fi
if [[ "$TERM" == 'screen' && "$HAS_256_COLORS" == 'yes' ]]; then
  export TERM='screen-256color'
elif [[ "$TERM" == 'tmux' && "$HAS_256_COLORS" == 'yes' ]]; then
  export TERM='tmux-256color'
fi

# --- end display }}}
# --- remove ctrl-s ctrl-q {{{

# remove the ^S ^Q mappings. See all mappings: stty -a
stty -ixoff -ixon
stty stop undef
stty start undef

# --- end remove ctrl-s ctrl-q }}}

# end terminal settings }}}
# ==============================================================================
# path {{{

unset PATH MANPATH

# --- defaults {{{

PATH='/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin'

# --- end defaults }}}
# --- dotfiles {{{

PATH="$HOME/.bin:$PATH"

# --- end dotfiles }}}
# --- curl {{{

PATH="/usr/local/opt/curl/bin:$PATH"

# --- end curl }}}
# --- gettext {{{

PATH="/usr/local/opt/gettext/bin:$PATH"

# --- end gettext }}}
# --- gnu {{{

# use GNU tools on OSX instead of BSD
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/make/libexec/gnuman:$MANPATH"

# --- end gnu }}}
# --- icu4c {{{

PATH="/usr/local/opt/icu4c/bin:$PATH"
PATH="/usr/local/opt/icu4c/sbin:$PATH"

# --- end icu4c }}}
# --- llvm {{{

PATH="/usr/local/opt/llvm/bin:$PATH"

# --- end llvm }}}
# --- ncurses {{{

PATH="/usr/local/opt/ncurses/bin:$PATH"

# --- end ncurses }}}
# --- openssl {{{

PATH="/usr/local/opt/openssl/bin:$PATH"

# --- end openssl }}}
# --- pod2man {{{

PATH="/usr/local/opt/pod2man/bin:$PATH"

# --- end pod2man }}}
# --- perl6 {{{

PATH="$HOME/.perl6/bin:$PATH"
PATH="/usr/local/opt/rakudo/share/perl6/site/bin:$PATH"
PATH="/usr/local/opt/rakudo/share/perl6/vendor/bin:$PATH"

# --- end perl6 }}}
# --- sqlite {{{

PATH="/usr/local/opt/sqlite3/bin:$PATH"

# --- end sqlite }}}
# --- unzip {{{

PATH="/usr/local/opt/unzip/bin:$PATH"

# --- end unzip }}}

export PATH MANPATH

# end path }}}
# ==============================================================================
# presence {{{

_has_ack="$(command -v ack)"
_has_ag="$(command -v ag)"
_has_colordiff="$(command -v colordiff)"
_has_curl="$(command -v curl)"
_has_erl="$(command -v erl)"
_has_gdb="$(command -v gdb)"
_has_glibtool="$(command -v glibtool)"
_has_gtime="$(command -v gtime)"
_has_gunits="$(command -v gunits)"
_has_gwhich="$(command -v gwhich)"
_has_icdiff="$(command -v icdiff)"
_has_iex="$(command -v iex)"
_has_irssi="$(command -v irssi)"
_has_locate="$(command -v glocate)"
_has_mosh="$(command -v mosh)"
_has_mvim="$(command -v mvim)"
_has_ncdu="$(command -v ncdu)"
_has_nvim="$(command -v nvim)"
_has_perl6="$(command -v perl6)"
_has_pt="$(command -v pt)"
_has_rclone="$(command -v rclone)"
_has_rg="$(command -v rg)"
_has_rlwrap="$(command -v rlwrap)"
_has_sqlite3="$(command -v sqlite3)"
_has_subgit="$(command -v subgit)"
_has_subhg="$(command -v subhg)"
_has_tree="$(command -v tree)"
_has_vim="$(command -v vim)"
_has_wget="$(command -v wget)"

# end presence }}}
# ==============================================================================
# prompt {{{

# --- history {{{

export PROMPT_COMMAND='history -a; history -c; history -r'

# --- end history }}}
# --- ps1 {{{

unset PS1
PS1+="\[\e[01;31m\]"
PS1+="┌─[\[\e[01;35m\u\e[01;31m\]]"
PS1+="──[\[\e[00;37m\]${HOSTNAME%%.*}\[\e[01;32m\]]:\w$\[\e[01;31m\]\n\[\e[01;31m\]"
PS1+="└──\[\e[01;36m\]>>\[\e[0m\]"
export PS1

# --- end ps1 }}}

# end prompt }}}
# ==============================================================================
# aliases {{{

# --- curl {{{

[[ -n "$_has_curl" ]] \
  && alias curl='curl --config $HOME/.config/curl/curlrc'

# --- end curl }}}
# --- dbs {{{

[[ -n "$_has_sqlite3" ]] \
  && alias sqlite3='sqlite3 -init $HOME/.config/sqlite3/sqliterc'
[[ -n "$_has_sqlite3" ]] \
  && alias sql='sqlite3 -interactive :memory:'

# --- end dbs }}}
# --- diff {{{

if [[ -n "$_has_icdiff" ]]; then
  alias diff='icdiff'
elif [[ -n "$_has_colordiff" ]]; then
  alias diff='colordiff'
fi

# --- end diff }}}
# --- directory navigation {{{

alias ls='LC_COLLATE=C gls \
  --color=auto \
  --group-directories-first \
  --time-style=long-iso'
alias l='ls -1F'
alias l1='ls -1AF'
alias la='ls -aF'
alias ll='ls -laihF'
[[ -n "$_has_tree" ]] \
  && alias tree='tree -C --charset utf-8 --dirsfirst'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias cdd='cd $HOME/Downloads'
alias cdg='cd $(git rev-parse --show-cdup)'
alias cdp='cd $HOME/Projects'
alias cds='cd $HOME/.src'
alias :o='open "${1:-.}"'
alias :q='exit'

# --- end directory navigation }}}
# --- disk space {{{

alias df='df -h'
alias du='du -h -d 1'
alias dusort='du -x -m | sort -nr'
[[ -n "$_has_ncdu" ]] \
  && alias ncdu='ncdu \
    --color dark \
    -rr \
    -x \
    --si \
    --confirm-quit \
    --exclude-from $HOME/.ignore'

# --- end disk space }}}
# --- file compression {{{

alias zip='zip -9'
alias gzip='gzip -9'
alias bzip2='bzip2 -9'

# --- end file compression }}}
# --- gdb {{{

[[ -n "$_has_gdb" ]] \
  && alias gdb='gdb -q -nh -x $HOME/.config/gdb/init'

# --- end gdb }}}
# --- gnu {{{

[[ -n "$_has_glibtool" ]] \
  && alias libtool='glibtool'
[[ -n "$_has_gtime" ]] \
  && alias time='gtime'
[[ -n "$_has_gunits" ]] \
  && alias units='gunits'
[[ -n "$_has_gwhich" ]] \
  && alias which='gwhich'

# --- end gnu }}}
# --- grepping {{{

alias grep='grep --ignore-case --color=auto'
alias fgrep='fgrep --ignore-case --color=auto'
alias egrep='egrep --ignore-case --color=auto'
alias history\?='history | grep -v -E "grep|h\?" | grep "$@"'
alias ls\?='ls -1F | grep "$@"'
alias ps\?='ps -a -x -f | grep -v grep | grep "$@"'
alias pkg\?='brew list -1 | grep -v grep | grep "$@"'
[[ -n "$_has_ack" ]] \
  && alias ack='ack --ackrc=$HOME/.config/ack/ackrc'
[[ -n "$_has_ag" ]] \
  && alias ag='ag --hidden --smart-case --skip-vcs-ignores'
[[ -n "$_has_rg" ]] \
  && alias rg='rg --hidden --smart-case'
[[ -n "$_has_locate" ]] \
  && alias locate='glocate --ignore-case'

# --- end grepping }}}
# --- ip {{{

readonly INTERFACE="en0"
alias macaddr="ifconfig $INTERFACE ether | tail -n 1 | awk '{print \$2}'"
alias localip="ipconfig getifaddr $INTERFACE"
alias publicip='drill -V 3 myip.opendns.com @resolver1.opendns.com \
  | grep IN \
  | tail -n 1 \
  | cut -f5 -s'

# --- end ip }}}
# --- irssi {{{

[[ -n "$_has_irssi" ]] \
  && alias irssi='irssi \
    --config=$HOME/.config/irssi/config \
    --home=$HOME/.config/irssi'

# --- end irssi }}}
# --- languages {{{

# --- --- beam {{{

[[ -n "$_has_erl" && -n "$_has_rlwrap" ]] \
  && alias erl='rlwrap --always-readline --ansi-colour-aware erl'
[[ -n "$_has_iex" && -n "$_has_rlwrap" ]] \
  && alias iex='rlwrap --always-readline --ansi-colour-aware iex'

# --- --- end beam }}}
# --- --- perl6 {{{

[[ -n "$_has_perl6" ]] \
  && alias p6='perl6'
[[ -n "$_has_perl6" ]] \
  && alias prove6='prove -r -e perl6'
[[ -n "$_has_perl6" && -n "$_has_rlwrap" ]] \
  && alias rp='rlwrap perl6'

# --- --- end perl6 }}}

# --- end languages }}}
# --- path {{{

alias path='echo -e ${PATH//:/\\n}'

# --- end path }}}
# --- subrepo {{{

[[ -n "$_has_subgit" ]] \
  && alias sg='subgit'
[[ -n "$_has_subhg" ]] \
  && alias shg='subhg'

# --- end subrepo }}}
# --- safety {{{

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# --- end safety }}}
# --- osx {{{

alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; \
  sudo rm -rfv $HOME/.Trash; \
  sudo rm -rfv /private/var/log/asl/*.asl; \
  sqlite3 $HOME/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* \
    "delete from LSQuarantineEvent"'

# --- end osx }}}
# --- rclone {{{

[[ -n "$_has_rclone" ]] \
  && alias rclone='rclone \
    --transfers=16 \
    --checkers=32 \
    --ignore-size \
    --low-level-retries=7 \
    --retries=25 \
    --delete-after'

# --- end rclone }}}
# --- ssh {{{

[[ -n "$_has_mosh" ]] \
  && alias mosh='mosh -a'

# --- end ssh }}}
# --- stopwatch {{{

alias timer='echo "Timer started. Stop with Ctrl-D." \
  && date \
  && time cat \
  && date'

# --- end stopwatch }}}
# --- timestamp {{{

alias dt='date --iso-8601=s'
alias dt-adelaide='_t=$(TZ=Australia/Adelaide dt)     ; echo "[$_t] Adelaide"'
alias dt-amsterdam='_t=$(TZ=Europe/Amsterdam dt)      ; echo "[$_t] Amsterdam"'
alias dt-anchorage='_t=$(TZ=America/Anchorage dt)     ; echo "[$_t] Anchorage"'
alias dt-andorra='_t=$(TZ=Europe/Andorra dt)          ; echo "[$_t] Andorra"'
alias dt-anguilla='_t=$(TZ=America/Anguilla dt)       ; echo "[$_t] Anguilla"'
alias dt-antigua='_t=$(TZ=America/Antigua dt)         ; echo "[$_t] Antigua"'
alias dt-auckland='_t=$(TZ=Pacific/Auckland dt)       ; echo "[$_t] Auckland"'
alias dt-barcelona='_t=$(TZ=Europe/Barcelona dt)      ; echo "[$_t] Barcelona"'
alias dt-belize='_t=$(TZ=America/Belize dt)           ; echo "[$_t] Belize"'
alias dt-berlin='_t=$(TZ=Europe/Berlin dt)            ; echo "[$_t] Berlin"'
alias dt-bermuda='_t=$(TZ=Atlantic/Bermuda dt)        ; echo "[$_t] Bermuda"'
alias dt-bogota='_t=$(TZ=America/Bogota dt)           ; echo "[$_t] Bogotá"'
alias dt-bucharest='_t=$(TZ=Europe/Bucharest dt)      ; echo "[$_t] Bucharest"'
alias dt-budapest='_t=$(TZ=Europe/Budapest dt)        ; echo "[$_t] Budapest"'
alias dt-buenosaires='_t=$(TZ=America/Buenos_Aires dt); echo "[$_t] Buenos Aires"'
alias dt-calcutta='_t=$(TZ=Asia/Calcutta dt)          ; echo "[$_t] Calcutta"'
alias dt-cayman='_t=$(TZ=America/Cayman dt)           ; echo "[$_t] Cayman"'
alias dt-chicago='_t=$(TZ=America/Chicago dt)         ; echo "[$_t] Chicago"'
alias dt-costarica='_t=$(TZ=America/Costa_Rica dt)    ; echo "[$_t] Costa Rica"'
alias dt-dublin='_t=$(TZ=Europe/Dublin dt)            ; echo "[$_t] Dublin"'
alias dt-efate='_t=$(TZ=Pacific/Efate dt)             ; echo "[$_t] Efate"'
alias dt-fiji='_t=$(TZ=Pacific/Fiji dt)               ; echo "[$_t] Fiji"'
alias dt-galapagos='_t=$(TZ=Pacific/Galapagos dt)     ; echo "[$_t] Galapagos"'
alias dt-gibraltar='_t=$(TZ=Europe/Gibraltar dt)      ; echo "[$_t] Gibraltar"'
alias dt-grenada='_t=$(TZ=America/Grenada dt)         ; echo "[$_t] Grenada"'
alias dt-guam='_t=$(TZ=Pacific/Guam dt)               ; echo "[$_t] Guam"'
alias dt-guatemala='_t=$(TZ=America/Guatemala dt)     ; echo "[$_t] Guatemala"'
alias dt-helsinki='_t=$(TZ=Europe/Helsinki dt)        ; echo "[$_t] Helsinki"'
alias dt-hongkong='_t=$(TZ=Asia/Hong_Kong dt)         ; echo "[$_t] Hong Kong"'
alias dt-honolulu='_t=$(TZ=Pacific/Honolulu dt)       ; echo "[$_t] Honolulu"'
alias dt-isleofman='_t=$(TZ=Europe/Isle_of_Man dt)    ; echo "[$_t] Isle of Man"'
alias dt-istanbul='_t=$(TZ=Europe/Istanbul dt)        ; echo "[$_t] Istanbul"'
alias dt-jamaica='_t=$(TZ=America/Jamaica dt)         ; echo "[$_t] Jamaica"'
alias dt-jerusalem='_t=$(TZ=Asia/Jerusalem dt)        ; echo "[$_t] Jerusalem"'
alias dt-johannesburg='_t=$(TZ=Africa/Johannesburg dt); echo "[$_t] Johannesburg"'
alias dt-juneau='_t=$(TZ=America/Juneau dt)           ; echo "[$_t] Juneau"'
alias dt-kiev='_t=$(TZ=Europe/Kiev dt)                ; echo "[$_t] Kiev"'
alias dt-lisbon='_t=$(TZ=Europe/Lisbon dt)            ; echo "[$_t] Lisbon"'
alias dt-london='_t=$(TZ=Europe/London dt)            ; echo "[$_t] London"'
alias dt-losangeles='_t=$(TZ=America/Los_Angeles dt)  ; echo "[$_t] Los Angeles"'
alias dt-malta='_t=$(TZ=Europe/Malta dt)              ; echo "[$_t] Malta"'
alias dt-managua='_t=$(TZ=America/Managua dt)         ; echo "[$_t] Managua"'
alias dt-monaco='_t=$(TZ=Europe/Monaco dt)            ; echo "[$_t] Monaco"'
alias dt-montevideo='_t=$(TZ=America/Montevideo dt)   ; echo "[$_t] Montevideo"'
alias dt-montreal='_t=$(TZ=America/Montreal dt)       ; echo "[$_t] Montréal"'
alias dt-moscow='_t=$(TZ=Europe/Moscow dt)            ; echo "[$_t] Moscow"'
alias dt-nauru='_t=$(TZ=Pacific/Nauru dt)             ; echo "[$_t] Nauru"'
alias dt-newyork='_t=$(TZ=America/New_York dt)        ; echo "[$_t] New York"'
alias dt-niue='_t=$(TZ=Pacific/Niue dt)               ; echo "[$_t] Niue"'
alias dt-novosibirsk='_t=$(TZ=Asia/Novosibirsk dt)    ; echo "[$_t] Novosibirsk"'
alias dt-oslo='_t=$(TZ=Europe/Oslo dt)                ; echo "[$_t] Oslo"'
alias dt-palau='_t=$(TZ=Pacific/Palau dt)             ; echo "[$_t] Palau"'
alias dt-panama='_t=$(TZ=America/Panama dt)           ; echo "[$_t] Panama"'
alias dt-paris='_t=$(TZ=Europe/Paris dt)              ; echo "[$_t] Paris"'
alias dt-perth='_t=$(TZ=Australia/Perth dt)           ; echo "[$_t] Perth"'
alias dt-pitcairn='_t=$(TZ=Pacific/Pitcairn dt)       ; echo "[$_t] Pitcairn"'
alias dt-prague='_t=$(TZ=Europe/Prague dt)            ; echo "[$_t] Prague"'
alias dt-reykjavik='_t=$(TZ=Atlantic/Reykjavik dt)    ; echo "[$_t] Reykjavík"'
alias dt-santiago='_t=$(TZ=America/Santiago dt)       ; echo "[$_t] Santiago"'
alias dt-saopaulo='_t=$(TZ=America/Sao_Paulo dt)      ; echo "[$_t] São Paulo"'
alias dt-seoul='_t=$(TZ=Asia/Seoul dt)                ; echo "[$_t] Seoul"'
alias dt-sitka='_t=$(TZ=America/Sitka dt)             ; echo "[$_t] Sitka"'
alias dt-sofia='_t=$(TZ=Europe/Sofia dt)              ; echo "[$_t] Sofia"'
alias dt-southpole='_t=$(TZ=Antarctica/South_Pole dt) ; echo "[$_t] South Pole"'
alias dt-stlucia='_t=$(TZ=America/St_Lucia dt)        ; echo "[$_t] St Lucia"'
alias dt-stockholm='_t=$(TZ=Europe/Stockholm dt)      ; echo "[$_t] Stockholm"'
alias dt-sydney='_t=$(TZ=Australia/Sydney dt)         ; echo "[$_t] Sydney"'
alias dt-tahiti='_t=$(TZ=Pacific/Tahiti dt)           ; echo "[$_t] Tahiti"'
alias dt-tokyo='_t=$(TZ=Asia/Tokyo dt)                ; echo "[$_t] Tokyo"'
alias dt-toronto='_t=$(TZ=America/Toronto dt)         ; echo "[$_t] Toronto"'
alias dt-utc='_t=$(TZ=UTC dt)                         ; echo "[$_t] UTC"'
alias dt-vienna='_t=$(TZ=Europe/Vienna dt)            ; echo "[$_t] Vienna"'
alias dt-vladivostok='_t=$(TZ=Asia/Vladivostok dt)    ; echo "[$_t] Vladivostok"'
alias dt-whitehorse='_t=$(TZ=America/Whitehorse dt)   ; echo "[$_t] Whitehorse"'
alias dt-yellowknife='_t=$(TZ=America/Yellowknife dt) ; echo "[$_t] Yellowknife"'
alias dt-zagreb='_t=$(TZ=Europe/Zagreb dt)            ; echo "[$_t] Zagreb"'
alias dt-zurich='_t=$(TZ=Europe/Zurich dt)            ; echo "[$_t] Zürich"'

# --- end timestamp }}}
# --- text {{{

alias hr='printf "$(printf "\e["$(shuf -i 91-97 -n 1)";1m%%%ds\e[0m\n" "$(tput cols)")" \
  | tr " " ='

# --- end text }}}
# --- tmux {{{

[[ -n "$TMUX" ]] \
  && alias clear='clear; tmux clear-history'
[[ -n "$TMUX" ]] \
  && alias reset='reset; tmux clear-history'

# --- end tmux }}}
# --- vim {{{

alias :e='"$EDITOR"'
[[ -n "$_has_vim" ]] \
  && alias view='vim -R'
[[ -n "$_has_vim" ]] \
  && alias vime='vim -u $HOME/.vim/vimrc.encrypt -x'
[[ -n "$_has_vim" ]] \
  && alias viml='vim -u $HOME/.vim/vimrc.lite'
[[ -n "$_has_vim" ]] \
  && alias vimmin='vim \
    -u NONE \
    -U NONE \
    --cmd "set nocompatible | syntax on | filetype plugin indent on"'
[[ -n "$_has_mvim" ]] \
  && alias mview='mvim -R'
[[ -n "$_has_mvim" ]] \
  && alias mvime='mvim -u $HOME/.vim/vimrc.encrypt -x'
[[ -n "$_has_mvim" ]] \
  && alias mviml='mvim -u $HOME/.vim/vimrc.lite'
[[ -n "$_has_mvim" ]] \
  && alias mvimmin='mvim \
    -u NONE \
    -U NONE \
    --cmd "set nocompatible | syntax on | filetype plugin indent on"'
[[ -n "$_has_nvim" ]] \
  && alias nv='nvim'
[[ -n "$_has_nvim" ]] \
  && alias nview='nvim -R'

# --- end vim }}}
# --- wget {{{

[[ -n "$_has_wget" ]] \
  && alias wget='wget --hsts-file=$HOME/.config/wget/wget-hsts'

# --- end wget }}}

# end aliases }}}
# ==============================================================================
# functions {{{

for _fn in $(find "$HOME/.functions.d" -type f -name "*.sh"); do
  source "$_fn"
done

# end functions }}}
# ==============================================================================
# completions {{{

[[ -r '/usr/local/share/bash-completion/bash_completion' ]] \
  && source /usr/local/share/bash-completion/bash_completion

# end completions }}}
# ==============================================================================
# osx {{{

# copy or tar files without ._ (dot underscore) files
export COPYFILE_DISABLE=true

# don't check mail when opening terminal
unset MAILCHECK

# end osx }}}
# ==============================================================================
# beam {{{

# enable repl history
export ERL_AFLAGS='-kernel shell_history enabled'

# end beam }}}
# ==============================================================================
# homebrew {{{

# opt out of Homebrew's analytics
export HOMEBREW_NO_ANALYTICS=1

# don't leak GitHub username
export HOMEBREW_NO_GITHUB_API=1

# abort Cask installation if the Cask does not have a checksum defined
export HOMEBREW_CASK_OPTS='--require-sha'

# avoid protocol downgrades from HTTPS to HTTP via redirect
#export HOMEBREW_NO_INSECURE_REDIRECT=1

# disable automatic updates
#export HOMEBREW_NO_AUTO_UPDATE=1

# end homebrew }}}
# ==============================================================================
# fzf {{{

# use rg/ag/pt/ack as the default source for fzf
if [[ -n "$_has_rg" ]]; then
  export FZF_DEFAULT_COMMAND='rg \
    --hidden \
    --smart-case \
    --color never \
    --ignore-vcs \
    --files \
    -g ""'
elif [[ -n "$_has_ag" ]]; then
  export FZF_DEFAULT_COMMAND='ag \
    --hidden \
    --smart-case \
    --nocolor \
    --skip-vcs-ignores \
    -g ""'
elif [[ -n "$_has_pt" ]]; then
  export FZF_DEFAULT_COMMAND='pt \
    --hidden \
    --nocolor \
    -e \
    -g=""'
elif [[ -n "$_has_ack" ]]; then
  export FZF_DEFAULT_COMMAND='ack \
    --nocolor \
    --nopager \
    -g ""'
fi

# use rg/ag/pt/ack for ctrl-t completion
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# use rg/ag/pt/ack for ** completion
_fzf_compgen_path() {
  if [[ -n "$_has_rg" ]]; then
    rg --hidden --smart-case --color never --ignore-vcs --files -g "" "$1"
  elif [[ -n "$_has_ag" ]]; then
    ag --hidden --smart-case --nocolor --skip-vcs-ignores -g "" "$1"
  elif [[ -n "$_has_pt" ]]; then
    pt --hidden --nocolor -e -g="" "$1"
  elif [[ -n "$_has_ack" ]]; then
    ack --nocolor --nopager -g "" "$1"
  fi
}

# use multi-select and seoul256 colors
export FZF_DEFAULT_OPTS='
  --multi
  --color fg:242,bg:233,hl:65,fg+:15,bg+:234,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
'

# improved preview
[[ -n "$_has_tree" ]] \
  && export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -$LINES'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' \
  --preview-window down:3:hidden \
  --bind ?:toggle-preview"
[[ -x "$HOME/.vim/plugged/fzf.vim/bin/preview.sh" ]] \
  && export FZF_CTRL_T_OPTS="--preview '$HOME/.vim/plugged/fzf.vim/bin/preview.sh {} \
    | head -200'"

# source fzf key bindings
[[ -r "$HOME/.fzf.bash" ]] \
  && source "$HOME/.fzf.bash"
# source fzf functions
[[ -r "$HOME/.fzf-extras/fzf-extras.sh" ]] \
  && source "$HOME/.fzf-extras/fzf-extras.sh"

# end fzf }}}
# ==============================================================================
# cryfs {{{

export CRYFS_NO_UPDATE_CHECK=true

# end cryfs }}}
# ==============================================================================
# gpg {{{

# configure pinentry to use the correct tty
GPG_TTY="$(tty)"
export GPG_TTY

# end gpg }}}
# ==============================================================================
# screen {{{

export SCREENRC="$HOME/.config/screen/screenrc"

# end screen }}}
# ==============================================================================
# pg {{{

export PSQLRC="$HOME/.config/pg/psqlrc"
export PGPASSFILE="$HOME/.config/pg/pgpass"
export PGSERVICEFILE="$HOME/.config/pg/pg_service.conf"

# end pg }}}
# ==============================================================================

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
