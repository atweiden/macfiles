#!/bin/bash

# -----------------------------------------------------------------------------
# bootstrap: quick and easy dotfiles setup
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# settings

name="Andy Weidenbaum"     # Name      (GitHub)
email="archbaum@gmail.com" # Email     (GitHub)
github="atweiden"          # Account   (GitHub)


# -----------------------------------------------------------------------------
# dirs

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p "$HOME/.marks"    \
         "$HOME/.src"      \
         "$HOME/Desktop"   \
         "$HOME/Documents" \
         "$HOME/Downloads" \
         "$HOME/Graphics"  \
         "$HOME/Music"     \
         "$HOME/Projects"


# -----------------------------------------------------------------------------
# rsync

# rsync options
_rsync_opts=()

# exclude files
_rsync_opts+=('--exclude=etc'
              '--exclude=.git'
              '--exclude=.hg'
              '--exclude=.subgit'
              '--exclude=README.md'
              '--exclude=TODO.md'
              '--exclude=UNLICENSE'
              '--exclude=bootstrap.sh')

# copy directories recursively
_rsync_opts+=('--recursive')

# preserve permissions
_rsync_opts+=('--perms')

# backup files in ~/.local/share/dotfiles
_rsync_opts+=('--backup'
              "--backup-dir=$HOME/.local/share/dotfiles")

# output numbers in a more human-readable format
_rsync_opts+=('--human-readable')

# print information showing the progress of the transfer
_rsync_opts+=('--progress')

rsync --verbose "${_rsync_opts[@]}" "$DIR/" "$HOME"


# -----------------------------------------------------------------------------
# github

sed -i "s#yourname#$name#"         "$HOME/.gitconfig"
sed -i "s#youremail#$email#"       "$HOME/.gitconfig"
sed -i "s#yourgithubacct#$github#" "$HOME/.gitconfig"
sed -i "s#yourname#$name#"         "$HOME/.hgrc"
sed -i "s#youremail#$email#"       "$HOME/.hgrc"
