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
# --- osx {{{

export COPYFILE_DISABLE=true

# --- end osx }}}
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

unset PATH

# --- defaults {{{

PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

# --- end defaults }}}
# --- dotfiles {{{

PATH=$HOME/.bin:$PATH

# --- end dotfiles }}}
# --- perl6 {{{

# from output of `~/.rakudobrew/bin/rakudobrew init -`
PATH=$HOME/.rakudobrew/bin:$PATH
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

# for panda-installed perl6 executables
[[ $(command -v perl6) ]] \
  && PATH=$(perl6 -e "say ~CompUnit::RepositoryRegistry.repository-for-name('site')")/bin:$PATH

# --- end perl6 }}}

export PATH

# end path }}}
# ==============================================================================
# presence {{{

_has_ack=$(command -v ack)
_has_ag=$(command -v ag)
_has_colordiff=$(command -v colordiff)
_has_erl=$(command -v erl)
_has_gdircolors=$(command -v gdircolors)
_has_glocate=$(command -v glocate)
_has_gls=$(command -v gls)
_has_gsed=$(command -v gsed)
_has_gsort=$(command -v gsort)
_has_gtar=$(command -v gtar)
_has_gupdatedb=$(command -v gupdatedb)
_has_icdiff=$(command -v icdiff)
_has_iex=$(command -v iex)
_has_mosh=$(command -v mosh)
_has_mvim=$(command -v mvim)
_has_nvim=$(command -v nvim)
_has_perl6=$(command -v perl6)
_has_pt=$(command -v pt)
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

# --- gnu {{{

# use GNU tools on OSX instead of BSD
[[ -n "$_has_gdircolors" ]] && alias dircolors='gdircolors'
[[ -n "$_has_glocate" ]] && alias locate='glocate --ignore-case'
[[ -n "$_has_gls" ]] && alias ls='LC_COLLATE=C gls --color=auto --group-directories-first'
[[ -n "$_has_gsed" ]] && alias sed='gsed'
[[ -n "$_has_gsort" ]] && alias sort='gsort'
[[ -n "$_has_gtar" ]] && alias tar='gtar'
[[ -n "$_has_gupdatedb" ]] && alias updatedb='gupdatedb'

# --- end gnu }}}
# --- diff {{{

if [[ -n "$_has_icdiff" ]]; then
  alias diff='icdiff'
elif [[ -n "$_has_colordiff" ]]; then
  alias diff='colordiff'
fi

# --- end diff }}}
# --- directory navigation {{{

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
[[ -n "$_has_ag" ]] && alias ag='ag --hidden --smart-case --skip-vcs-ignores --path-to-agignore=$HOME/.agignore'

# --- end grepping }}}
# --- languages {{{

# --- --- beam {{{

[[ -n "$_has_iex" && -n "$_has_rlwrap" ]] && alias iex='rlwrap -Aa iex'
[[ -n "$_has_erl" && -n "$_has_rlwrap" ]] && alias erl='rlwrap -Aa erl'

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
# --- ssh {{{

[[ -n "$_has_mosh" ]] && alias mosh='mosh -a'

# --- end ssh }}}
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

find "$HOME/.functions.d" -type f -name "*.sh" | while read -r _fn; do source "$_fn"; done

# end functions }}}
# ==============================================================================
# fzf {{{

# use ag/pt/ack as the default source for fzf
if [[ -n "$_has_ag" ]]; then
  export FZF_DEFAULT_COMMAND='ag --hidden --smart-case --nocolor --skip-vcs-ignores --path-to-agignore=$HOME/.agignore -g ""'
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
      --path-to-agignore="$HOME/.agignore" \
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
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
'

# improved preview
[[ -n "$_has_tree" ]] \
  && export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -$LINES'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden --bind ?:toggle-preview"
export FZF_CTRL_T_OPTS="--preview '(cat {} || tree -C {}) 2> /dev/null | head -$LINES'"

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
