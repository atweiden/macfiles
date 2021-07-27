#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# zmarks: quickly navigate your filesystem from the command-line
#
# Credit: http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
# -----------------------------------------------------------------------------

export MARKPATH="$HOME/.config/zmarks"

z() {
  cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

mark() {
  ln -s "$(pwd)" "$MARKPATH/$1"
}

unmark() {
  rm -i "$MARKPATH/$1"
}

marks() {
  find "$MARKPATH" -mindepth 1 -maxdepth 1 \( -type f -o -type l \) \
    | sed 's,^\./,,'
}

_completemarks() {
  local curw
  local wordlist
  curw="${COMP_WORDS[COMP_CWORD]}"
  wordlist="$(find "$MARKPATH" -type l -printf '%f\n')"
  COMPREPLY=($(compgen -W "${wordlist[@]}" -- "$curw"))
  return 0
}

complete -F _completemarks z unmark
export MARKPATH

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
