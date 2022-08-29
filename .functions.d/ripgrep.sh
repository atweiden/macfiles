#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# rgs: search templates in void-linux/void-packages
# -----------------------------------------------------------------------------

rgs() { rg --glob template --regexp "$@" srcpkgs/; }

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
