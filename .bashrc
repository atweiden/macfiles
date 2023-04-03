# ==============================================================================
# base {{{

# configure pinentry to use the correct tty
GPG_TTY="$(tty)"
export GPG_TTY

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

export LESS='-MRSXi#16j.5'
#             ||||||  |
#             ||||||  +-- center on search matches
#             |||||+----- scroll horizontally 16 columns at a time
#             ||||+------ case-insensitive search unless pattern contains uppercase
#             |||+------- don't clear the screen after exiting
#             ||+-------- don't wrap long lines
#             |+--------- parse color codes
#             +---------- show more information in prompt

# colors
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"; a="${a%_}"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"; a="${a%_}"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_so="$(printf '%b' '[00;47;30m')"; a="${a%_}"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"; a="${a%_}"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"; a="${a%_}"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"; a="${a%_}"

# disable less history file
export LESSHISTFILE=-

# --- end less }}}
# --- locale {{{

export LC_ALL=

# --- end locale }}}
# --- man pages {{{

# colorize/paginate man pages with less
export GROFF_NO_SGR=1
export MANPAGER="less $LESS"

# --- end man pages }}}
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

# enable recursive globbing, e.g. `echo **/*.txt`
shopt -s globstar

# append to the history file, don't overwrite it
shopt -s histappend

# add failed commands to the bash history
shopt -s histreedit

# edit a recalled history line before executing
shopt -s histverify

# enable case-insensitive globbing, used in pathname expansion
shopt -s nocaseglob

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
export XDG_STATE_HOME="$HOME/.local/state"

# --- end xdg }}}

# end bash settings }}}
# ==============================================================================
# terminal settings {{{

# --- terminfo {{{

export TERMINFO='/usr/local/opt/ncurses/share/terminfo'

# --- end terminfo }}}
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
# --- dotnet {{{

# add .NET Core SDK tools
PATH="$HOME/.dotnet/tools:$PATH"

# --- end dotnet }}}
# --- curl {{{

PATH="/usr/local/opt/curl/bin:$PATH"

# --- end curl }}}
# --- fzf {{{

PATH="$HOME/.vim/pack/packager/opt/fzf/bin:$PATH"

# --- end fzf }}}
# --- gambit {{{

PATH="/usr/local/opt/gambit-scheme/current/bin:$PATH"

# --- end gambit }}}
# --- gerbil {{{

PATH="/usr/local/opt/gerbil-scheme/libexec/bin:$PATH"

# --- end gerbil }}}
# --- gettext {{{

PATH="/usr/local/opt/gettext/bin:$PATH"

# --- end gettext }}}
# --- gnu {{{

# use GNU tools on macOS instead of BSD
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gawk/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gawk/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gnu-getopt/share/man:$MANPATH"
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/make/libexec/gnuman:$MANPATH"

# --- end gnu }}}
# --- go {{{

PATH="$HOME/.go/bin:$PATH"

# --- end go }}}
# --- icu4c {{{

PATH="/usr/local/opt/icu4c/bin:$PATH"
PATH="/usr/local/opt/icu4c/sbin:$PATH"

# --- end icu4c }}}
# --- llvm {{{

PATH="/usr/local/opt/llvm/bin:$PATH"

# --- end llvm }}}
# --- luajit {{{

PATH="/usr/local/opt/luajit-openresty/bin:$PATH"

# --- end luajit }}}
# --- ncurses {{{

PATH="/usr/local/opt/ncurses/bin:$PATH"

# --- end ncurses }}}
# --- openssl {{{

PATH="/usr/local/opt/openssl/bin:$PATH"

# --- end openssl }}}
# --- perl {{{

PATH="/usr/local/opt/perl/bin:$PATH"

# --- end perl }}}
# --- pod2man {{{

PATH="/usr/local/opt/pod2man/bin:$PATH"

# --- end pod2man }}}
# --- python {{{

PATH="$HOME/.pyenv/bin:$PATH"

# --- end python }}}
# --- raku {{{

PATH="$HOME/.raku/bin:$PATH"
PATH="/usr/local/opt/rakudo/share/perl6/core/bin:$PATH"
PATH="/usr/local/opt/rakudo/share/perl6/site/bin:$PATH"
PATH="/usr/local/opt/rakudo/share/perl6/vendor/bin:$PATH"

# --- end raku }}}
# --- ruby {{{

PATH="/usr/local/opt/ruby/bin:$PATH"

# --- end ruby }}}
# --- rust {{{

PATH="$HOME/.cargo/bin:$PATH"

# --- end rust }}}
# --- sqlite {{{

PATH="/usr/local/opt/sqlite3/bin:$PATH"

# --- end sqlite }}}
# --- unzip {{{

PATH="/usr/local/opt/unzip/bin:$PATH"

# --- end unzip }}}
# --- whois {{{

PATH="/usr/local/opt/whois/bin:$PATH"

# --- end whois }}}

export PATH MANPATH

# end path }}}
# ==============================================================================
# presence {{{

_has_ack="$(command -v ack)"
_has_ag="$(command -v ag)"
_has_cargo="$(command -v cargo)"
_has_colordiff="$(command -v colordiff)"
_has_curl="$(command -v curl)"
_has_diffr="$(command -v diffr)"
_has_exa="$(command -v exa)"
_has_fd="$(command -v fd)"
_has_gdb="$(command -v gdb)"
_has_git="$(command -v git)"
_has_glibtool="$(command -v glibtool)"
_has_glow="$(command -v glow)"
_has_gtime="$(command -v gtime)"
_has_gunits="$(command -v gunits)"
_has_gwhich="$(command -v gwhich)"
_has_icdiff="$(command -v icdiff)"
_has_iex="$(command -v iex)"
_has_irb="$(command -v irb)"
_has_locate="$(command -v glocate)"
_has_lynx="$(command -v lynx)"
_has_mosh="$(command -v mosh)"
_has_mvim="$(command -v mvim)"
_has_ncdu="$(command -v ncdu)"
_has_nvim="$(command -v nvim)"
_has_rclone="$(command -v rclone)"
_has_rg="$(command -v rg)"
_has_sqlite3="$(command -v sqlite3)"
_has_tmux="$(command -v tmux)"
_has_tree="$(command -v tree)"
_has_vim="$(command -v vim)"
_has_wget="$(command -v wget)"
_has_ydl="$(command -v youtube-dl)"

# end presence }}}
# ==============================================================================
# prompt {{{

# --- history {{{

# in order:
#
# - append new history lines entered in bash session to ~/.bash_history
# - clear history for current shell, but don't delete ~/.bash_history
# - read history file for current shell, append contents to history list
#
# has the effect of creating a "global" ~/.bash_history amongst shells
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

# --- bash {{{

alias incognito=' unset HISTFILE'
alias ,='clear'

# --- end bash }}}
# --- clipboard {{{

alias n='nullclip'

# --- end clipboard }}}
# --- curl {{{

if [[ -n "$_has_curl" ]]; then
  alias curl='curl --config $HOME/.config/curl/curlrc'
  # protect against https downgrade attacks
  alias scurl='curl --tlsv1.2 --proto =https'
fi

# --- end curl }}}
# --- dbs {{{

if [[ -n "$_has_sqlite3" ]]; then
  alias sqlite3='sqlite3 -init $HOME/.config/sqlite3/sqliterc'
  alias sql='sqlite3 -interactive :memory:'
fi

# --- end dbs }}}
# --- diff {{{

if [[ -n "$_has_icdiff" ]]; then
  alias diff='icdiff'
elif [[ -n "$_has_colordiff" ]]; then
  alias diff='colordiff'
fi

# --- end diff }}}
# --- directory navigation {{{

if [[ -n "$_has_exa" ]]; then
  alias ls='exa \
    --classify \
    --color=auto \
    --group-directories-first \
    --sort=Name \
    --time-style=long-iso'
  alias l='ls --oneline'
  alias l1='ls --all --oneline'
  alias la='ls --all --all'
  alias ll='ls --all --all --binary --group --inode --links --long'
  alias tree='exa \
    --color=always \
    --git-ignore \
    --group-directories-first \
    --sort=Name \
    --tree'
else
  alias ls='LC_COLLATE=C gls \
    --classify \
    --color=auto \
    --group-directories-first \
    --time-style=long-iso'
  alias l='ls -1'
  alias l1='ls -1 --almost-all'
  alias la='ls --all'
  alias ll='ls --all --human-readable --inode -l'
  [[ -n "$_has_tree" ]] \
    && alias tree='tree -C --charset utf-8 --dirsfirst'
fi
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias cdd='cd $HOME/Downloads'
alias cdf="cd \"$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')\""
alias cdp='cd $HOME/Projects'
alias cds='cd $HOME/.src'
alias :o='open "${1:-.}"'
alias :q='exit'

# --- end directory navigation }}}
# --- disk space {{{

alias df='df --si'
alias du='du --si --max-depth=1'
alias dusort='du --block-size=M --max-depth=0 --one-file-system --total * \
  | sort --numeric-sort --reverse'
[[ -n "$_has_ncdu" ]] \
  && alias ncdu='ncdu \
    --color dark \
    -rr \
    -x \
    --si \
    --confirm-quit \
    --exclude-from $HOME/.config/search/ignore'

# --- end disk space }}}
# --- elixir {{{

[[ -n "$_has_iex" ]] \
  && alias iex='iex --dot-iex $HOME/.config/elixir/iex.exs'

# --- end elixir }}}
# --- file compression {{{

alias zip='zip -9'
alias gzip='gzip -9'
alias bzip2='bzip2 -9'

# --- end file compression }}}
# --- gdb {{{

[[ -n "$_has_gdb" ]] \
  && alias gdb='gdb -q -nh -x $HOME/.config/gdb/init'

# --- end gdb }}}
# --- git {{{

if [[ -n "$_has_git" ]]; then
  alias g='git'
  alias gc='git commit'
  alias gca='git commit --all'
  alias gcaf='git commit --all --file=$HOME/s.ci'
  alias gcp='git commit --patch'
  alias gd='git diff'
  alias gdr='git diffrev "$@"'
  alias gdrh='git diffrev HEAD'
  alias gpl='git pull'
  alias gps='git push'
  alias gs='git status --short --branch'
fi

# --- end git }}}
# --- glow {{{

# workaround for upstream not respecting $XDG_CONFIG_HOME on macos
[[ -n "$_has_glow" ]] \
  && alias glow='glow --config $HOME/.config/glow/glow.yml'

# --- end glow }}}
# --- gnu {{{

[[ -n "$_has_glibtool" ]] \
  && alias libtool='glibtool'
[[ -n "$_has_gtime" ]] \
  && alias time='gtime'
[[ -n "$_has_gunits" ]] \
  && alias units='gunits --history $HOME/.config/units/history'
[[ -n "$_has_gwhich" ]] \
  && alias which='gwhich'

# --- end gnu }}}
# --- grepping {{{

alias grep='grep --ignore-case --color=auto'
alias egrep='grep --extended-regexp'
alias fgrep='grep --fixed-strings'
alias history\?='history | grep --invert-match "history\?" | grep "$@"'
alias ls\?='ls -1F | grep "$@"'
alias ps\?='ps -a -x -f | grep --invert-match grep | grep "$@"'
alias pkg\?='brew list -1 | grep "$@"'
alias sysctl\?='sysctl -a 2>/dev/null | grep "$@"'
[[ -n "$_has_ack" ]] \
  && alias ack='ack \
      --ackrc=$HOME/.config/ack/ackrc'
[[ -n "$_has_ag" ]] \
  && alias ag='ag \
      --hidden \
      --smart-case \
      --path-to-ignore $HOME/.config/search/ignore'
if [[ -n "$_has_rg" ]]; then
  alias rg='rg \
    --hidden \
    --ignore-file $HOME/.config/search/ignore \
    --smart-case'
  alias rgu='rg \
    --no-ignore \
    --no-ignore-files \
    --unrestricted \
    --unrestricted \
    --unrestricted'
fi
[[ -n "$_has_locate" ]] \
  && alias locate='glocate --ignore-case'

# --- end grepping }}}
# --- info {{{

alias info='info --vi-keys'

# --- end info }}}
# --- path {{{

alias path='echo -e ${PATH//:/\\n}'

# --- end path }}}
# --- lynx {{{

[[ -n "$_has_lynx" ]] \
  && alias lynx='lynx -cfg $HOME/.config/lynx/lynx.cfg'

# --- end lynx }}}
# --- macos {{{

alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; \
  sudo rm -rfv $HOME/.Trash; \
  sudo rm -rfv /private/var/log/asl/*.asl; \
  sqlite3 $HOME/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* \
    "delete from LSQuarantineEvent"'

# usage: wifi <on|off>
alias wifi='networksetup -setairportpower en0'

# --- end macos }}}
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
# --- repl {{{

alias r='repl'
alias rex='repl --language elixir -- --dot-iex $HOME/.config/elixir/iex.exs'
alias rnl='repl --language fennel'

# --- end repl }}}
# --- ruby {{{

[[ -n "$_has_irb" ]] \
  && alias irb='irb \
    --colorize \
    --multiline \
    --readline'

# --- end ruby }}}
# --- rust {{{

# narrow output of cargo crev to dependencies in main crate root
[[ -n "$_has_cargo" ]] \
  && alias crev-verify="cargo crev verify \
    | rg --color never --fixed-strings --file \
    <(cargo tree --no-dev-dependencies --no-indent \
      | cut --delimiter=' ' --fields=1)"

# --- end rust }}}
# --- safety {{{

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# --- end safety }}}
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
# --- text {{{

alias hr='printf "$(printf "\e["$(shuf -i 91-97 -n 1)";1m%%%ds\e[0m\n" "$(tput cols)")" \
  | tr " " ='

# --- end text }}}
# --- timestamp {{{

alias dt='date --iso-8601=s'
alias dt-addisababa='_t=$(TZ=Africa/Addis_Ababa dt)   ; echo "[$_t] Addis Ababa"'
alias dt-adelaide='_t=$(TZ=Australia/Adelaide dt)     ; echo "[$_t] Adelaide"'
alias dt-amsterdam='_t=$(TZ=Europe/Amsterdam dt)      ; echo "[$_t] Amsterdam"'
alias dt-anchorage='_t=$(TZ=America/Anchorage dt)     ; echo "[$_t] Anchorage"'
alias dt-andorra='_t=$(TZ=Europe/Andorra dt)          ; echo "[$_t] Andorra"'
alias dt-anguilla='_t=$(TZ=America/Anguilla dt)       ; echo "[$_t] Anguilla"'
alias dt-antigua='_t=$(TZ=America/Antigua dt)         ; echo "[$_t] Antigua"'
alias dt-aruba='_t=$(TZ=America/Aruba dt)             ; echo "[$_t] Aruba"'
alias dt-asuncion='_t=$(TZ=America/Asuncion dt)       ; echo "[$_t] Asunción"'
alias dt-auckland='_t=$(TZ=Pacific/Auckland dt)       ; echo "[$_t] Auckland"'
alias dt-bangkok='_t=$(TZ=Asia/Bangkok dt)            ; echo "[$_t] Bangkok"'
alias dt-barcelona='_t=$(TZ=Europe/Barcelona dt)      ; echo "[$_t] Barcelona"'
alias dt-belgrade='_t=$(TZ=Europe/Belgrade dt)        ; echo "[$_t] Belgrade"'
alias dt-belize='_t=$(TZ=America/Belize dt)           ; echo "[$_t] Belize"'
alias dt-berlin='_t=$(TZ=Europe/Berlin dt)            ; echo "[$_t] Berlin"'
alias dt-bermuda='_t=$(TZ=Atlantic/Bermuda dt)        ; echo "[$_t] Bermuda"'
alias dt-bogota='_t=$(TZ=America/Bogota dt)           ; echo "[$_t] Bogotá"'
alias dt-boise='_t=$(TZ=America/Boise dt)             ; echo "[$_t] Boise"'
alias dt-brisbane='_t=$(TZ=Australia/Brisbane dt)     ; echo "[$_t] Brisbane"'
alias dt-bucharest='_t=$(TZ=Europe/Bucharest dt)      ; echo "[$_t] Bucharest"'
alias dt-budapest='_t=$(TZ=Europe/Budapest dt)        ; echo "[$_t] Budapest"'
alias dt-buenosaires='_t=$(TZ=America/Buenos_Aires dt); echo "[$_t] Buenos Aires"'
alias dt-calcutta='_t=$(TZ=Asia/Calcutta dt)          ; echo "[$_t] Calcutta"'
alias dt-canary='_t=$(TZ=Atlantic/Canary dt)          ; echo "[$_t] Canary Islands"'
alias dt-canberra='_t=$(TZ=Australia/Canberra dt)     ; echo "[$_t] Canberra"'
alias dt-cancun='_t=$(TZ=America/Cancun dt)           ; echo "[$_t] Cancun"'
alias dt-capetown='_t=$(TZ=Africa/Cape_Town dt)       ; echo "[$_t] Cape Town"'
alias dt-caracas='_t=$(TZ=America/Caracas dt)         ; echo "[$_t] Caracas"'
alias dt-casablanca='_t=$(TZ=Africa/Casablanca dt)    ; echo "[$_t] Casablanca"'
alias dt-cayman='_t=$(TZ=America/Cayman dt)           ; echo "[$_t] Cayman"'
alias dt-chicago='_t=$(TZ=America/Chicago dt)         ; echo "[$_t] Chicago"'
alias dt-colombo='_t=$(TZ=Asia/Colombo dt)            ; echo "[$_t] Colombo"'
alias dt-costarica='_t=$(TZ=America/Costa_Rica dt)    ; echo "[$_t] Costa Rica"'
alias dt-darwin='_t=$(TZ=Australia/Darwin dt)         ; echo "[$_t] Darwin"'
alias dt-denver='_t=$(TZ=America/Denver dt)           ; echo "[$_t] Denver"'
alias dt-dhaka='_t=$(TZ=Asia/Dhaka dt)                ; echo "[$_t] Dhaka"'
alias dt-dominica='_t=$(TZ=America/Dominica dt)       ; echo "[$_t] Dominica"'
alias dt-dublin='_t=$(TZ=Europe/Dublin dt)            ; echo "[$_t] Dublin"'
alias dt-edmonton='_t=$(TZ=America/Edmonton dt)       ; echo "[$_t] Edmonton"'
alias dt-efate='_t=$(TZ=Pacific/Efate dt)             ; echo "[$_t] Efate"'
alias dt-elsalvador='_t=$(TZ=America/El_Salvador dt)  ; echo "[$_t] El Salvador"'
alias dt-fiji='_t=$(TZ=Pacific/Fiji dt)               ; echo "[$_t] Fiji"'
alias dt-galapagos='_t=$(TZ=Pacific/Galapagos dt)     ; echo "[$_t] Galapagos"'
alias dt-gibraltar='_t=$(TZ=Europe/Gibraltar dt)      ; echo "[$_t] Gibraltar"'
alias dt-grandturk='_t=$(TZ=America/Grand_Turk dt)    ; echo "[$_t] Grand Turk"'
alias dt-grenada='_t=$(TZ=America/Grenada dt)         ; echo "[$_t] Grenada"'
alias dt-guam='_t=$(TZ=Pacific/Guam dt)               ; echo "[$_t] Guam"'
alias dt-guatemala='_t=$(TZ=America/Guatemala dt)     ; echo "[$_t] Guatemala"'
alias dt-helsinki='_t=$(TZ=Europe/Helsinki dt)        ; echo "[$_t] Helsinki"'
alias dt-hobart='_t=$(TZ=Australia/Hobart dt)         ; echo "[$_t] Hobart"'
alias dt-hochiminh='_t=$(TZ=Asia/Ho_Chi_Minh dt)      ; echo "[$_t] Ho Chi Minh City"'
alias dt-hongkong='_t=$(TZ=Asia/Hong_Kong dt)         ; echo "[$_t] Hong Kong"'
alias dt-honolulu='_t=$(TZ=Pacific/Honolulu dt)       ; echo "[$_t] Honolulu"'
alias dt-isleofman='_t=$(TZ=Europe/Isle_of_Man dt)    ; echo "[$_t] Isle of Man"'
alias dt-istanbul='_t=$(TZ=Europe/Istanbul dt)        ; echo "[$_t] Istanbul"'
alias dt-jakarta='_t=$(TZ=Asia/Jakarta dt)            ; echo "[$_t] Jakarta"'
alias dt-jamaica='_t=$(TZ=America/Jamaica dt)         ; echo "[$_t] Jamaica"'
alias dt-jerusalem='_t=$(TZ=Asia/Jerusalem dt)        ; echo "[$_t] Jerusalem"'
alias dt-johannesburg='_t=$(TZ=Africa/Johannesburg dt); echo "[$_t] Johannesburg"'
alias dt-juneau='_t=$(TZ=America/Juneau dt)           ; echo "[$_t] Juneau"'
alias dt-kathmandu='_t=$(TZ=Asia/Kathmandu dt)        ; echo "[$_t] Kathmandu"'
alias dt-kiev='_t=$(TZ=Europe/Kiev dt)                ; echo "[$_t] Kiev"'
alias dt-kualalumpur='_t=$(TZ=Asia/Kuala_Lumpur dt)   ; echo "[$_t] Kuala Lumpur"'
alias dt-lagos='_t=$(TZ=Africa/Lagos dt)              ; echo "[$_t] Lagos"'
alias dt-lima='_t=$(TZ=America/Lima dt)               ; echo "[$_t] Lima"'
alias dt-lisbon='_t=$(TZ=Europe/Lisbon dt)            ; echo "[$_t] Lisbon"'
alias dt-london='_t=$(TZ=Europe/London dt)            ; echo "[$_t] London"'
alias dt-losangeles='_t=$(TZ=America/Los_Angeles dt)  ; echo "[$_t] Los Angeles"'
alias dt-malta='_t=$(TZ=Europe/Malta dt)              ; echo "[$_t] Malta"'
alias dt-managua='_t=$(TZ=America/Managua dt)         ; echo "[$_t] Managua"'
alias dt-manila='_t=$(TZ=Asia/Manila dt)              ; echo "[$_t] Manila"'
alias dt-melbourne='_t=$(TZ=Australia/Melbourne dt)   ; echo "[$_t] Melbourne"'
alias dt-mexicocity='_t=$(TZ=America/Mexico_City dt)  ; echo "[$_t] Ciudad de México"'
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
alias dt-phnompenh='_t=$(TZ=Asia/Phnom_Penh dt)       ; echo "[$_t] Phnom Penh"'
alias dt-phoenix='_t=$(TZ=America/Phoenix dt)         ; echo "[$_t] Phoenix"'
alias dt-pitcairn='_t=$(TZ=Pacific/Pitcairn dt)       ; echo "[$_t] Pitcairn"'
alias dt-prague='_t=$(TZ=Europe/Prague dt)            ; echo "[$_t] Prague"'
alias dt-reykjavik='_t=$(TZ=Atlantic/Reykjavik dt)    ; echo "[$_t] Reykjavík"'
alias dt-rome='_t=$(TZ=Europe/Rome dt)                ; echo "[$_t] Rome"'
alias dt-santiago='_t=$(TZ=America/Santiago dt)       ; echo "[$_t] Santiago"'
alias dt-saopaulo='_t=$(TZ=America/Sao_Paulo dt)      ; echo "[$_t] São Paulo"'
alias dt-saotome='_t=$(TZ=Africa/Sao_Tome dt)         ; echo "[$_t] São Tomé"'
alias dt-seoul='_t=$(TZ=Asia/Seoul dt)                ; echo "[$_t] Seoul"'
alias dt-shanghai='_t=$(TZ=Asia/Shanghai dt)          ; echo "[$_t] Shanghai"'
alias dt-singapore='_t=$(TZ=Asia/Singapore dt)        ; echo "[$_t] Singapore"'
alias dt-sitka='_t=$(TZ=America/Sitka dt)             ; echo "[$_t] Sitka"'
alias dt-sofia='_t=$(TZ=Europe/Sofia dt)              ; echo "[$_t] Sofia"'
alias dt-southpole='_t=$(TZ=Antarctica/South_Pole dt) ; echo "[$_t] South Pole"'
alias dt-stlucia='_t=$(TZ=America/St_Lucia dt)        ; echo "[$_t] St Lucia"'
alias dt-stockholm='_t=$(TZ=Europe/Stockholm dt)      ; echo "[$_t] Stockholm"'
alias dt-sydney='_t=$(TZ=Australia/Sydney dt)         ; echo "[$_t] Sydney"'
alias dt-tahiti='_t=$(TZ=Pacific/Tahiti dt)           ; echo "[$_t] Tahiti"'
alias dt-taipei='_t=$(TZ=Asia/Taipei dt)              ; echo "[$_t] Taipei"'
alias dt-tokyo='_t=$(TZ=Asia/Tokyo dt)                ; echo "[$_t] Tokyo"'
alias dt-toronto='_t=$(TZ=America/Toronto dt)         ; echo "[$_t] Toronto"'
alias dt-utc='_t=$(TZ=UTC dt)                         ; echo "[$_t] UTC"'
alias dt-vancouver='_t=$(TZ=America/Vancouver dt)     ; echo "[$_t] Vancouver"'
alias dt-vienna='_t=$(TZ=Europe/Vienna dt)            ; echo "[$_t] Vienna"'
alias dt-vladivostok='_t=$(TZ=Asia/Vladivostok dt)    ; echo "[$_t] Vladivostok"'
alias dt-whitehorse='_t=$(TZ=America/Whitehorse dt)   ; echo "[$_t] Whitehorse"'
alias dt-yellowknife='_t=$(TZ=America/Yellowknife dt) ; echo "[$_t] Yellowknife"'
alias dt-zagreb='_t=$(TZ=Europe/Zagreb dt)            ; echo "[$_t] Zagreb"'
alias dt-zurich='_t=$(TZ=Europe/Zurich dt)            ; echo "[$_t] Zürich"'

# --- end timestamp }}}
# --- tmux {{{

# make tmux assume terminal supports 256 colors
[[ -n "$_has_tmux" ]] \
  && alias tmux='tmux -2'

if [[ -n "$TMUX" ]]; then
  alias clear='clear; tmux clear-history'
  alias reset='reset; tmux clear-history'
fi

# --- end tmux }}}
# --- vim {{{

alias :e='"$EDITOR"'
if [[ -n "$_has_vim" ]]; then
  alias view='vim -R'
  alias vime='vim \
    --cmd "set viminfo=" \
    --cmd "set nobackup" \
    --cmd "set noswapfile" \
    --cmd "set noundofile" \
    --cmd "set nowritebackup" \
    --cmd "set noshelltemp" \
    --cmd "set history=0" \
    --cmd "set cryptmethod=blowfish2"'
  alias vimmin='vim \
    -u NONE \
    -U NONE \
    --cmd "set nocompatible" \
    --cmd "syntax on" \
    --cmd "filetype plugin indent on"'
  alias rvim='vim -Z'
  alias rview='view -Z'
fi
if [[ -n "$_has_mvim" ]]; then
  alias mview='mvim -R'
  alias mvime='mvim \
    --cmd "set viminfo=" \
    --cmd "set nobackup" \
    --cmd "set noswapfile" \
    --cmd "set noundofile" \
    --cmd "set nowritebackup" \
    --cmd "set noshelltemp" \
    --cmd "set history=0" \
    --cmd "set cryptmethod=blowfish2"'
  alias mvimmin='mvim \
    -u NONE \
    -U NONE \
    --cmd "set nocompatible" \
    --cmd "syntax on" \
    --cmd "filetype plugin indent on"'
fi
if [[ -n "$_has_nvim" ]]; then
  alias nv='nvim'
  alias nview='nvim -R'
fi

# --- end vim }}}
# --- wget {{{

[[ -n "$_has_wget" ]] \
  && alias wget='wget \
    --config=$HOME/.config/wget/wgetrc \
    --hsts-file=$HOME/.config/wget/wget-hsts'

# --- end wget }}}
# --- ydl {{{

if [[ -n "$_has_ydl" ]]; then
  alias ydl-240p='youtube-dl \
    --format "bestvideo[height<=240]+bestaudio/best[height<=240]"'
  alias ydl-360p='youtube-dl \
    --format "bestvideo[height<=360]+bestaudio/best[height<=360]"'
  alias ydl-480p='youtube-dl \
    --format "bestvideo[height<=480]+bestaudio/best[height<=480]"'
  alias ydl-720p='youtube-dl \
    --format "bestvideo[height<=720]+bestaudio/best[height<=720]"'
  alias ydl-1080p='youtube-dl \
    --format "bestvideo[height<=1080]+bestaudio/best[height<=1080]"'
fi

# --- end ydl }}}

# end aliases }}}
# ==============================================================================
# software {{{

# --- beam {{{

# enable repl history
export ERL_AFLAGS='-kernel shell_history enabled'

# --- end beam }}}
# --- brew {{{

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

# --- end brew }}}
# --- cryfs {{{

export CRYFS_NO_UPDATE_CHECK=true

# --- end cryfs }}}
# --- diffr {{{

if [[ -n "$_has_diffr" ]]; then
  unset DIFFR
  # from junegunn/seoul256.vim rgb_map: 65 => #5f875f
  DIFFR+=' --colors refine-added:none:background:95,135,95'
  # from junegunn/seoul256.vim rgb_map: 131 => #af5f5f
  DIFFR+=' --colors refine-removed:none:background:175,95,95'
  # use seoul256 colors
  alias diffr="diffr $DIFFR"
  # for git config and diffrous
  export DIFFR
fi

# --- end diffr }}}
# --- dotnet {{{

export DOTNET_ROOT="/usr/local/opt/dotnet/libexec"

# --- end dotnet }}}
# --- elixir {{{

export HEX_HOME="$XDG_DATA_HOME/hex"
export MIX_HOME="$XDG_DATA_HOME/mix"

# --- end elixir }}}
# --- fd {{{

# needed for fd to use terminal colors
export LS_COLORS=

# --- end fd }}}
# --- fzf {{{

# use fd as default source for fzf, incl alt+c ctrl+t and ** completion
if [[ -n "$_has_fd" ]]; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --strip-cwd-prefix'
  export FZF_ALT_C_COMMAND='fd --type d --hidden --strip-cwd-prefix'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  _fzf_compgen_path() { $FZF_DEFAULT_COMMAND; }
fi

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
[[ -x "$HOME/.vim/pack/packager/opt/fzf.vim/bin/preview.sh" ]] \
  && export FZF_CTRL_T_OPTS="--preview '$HOME/.vim/pack/packager/opt/fzf.vim/bin/preview.sh {} \
    | head -200'"

# source fzf completions
[[ -r "$HOME/.vim/pack/packager/opt/fzf/shell/completion.bash" ]] \
  && source "$HOME/.vim/pack/packager/opt/fzf/shell/completion.bash"
# source fzf key bindings
[[ -r "$HOME/.vim/pack/packager/opt/fzf/shell/key-bindings.bash" ]] \
  && source "$HOME/.vim/pack/packager/opt/fzf/shell/key-bindings.bash"
# source fzf functions
[[ -r "$HOME/.fzf-extras/fzf-extras.sh" ]] \
  && source "$HOME/.fzf-extras/fzf-extras.sh"

# --- end fzf }}}
# --- gerbil {{{

export GERBIL_GSC='/usr/local/opt/gambit-scheme/current/bin/gsc'
export GERBIL_HOME='/usr/local/opt/gerbil-scheme/libexec'

# --- end gerbil }}}
# --- go {{{

export GOPATH="$HOME/.go"
export GOCACHE="$GOPATH/cache"
export GOENV="$GOPATH/env"
export GOPROXY="direct"

# --- end go }}}
# --- gpg {{{

# refresh gpg-agent tty
if ! [[ "$UID" == '0' ]]; then
  gpg-connect-agent updatestartuptty /bye >/dev/null
fi

# --- end gpg }}}
# --- ip {{{

export INTERFACE="$(interface)"

# --- end ip }}}
# --- mercurial {{{

# workaround for upstream not respecting $XDG_CONFIG_HOME on macos
export HGRCPATH="$HOME/.config/hg/hgrc"

# --- end mercurial }}}
# --- ocaml {{{

# configure opam
test -r "$HOME/.opam/opam-init/init.sh" \
  && . "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null \
  || true

# use extended utf-8 characters (camels) in opam messages
export OPAMUTF8MSGS=1

# --- end ocaml }}}
# --- opener {{{

export OPENER='open'

# --- end opener }}}
# --- postgresql {{{

export PSQLRC="$HOME/.config/pg/psqlrc"
export PGPASSFILE="$HOME/.config/pg/pgpass"
export PGSERVICEFILE="$HOME/.config/pg/pg_service.conf"

# --- end postgresql }}}
# --- python {{{

export PYENV_ROOT="$HOME/.pyenv"

# don't write .pyc files
export PYTHONDONTWRITEBYTECODE=1

# --- end python }}}
# --- rlwrap {{{

export RLWRAP_HOME="$HOME/.config/rlwrap"

# %L,%C = line, column number of cursor position in rlwrap's edit buffer
export RLWRAP_EDITOR="vim '+call cursor(%L,%C)'"

# --- end rlwrap }}}
# --- ruby {{{

export IRBRC="$HOME/.config/irb/irbrc"

# --- end ruby }}}
# --- screen {{{

export SCREENRC="$HOME/.config/screen/screenrc"

# --- end screen }}}

# end software }}}
# ==============================================================================
# functions {{{

for _fn in $(find "$HOME/.functions.d" -type f -name "*.sh"); do
  source "$_fn"
done

# end functions }}}
# ==============================================================================
# completions {{{

unset FIGNORE

# ensure existing homebrew v1 completions continue to work
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] \
  && source /usr/local/etc/profile.d/bash_completion.sh

# --- defaults {{{

# don't shell-complete filenames suffixed with ~
FIGNORE='~'

# --- end defaults }}}
# --- c {{{

# don't shell-complete object files
FIGNORE="$FIGNORE:.o"

# --- end c }}}
# --- fsharp {{{

# only shell-complete paket.{dependencies,references}
FIGNORE="$FIGNORE:aket.lock"

# --- end fsharp }}}
# --- git {{{

# improve git completion for git aliases
if declare -F __git_complete > /dev/null; then
  __git_complete g git
  __git_complete gc git_commit
  __git_complete gd git_diff
  __git_complete gpl git_pull
  __git_complete gps git_push
  __git_complete gs git_status
fi

# --- end git }}}
# --- go {{{

# only shell-complete go.mod
FIGNORE="$FIGNORE:o.sum"

# --- end go }}}
# --- janet {{{

# don't shell-complete jpm_tree
FIGNORE="$FIGNORE:pm_tree"

# --- end janet }}}
# --- js {{{

# don't shell-complete bower_components
FIGNORE="$FIGNORE:ower_components"

# don't shell-complete jspm_packages
FIGNORE="$FIGNORE:spm_packages"

# don't shell-complete lib-cov
FIGNORE="$FIGNORE:ib-cov"

# don't shell-complete node_modules
FIGNORE="$FIGNORE:ode_modules"

# don't shell-complete web_modules
FIGNORE="$FIGNORE:eb_modules"

# --- end js }}}
# --- lua {{{

# don't shell-complete lua_modules
FIGNORE="$FIGNORE:ua_modules"

# --- end lua }}}
# --- nim {{{

# don't shell-complete nimcache
FIGNORE="$FIGNORE:imcache"

# don't shell-complete nimblecache
FIGNORE="$FIGNORE:imblecache"

# --- end nim }}}
# --- rust {{{

# only shell-complete Cargo.toml
FIGNORE="$FIGNORE:argo.lock"

# --- end rust }}}
# --- zig {{{

# don't shell-complete zig-cache
FIGNORE="$FIGNORE:ig-cache"

# don't shell-complete zig-out
FIGNORE="$FIGNORE:ig-out"

# --- end zig }}}

export FIGNORE

# end completions }}}
# ==============================================================================
# system {{{

# copy or tar files without ._ (dot underscore) files
export COPYFILE_DISABLE=true

# don't check mail when opening terminal
unset MAILCHECK

# end system }}}
# ==============================================================================

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
