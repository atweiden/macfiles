#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# jmarks: quickly navigate your filesystem from the command-line
#
# credit: http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
# -----------------------------------------------------------------------------

readonly MARKPATH="$HOME/.config/jmarks"

jump() {
  mkdir -p "$MARKPATH"
  cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

mark() {
  mkdir -p "$MARKPATH"
  ln -s "$(pwd)" "$MARKPATH/$1"
}

unmark() {
  mkdir -p "$MARKPATH"
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

complete -F _completemarks jump unmark
export MARKPATH

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
