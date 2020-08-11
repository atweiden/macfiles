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
                 [-i|--irssi <irssi>]

Options:
  -h, --help
    print this help message
  -n, --name <name>
    set full name (defaults to "$USER")
  -e, --email <email>
    set email address (defaults to "$USER@$HOSTNAME")
  -g, --github <github>
    set GitHub username (defaults to "$USER")
  -i, --irssi <irssi>
    set irssi username (defaults to "$USER")
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
    -i|--irssi)
      _irssi="$2"
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
# e.g. atweiden (for irc)
irssi="${_irssi:-$USER}"


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
              '--exclude=doc'
              '--exclude=resources'
              '--exclude=bootstrap.sh'
              '--exclude=fetch-pgp-keys.sh'
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
# vim-plug
# -----------------------------------------------------------------------------

_plug_url='https://github.com/junegunn/vim-plug/raw/master/plug.vim'
if ! [[ -e "$HOME/.vim/autoload/plug.vim" ]]; then
  echo -n 'Installing vim plugins... '
  curl \
    --create-dirs \
    --fail \
    --location \
    --output "$HOME/.vim/autoload/plug.vim" \
    --silent \
    "$_plug_url"
  vim +PlugInstall +qall > /dev/null 2>&1
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
# irssi
# -----------------------------------------------------------------------------

gsed -i "s#yourname#$irssi#"        "$HOME/.config/irssi/config"


# -----------------------------------------------------------------------------
# permissions
# -----------------------------------------------------------------------------

chmod 700 "$HOME/.gnupg"
chmod 700 "$HOME/.ssh"

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
