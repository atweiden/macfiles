# ==============================================================================
# base {{{

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# system defaults
[[ -f /etc/bashrc ]] && . /etc/bashrc

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
  export TERM=tmux-256color
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

# --- defaults {{{

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

# --- end defaults }}}
# --- dotfiles {{{

PATH=$HOME/.bin:$PATH

# --- end dotfiles }}}
# --- perl {{{

PATH=/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/bin/site_perl:$PATH

# --- end perl }}}
# --- perl6 {{{

if [[ -x /usr/bin/perl6 ]]; then
  # PATH=$(perl6 -e "say ~CompUnit::RepositoryRegistry.repository-for-name('site')")/bin:$PATH
  # PATH=$(perl6 -e "say ~CompUnit::RepositoryRegistry.repository-for-name('vendor')")/bin:$PATH
  PATH=/usr/share/perl6/site/bin:/usr/share/perl6/vendor/bin:$PATH
  # panda
  # PATH=$(perl6 -e "say ~CompUnit::RepositoryRegistry.repository-for-name('home')")/bin:$PATH
fi

# --- end perl6 }}}

# end path }}}
# ==============================================================================
# prompt {{{

# --- history {{{

export PROMPT_COMMAND="history -a;history -c;history -r"

# --- end history }}}
# --- ps1 {{{

PS1="\[\e[01;31m\]┌─[\[\e[01;35m\u\e[01;31m\]]──[\[\e[00;37m\]${HOSTNAME%%.*}\[\e[01;32m\]]:\w$\[\e[01;31m\]\n\[\e[01;31m\]└──\[\e[01;36m\]>>\[\e[0m\]"

# --- end ps1 }}}

# end prompt }}}
# ==============================================================================
# aliases {{{

# --- gnu {{{

# use GNU tools on OSX instead of BSD
alias dircolors='gdircolors'
alias sed='gsed'
alias sort='gsort'
alias tar='gtar'
alias ls='LC_COLLATE=C gls --color=auto --group-directories-first'

# --- end gnu }}}
# --- diff {{{

if [[ -x /usr/bin/icdiff ]]; then
  alias diff='icdiff'
elif [[ -x /usr/bin/colordiff ]]; then
  alias diff='colordiff'
fi

# --- end diff }}}
# --- directory navigation {{{

alias l='ls -1F'
alias l1='ls -1AF'
alias la='ls -aF'
alias ll='ls -laihF'
[[ -x /usr/local/bin/tree ]] && alias tree='tree -C --charset utf-8 --dirsfirst'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias cdd='cd $HOME/Downloads'
alias cdg='cd $(git rev-parse --show-cdup)'
alias cdp='cd $HOME/Projects'
alias cds='cd $HOME/.src'
alias :q='exit'

# --- end directory navigation }}}
# --- disk space {{{

alias df='df -h'
alias du='du -h --max-depth=1'
alias dusort='du -x --block-size=1048576 | sort -nr'
alias free='free -m'

# --- end disk space }}}
# --- file compression {{{

[[ -x /usr/bin/zip ]] && alias zip='zip -9'
alias gzip='gzip -9'
alias bzip2='bzip2 -9'

# --- end file compression }}}
# --- grepping {{{

alias grep='grep --ignore-case --color=auto'
alias fgrep='fgrep --ignore-case --color=auto'
alias egrep='egrep --ignore-case --color=auto'
alias h\?='history | grep -v -E "grep|h\?" | grep "$@" -i --color=auto'
alias l\?='ls -1F | grep "$@" -i --color=auto'
alias p\?='ps auxf | grep -v grep | grep "$@" -i --color=auto'
[[ -x /usr/bin/ag ]] && alias ag='ag --hidden --smart-case --skip-vcs-ignores --path-to-agignore=$HOME/.agignore'
[[ -x /usr/bin/locate ]] && alias locate='locate --ignore-case'

# --- end grepping }}}
# --- languages {{{

# --- --- beam {{{

[[ -x /usr/bin/iex && -x /usr/bin/rlwrap ]] && alias iex='rlwrap -Aa iex'
[[ -x /usr/bin/erl && -x /usr/bin/rlwrap ]] && alias erl='rlwrap -Aa erl'

# --- --- end beam }}}
# --- --- perl6 {{{

[[ -x /usr/bin/perl6 ]] && alias p6='perl6'
[[ -x /usr/bin/perl6 ]] && alias prove6='prove -r -e perl6'
[[ -x /usr/bin/perl6 && -x /usr/bin/rlwrap ]] && alias rp='rlwrap perl6'

# --- --- end perl6 }}}
# --- --- python {{{

[[ -x /usr/bin/ptipython2 ]] && alias ptipython2='ptipython2 --vi'
[[ -x /usr/bin/ptipython ]] && alias ptipython='ptipython --vi'
[[ -x /usr/bin/ptpython2 ]] && alias ptpython2='ptpython2 --vi'
[[ -x /usr/bin/ptpython ]] && alias ptpython='ptpython --vi'

# --- --- end python }}}

# --- end languages }}}
# --- ps {{{

alias ps='ps --forest'

# --- end ps }}}
# --- subrepo {{{

[[ -x /usr/bin/subgit ]] && alias sg='subgit'
[[ -x /usr/bin/subhg ]] && alias shg='subhg'

# --- end subrepo }}}
# --- safety {{{

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# --- end safety }}}
# --- ssh {{{

[[ -x /usr/bin/mosh ]] && alias mosh='mosh -a'

# --- end ssh }}}
# --- tmux {{{

[[ -n $TMUX ]] && alias clear='clear; tmux clear-history'
[[ -n $TMUX ]] && alias reset='reset; tmux clear-history'

# --- end tmux }}}
# --- vim {{{

alias :e='"$EDITOR"'
[[ -x /usr/bin/vim ]] && alias view='vim -R'
[[ -x /usr/bin/vim ]] && alias vime='vim -u $HOME/.vimencrypt -x'
[[ -x /usr/bin/vim ]] && alias viml='vim -u $HOME/.vimrc.lite'
[[ -x /usr/bin/vim ]] && alias vimmin='vim -u NONE -U NONE --cmd "set nocompatible | syntax on | filetype plugin indent on"'
[[ -x /usr/bin/gvim ]] && alias gview='gvim -R'
[[ -x /usr/bin/gvim ]] && alias gvime='gvim -u $HOME/.vimencrypt -x'
[[ -x /usr/bin/gvim ]] && alias gviml='gvim -u $HOME/.vimrc.lite'
[[ -x /usr/bin/gvim ]] && alias gvimmin='gvim -u NONE -U NONE --cmd "set nocompatible | syntax on | filetype plugin indent on"'
[[ -x /usr/bin/nvim ]] && alias nv='nvim'
[[ -x /usr/bin/nvim ]] && alias nview='nvim -R'

# --- end vim }}}

# end aliases }}}
# ==============================================================================
# functions {{{

for _fn in $(find "$HOME/.functions.d" -type f -name "*.sh"); do . "${_fn}"; done

# end functions }}}
# ==============================================================================
# fzf {{{

# use ag/pt/ack as the default source for fzf
if [[ -x /usr/bin/ag ]]; then
  export FZF_DEFAULT_COMMAND='ag --hidden --smart-case --nocolor --skip-vcs-ignores --path-to-agignore=$HOME/.agignore -g ""'
elif [[ -x /usr/bin/pt ]]; then
  export FZF_DEFAULT_COMMAND='pt --hidden --nocolor -e -g=""'
elif [[ -x /usr/bin/ack ]]; then
  export FZF_DEFAULT_COMMAND='ack --nocolor --nopager -g ""'
fi

# use ag/pt/ack for ctrl-t completion
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# use ag/pt/ack for ** completion
_fzf_compgen_path() {
  if [[ -x /usr/bin/ag ]]; then
    ag \
      --hidden \
      --smart-case \
      --nocolor \
      --skip-vcs-ignores \
      --path-to-agignore="$HOME/.agignore" \
      -g "" \
      "$1"
  elif [[ -x /usr/bin/pt ]]; then
    pt --hidden --nocolor -e -g="" "$1"
  elif [[ -x /usr/bin/ack ]]; then
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
command -v tree > /dev/null && export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -$LINES'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden --bind ?:toggle-preview"
export FZF_CTRL_T_OPTS="--preview '(cat {} || tree -C {}) 2> /dev/null | head -$LINES'"

# create fzf key bindings
[[ -e ~/.fzf.bash ]] && source ~/.fzf.bash
[[ -e ~/.fzf-extras/fzf-extras.sh ]] && . ~/.fzf-extras/fzf-extras.sh

# end fzf }}}
# ==============================================================================
# cryfs {{{

export CRYFS_NO_UPDATE_CHECK=true

# end cryfs }}}
# ==============================================================================
# gpg {{{

export GPG_TTY=$(tty)

# end gpg }}}
# ==============================================================================

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
