#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# mkdircd: mkdir then cd into it
# -----------------------------------------------------------------------------

mkdircd() { mkdir -p "$@" && eval cd "\"\$$#\""; }

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
