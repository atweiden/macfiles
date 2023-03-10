#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# usage
# -----------------------------------------------------------------------------

_usage_function() {
read -r -d '' _usage_string <<EOF
Usage:
  ./bootstrap.sh [-h|--help]
  ./bootstrap.sh [-n|--name <name>]
                 [-e|--email <email>]
                 [-g|--github <github>]

Options:
  -h, --help
    print this help message
  -n, --name <name>
    set full name (defaults to "$USER")
  -e, --email <email>
    set email address (defaults to "$USER@$HOSTNAME")
  -g, --github <github>
    set GitHub username (defaults to "$USER")
EOF
echo "$_usage_string"
}

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
# -----------------------------------------------------------------------------

# e.g. Andy Weidenbaum (for git/hg)
name="${_name:-$USER}"
# e.g. atweiden@ioiojo.com (for git/hg)
email="${_email:-$USER@$HOSTNAME}"
# e.g. atweiden (for github)
github="${_github:-$USER}"


# -----------------------------------------------------------------------------
# dirs
# -----------------------------------------------------------------------------

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$HOME/.src"      \
         "$HOME/Desktop"   \
         "$HOME/Documents" \
         "$HOME/Downloads" \
         "$HOME/Graphics"  \
         "$HOME/Music"     \
         "$HOME/Projects"


# -----------------------------------------------------------------------------
# rsync
# -----------------------------------------------------------------------------

# rsync options
_rsync_opts=()

# exclude files
_rsync_opts+=('--exclude=.git'
              '--exclude=.gitkeep'
              '--exclude=.hg'
              '--exclude=.subgit'
              '--exclude=bootstrap.sh'
              '--exclude=macos.sh'
              '--exclude=README.txt'
              '--exclude=UNLICENSE')

# copy directories recursively
_rsync_opts+=('--recursive')

# copy symlinks as symlinks
_rsync_opts+=('--links')

# preserve permissions
_rsync_opts+=('--perms')

# backup files in ~/.local/share/dotfiles
_rsync_opts+=('--backup'
              "--backup-dir=$HOME/.local/share/dotfiles")

rsync "${_rsync_opts[@]}" "$DIR/" "$HOME"


# -----------------------------------------------------------------------------
# vim
# -----------------------------------------------------------------------------

_packager_src='https://github.com/kristijanhusak/vim-packager'
_packager_dst="$HOME/.vim/pack/packager/opt/vim-packager"
if ! [[ -d "$_packager_dst" ]]; then
  echo -n 'Installing vim plugin manager (kristijanhusak/vim-packager)... '
  git clone \
    --quiet \
    "$_packager_src" \
    "$_packager_dst"
  echo 'done.'
  echo -n 'Installing vim plugins... '
  vim \
    -c 'PackagerSetup' \
    -c 'call packager#install({ "on_finish": "quitall" })' > \
    /dev/null 2>&1
  echo 'done.'
fi


# -----------------------------------------------------------------------------
# git/hg
# -----------------------------------------------------------------------------

gsed -i "s#yourname#$name#"         "$HOME/.config/git/config"
gsed -i "s#youremail#$email#g"      "$HOME/.config/git/config"
gsed -i "s#githubusername#$github#" "$HOME/.config/git/config"
gsed -i "s#yourname#$name#"         "$HOME/.config/hg/hgrc"
gsed -i "s#youremail#$email#"       "$HOME/.config/hg/hgrc"
gsed -i "s#githubusername#$github#" "$HOME/.ssh/config"


# -----------------------------------------------------------------------------
# iTerm2
# -----------------------------------------------------------------------------

# use $USER instead of $name because we're configuring $HOME
gsed -i "s#yourname#$USER#"         "$HOME/.config/iterm2/seoul256.json"


# -----------------------------------------------------------------------------
# permissions
# -----------------------------------------------------------------------------

chmod 700 "$HOME/.gnupg"
chmod 700 "$HOME/.ssh"

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
