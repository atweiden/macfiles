#!/bin/bash

# -----------------------------------------------------------------------------
# bootstrap: quick and easy dotfiles setup
# -----------------------------------------------------------------------------

# _usage_function() {{{

_usage_function() {
read -r -d '' _usage_string <<'EOF'
Usage:
  ./bootstrap.sh [-h|--help]
  ./bootstrap.sh [-n|--name <name>] [-e|--email <email>] [-g|--github <github>]

Options:
  -h, --help
    print this help message
  -n, --name <name>
    set full name (defaults to "Andy Weidenbaum")
  -e, --email <email>
    set email address (defaults to "archbaum@gmail.com")
  -g, --github <github>
    set GitHub username (defaults to "atweiden")
EOF
echo "$_usage_string"
}

# end _usage_function() }}}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      _usage_function
      exit 0
      ;;
    -n|--name)
      _name="$2"
      # shift past argument and value
      shift
      shift
      ;;
    -e|--email)
      _email="$2"
      shift
      shift
      ;;
    -g|--github)
      _github="$2"
      shift
      shift
      ;;
    *)
      # unknown option
      _usage_function
      exit 1
      ;;
  esac
done


# -----------------------------------------------------------------------------
# settings

name="${_name:-Andy Weidenbaum}"      # Name    (GitHub)
email="${_email:-archbaum@gmail.com}" # Email   (GitHub)
github="${_github:-atweiden}"         # Account (GitHub)


# -----------------------------------------------------------------------------
# dirs

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
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
_rsync_opts+=('--exclude=.git'
              '--exclude=.hg'
              '--exclude=.subgit'
              '--exclude=doc'
              '--exclude=bootstrap.sh'
              '--exclude=fetch-gpg-keys.sh'
              '--exclude=mac.sh'
              '--exclude=README.txt'
              '--exclude=UNLICENSE')

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

gsed -i "s#yourname#$name#"         "$HOME/.gitconfig"
gsed -i "s#youremail#$email#"       "$HOME/.gitconfig"
gsed -i "s#yourgithubacct#$github#" "$HOME/.gitconfig"
gsed -i "s#yourname#$name#"         "$HOME/.hgrc"
gsed -i "s#youremail#$email#"       "$HOME/.hgrc"

# vim: set filetype=sh foldmethod=marker foldlevel=0:
