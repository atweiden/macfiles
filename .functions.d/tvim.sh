#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# tvim: open file(s) in parent vim instance
#
# USAGE:
#   tvim <layout> [<file> <file>...]
#
# Layout
#   sp    Open file in horizontal split
#   vs    Open file in vertical split
#   tab   Open file in tab
#
# See Also:
#   .vim/config/functions/tvim.vim
#   .vim/config/terminal.vim
#
# Credit: https://github.com/BeomjoonGoh/vim-easy-term
# -----------------------------------------------------------------------------
if [[ -n $VIMRUNTIME ]]; then
  tvim() {
    # layout with which to open file (sp, vs, tab)
    local layout
    # file to open
    local file

    layout="$1"

    # check arguments
    case "$layout" in
      sp|vs|tab)
        ;;
      *)
        exit 1
        ;;
    esac

    if [[ -n "$2" ]]; then
      file="$(realpath "$2")"
    fi

    # send json to parent vim instance
    printf ']51;["call", "TvimOpen", %s]' "[\"$layout\", \"$file\"]"
  }
fi

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
