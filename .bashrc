# ==============================================================================
# base {{{

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# system defaults
[[ -f /etc/bashrc ]] && source /etc/bashrc

# end base }}}
# ==============================================================================
# bash settings {{{

# --- editor {{{

set -o vi
export EDITOR=vim
export FCEDIT=vim
export VISUAL=vim
export SUDO_EDITOR=rvim

# --- end editor }}}
# --- history {{{

# don't put duplicate lines in the history. See bash(1) for more
# options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTIGNORE="l:ls:cd:exit"
export HISTSIZE=
export HISTFILESIZE=
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "

# --- end history }}}
# --- locale {{{

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# --- end locale }}}
# --- man pages {{{

export MANPAGER="less -X"

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

# append to the history file, don't overwrite it
shopt -s histappend

# add failed commands to the bash history
shopt -s histreedit

# edit a recalled history line before executing
shopt -s histverify

# --- end shopt }}}
# --- tmpdir {{{

[[ -z "$TMPDIR" ]] && export TMPDIR=/tmp

# --- end tmpdir }}}

# end bash settings }}}
# ==============================================================================
# terminal settings {{{

# --- display {{{

if [[ "x$DISPLAY" != "x" ]]; then
  export HAS_256_COLORS=yes
  alias tmux="tmux -2"
  [[ "$TERM" == "xterm" ]] && export TERM=xterm-256color
else
  if [[ "$TERM" == "xterm" || "$TERM" =~ "256color" ]]; then
    export HAS_256_COLORS=yes
    alias tmux="tmux -2"
  fi
fi
if [[ "$TERM" == "screen" && "$HAS_256_COLORS" == "yes" ]]; then
  export TERM=screen-256color
elif [[ "$TERM" == "tmux" && "$HAS_256_COLORS" == "yes" ]]; then
  export TERM=screen-256color
fi

# --- end display }}}
# --- remove ctrl-s ctrl-q {{{

# remove the ^S ^Q mappings. See all mappings: stty -a
[[ $- =~ i ]] && stty -ixoff -ixon
stty stop undef
stty start undef

# --- end remove ctrl-s ctrl-q }}}

# end terminal settings }}}
# ==============================================================================
# path {{{

unset PATH MANPATH

# --- defaults {{{

PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

# --- end defaults }}}
# --- gnu {{{

# use GNU tools on OSX instead of BSD
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/make/libexec/gnuman:$MANPATH"

# --- end gnu }}}
# --- dotfiles {{{

PATH="$HOME/.bin:$PATH"

# --- end dotfiles }}}
# --- erlang {{{

MANPATH="/usr/local/opt/erlang/lib/erlang/man:$MANPATH"

# --- end erlang }}}
# --- perl6 {{{

# from output of `~/.rakudobrew/bin/rakudobrew init -`
PATH="$HOME/.rakudobrew/bin:$PATH"
rakudobrew() {
  local command="$1"
  [[ "$#" -gt 0 ]] && shift
  case "$command" in
    shell)
      eval "$(rakudobrew "sh" "$@")";;
    *)
      command rakudobrew "$command" "$@";;
  esac
}

# for locally-installed perl6 executables
[[ $(command -v perl6) ]] \
  && PATH="$(perl6 -e 'say ~CompUnit::RepositoryRegistry.repository-for-name(q<site>)')/bin:$PATH"

# --- end perl6 }}}

export PATH MANPATH

# end path }}}
# ==============================================================================
# presence {{{

_has_ack=$(command -v ack)
_has_ag=$(command -v ag)
_has_colordiff=$(command -v colordiff)
_has_erl=$(command -v erl)
_has_icdiff=$(command -v icdiff)
_has_iex=$(command -v iex)
_has_mosh=$(command -v mosh)
_has_mvim=$(command -v mvim)
_has_nvim=$(command -v nvim)
_has_perl6=$(command -v perl6)
_has_pt=$(command -v pt)
_has_rclone=$(command -v rclone)
_has_rlwrap=$(command -v rlwrap)
_has_subgit=$(command -v subgit)
_has_subhg=$(command -v subhg)
_has_tree=$(command -v tree)
_has_vim=$(command -v vim)

# end presence }}}
# ==============================================================================
# prompt {{{

# --- history {{{

export PROMPT_COMMAND="history -a; history -c; history -r"

# --- end history }}}
# --- ps1 {{{

PS1="\[\e[01;31m\]┌─[\[\e[01;35m\u\e[01;31m\]]──[\[\e[00;37m\]${HOSTNAME%%.*}\[\e[01;32m\]]:\w$\[\e[01;31m\]\n\[\e[01;31m\]└──\[\e[01;36m\]>>\[\e[0m\]"

# --- end ps1 }}}

# end prompt }}}
# ==============================================================================
# aliases {{{

# --- diff {{{

if [[ -n "$_has_icdiff" ]]; then
  alias diff='icdiff'
elif [[ -n "$_has_colordiff" ]]; then
  alias diff='colordiff'
fi

# --- end diff }}}
# --- directory navigation {{{

alias ls='LC_COLLATE=C gls --color=auto --group-directories-first'
alias l='ls -1F'
alias l1='ls -1AF'
alias la='ls -aF'
alias ll='ls -laihF'
[[ -n "$_has_tree" ]] && alias tree='tree -C --charset utf-8 --dirsfirst'
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

# --- end disk space }}}
# --- file compression {{{

alias zip='zip -9'
alias gzip='gzip -9'
alias bzip2='bzip2 -9'

# --- end file compression }}}
# --- grepping {{{

alias grep='grep --ignore-case --color=auto'
alias fgrep='fgrep --ignore-case --color=auto'
alias egrep='egrep --ignore-case --color=auto'
alias h\?='history | grep -v -E "grep|h\?" | grep "$@" -i --color=auto'
alias l\?='ls -1F | grep "$@" -i --color=auto'
alias p\?='ps -a -x -f | grep -v grep | grep "$@" -i --color=auto'
[[ -n "$_has_ag" ]] && alias ag='ag --hidden --smart-case --skip-vcs-ignores --path-to-ignore=$HOME/.agignore'
alias locate='glocate --ignore-case'

# --- end grepping }}}
# --- languages {{{

# --- --- beam {{{

[[ -n "$_has_iex" && -n "$_has_rlwrap" ]] && alias iex='rlwrap --always-readline --ansi-colour-aware iex'
[[ -n "$_has_erl" && -n "$_has_rlwrap" ]] && alias erl='rlwrap --always-readline --ansi-colour-aware erl'

# --- --- end beam }}}
# --- --- perl6 {{{

[[ -n "$_has_perl6" ]] && alias p6='perl6'
[[ -n "$_has_perl6" ]] && alias prove6='prove -r -e perl6'
[[ -n "$_has_perl6" && -n "$_has_rlwrap" ]] && alias rp='rlwrap perl6'

# --- --- end perl6 }}}

# --- end languages }}}
# --- subrepo {{{

[[ -n "$_has_subgit" ]] && alias sg='subgit'
[[ -n "$_has_subhg" ]] && alias shg='subhg'

# --- end subrepo }}}
# --- safety {{{

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# --- end safety }}}
# --- osx {{{

alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* "delete from LSQuarantineEvent"'

# --- end osx }}}
# --- rclone {{{

[[ -n "$_has_rclone" ]] && alias rclone='rclone --transfers=16 --checkers=32 --ignore-size --low-level-retries 7 --retries 25 --delete-after'

# --- end rclone }}}
# --- ssh {{{

[[ -n "$_has_mosh" ]] && alias mosh='mosh -a'

# --- end ssh }}}
# --- timestamp {{{

alias dt='date +%FT%T%:::z'
alias dt-adelaide='_t=$(TZ=Australia/Adelaide dt)     ; echo "[$_t] Adelaide"'
alias dt-amsterdam='_t=$(TZ=Europe/Amsterdam dt)      ; echo "[$_t] Amsterdam"'
alias dt-anchorage='_t=$(TZ=America/Anchorage dt)     ; echo "[$_t] Anchorage"'
alias dt-andorra='_t=$(TZ=Europe/Andorra dt)          ; echo "[$_t] Andorra"'
alias dt-anguilla='_t=$(TZ=America/Anguilla dt)       ; echo "[$_t] Anguilla"'
alias dt-antigua='_t=$(TZ=America/Antigua dt)         ; echo "[$_t] Antigua"'
alias dt-barcelona='_t=$(TZ=Europe/Barcelona dt)      ; echo "[$_t] Barcelona"'
alias dt-belize='_t=$(TZ=America/Belize dt)           ; echo "[$_t] Belize"'
alias dt-berlin='_t=$(TZ=Europe/Berlin dt)            ; echo "[$_t] Berlin"'
alias dt-bermuda='_t=$(TZ=Atlantic/Bermuda dt)        ; echo "[$_t] Bermuda"'
alias dt-bogota='_t=$(TZ=America/Bogota dt)           ; echo "[$_t] Bogota"'
alias dt-bucharest='_t=$(TZ=Europe/Bucharest dt)      ; echo "[$_t] Bucharest"'
alias dt-budapest='_t=$(TZ=Europe/Budapest dt)        ; echo "[$_t] Budapest"'
alias dt-buenosaires='_t=$(TZ=America/Buenos_Aires dt); echo "[$_t] Buenos Aires"'
alias dt-calcutta='_t=$(TZ=Asia/Calcutta dt)          ; echo "[$_t] Calcutta"'
alias dt-cayman='_t=$(TZ=America/Cayman dt)           ; echo "[$_t] Cayman"'
alias dt-chicago='_t=$(TZ=America/Chicago dt)         ; echo "[$_t] Chicago"'
alias dt-costarica='_t=$(TZ=America/Costa_Rica dt)    ; echo "[$_t] Costa Rica"'
alias dt-dublin='_t=$(TZ=Europe/Dublin dt)            ; echo "[$_t] Dublin"'
alias dt-gibraltar='_t=$(TZ=Europe/Gibraltar dt)      ; echo "[$_t] Gibraltar"'
alias dt-grenada='_t=$(TZ=America/Grenada dt)         ; echo "[$_t] Grenada"'
alias dt-guatemala='_t=$(TZ=America/Guatemala dt)     ; echo "[$_t] Guatemala"'
alias dt-helsinki='_t=$(TZ=Europe/Helsinki dt)        ; echo "[$_t] Helsinki"'
alias dt-hongkong='_t=$(TZ=Asia/Hong_Kong dt)         ; echo "[$_t] Hong Kong"'
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
alias dt-newyork='_t=$(TZ=America/New_York dt)        ; echo "[$_t] New York"'
alias dt-novosibirsk='_t=$(TZ=Asia/Novosibirsk dt)    ; echo "[$_t] Novosibirsk"'
alias dt-oslo='_t=$(TZ=Europe/Oslo dt)                ; echo "[$_t] Oslo"'
alias dt-panama='_t=$(TZ=America/Panama dt)           ; echo "[$_t] Panama"'
alias dt-paris='_t=$(TZ=Europe/Paris dt)              ; echo "[$_t] Paris"'
alias dt-perth='_t=$(TZ=Australia/Perth dt)           ; echo "[$_t] Perth"'
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
# --- tmux {{{

[[ -n $TMUX ]] && alias clear='clear; tmux clear-history'
[[ -n $TMUX ]] && alias reset='reset; tmux clear-history'

# --- end tmux }}}
# --- vim {{{

alias :e='"$EDITOR"'
[[ -n "$_has_vim" ]] && alias view='vim -R'
[[ -n "$_has_vim" ]] && alias vime='vim -u $HOME/.vimencrypt -x'
[[ -n "$_has_vim" ]] && alias viml='vim -u $HOME/.vimrc.lite'
[[ -n "$_has_vim" ]] && alias vimmin='vim -u NONE -U NONE --cmd "set nocompatible | syntax on | filetype plugin indent on"'
[[ -n "$_has_mvim" ]] && alias mview='mvim -R'
[[ -n "$_has_mvim" ]] && alias mvime='mvim -u $HOME/.vimencrypt -x'
[[ -n "$_has_mvim" ]] && alias mviml='mvim -u $HOME/.vimrc.lite'
[[ -n "$_has_mvim" ]] && alias mvimmin='mvim -u NONE -U NONE --cmd "set nocompatible | syntax on | filetype plugin indent on"'
[[ -n "$_has_nvim" ]] && alias nv='nvim'
[[ -n "$_has_nvim" ]] && alias nview='nvim -R'

# --- end vim }}}

# end aliases }}}
# ==============================================================================
# functions {{{

for _fn in $(find "$HOME/.functions.d" -type f -name "*.sh"); do source "$_fn"; done

# end functions }}}
# ==============================================================================
# completions {{{

[[ -f /usr/local/share/bash-completion/bash_completion ]] \
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
# homebrew {{{

# opt out of Homebrew's analytics
export HOMEBREW_NO_ANALYTICS=1

# end homebrew }}}
# ==============================================================================
# fzf {{{

# use ag/pt/ack as the default source for fzf
if [[ -n "$_has_ag" ]]; then
  export FZF_DEFAULT_COMMAND='ag --hidden --smart-case --nocolor --skip-vcs-ignores --path-to-ignore=$HOME/.agignore -g ""'
elif [[ -n "$_has_pt" ]]; then
  export FZF_DEFAULT_COMMAND='pt --hidden --nocolor -e -g=""'
elif [[ -n "$_has_ack" ]]; then
  export FZF_DEFAULT_COMMAND='ack --nocolor --nopager -g ""'
fi

# use ag/pt/ack for ctrl-t completion
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# use ag/pt/ack for ** completion
_fzf_compgen_path() {
  if [[ -n "$_has_ag" ]]; then
    ag \
      --hidden \
      --smart-case \
      --nocolor \
      --skip-vcs-ignores \
      --path-to-ignore="$HOME/.agignore" \
      -g "" \
      "$1"
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
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden --bind ?:toggle-preview"
[[ -x "$HOME/.vim/plugged/fzf.vim/bin/preview.sh" ]] \
  && export FZF_CTRL_T_OPTS="--preview '$HOME/.vim/plugged/fzf.vim/bin/preview.sh {} | head -200'"

# create fzf key bindings
[[ -e "$HOME/.fzf.bash" ]] && source "$HOME/.fzf.bash"
[[ -e "$HOME/.fzf-extras/fzf-extras.sh" ]] && source "$HOME/.fzf-extras/fzf-extras.sh"

# end fzf }}}
# ==============================================================================
# cryfs {{{

export CRYFS_NO_UPDATE_CHECK=true

# end cryfs }}}
# ==============================================================================
# gpg {{{

GPG_TTY=$(tty)
export GPG_TTY

# end gpg }}}
# ==============================================================================

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
