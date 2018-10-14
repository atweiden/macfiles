#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# usage
# -----------------------------------------------------------------------------

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

name="${_name:-Andy Weidenbaum}"      # Name    (GitHub)
email="${_email:-archbaum@gmail.com}" # Email   (GitHub)
github="${_github:-atweiden}"         # Account (GitHub)


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
              '--exclude=.hg'
              '--exclude=.subgit'
              '--exclude=doc'
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

# output numbers in a more human-readable format
_rsync_opts+=('--human-readable')

# print information showing the progress of the transfer
_rsync_opts+=('--progress')

rsync --verbose "${_rsync_opts[@]}" "$DIR/" "$HOME"


# -----------------------------------------------------------------------------
# vim-plug
# -----------------------------------------------------------------------------

_plug_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if ! [[ -e "$HOME/.vim/autoload/plug.vim" ]]; then
  curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs "$_plug_url"
  vim +PlugInstall +qa
fi


# -----------------------------------------------------------------------------
# github
# -----------------------------------------------------------------------------

gsed -i "s#yourname#$name#"         "$HOME/.config/git/config"
gsed -i "s#youremail#$email#"       "$HOME/.config/git/config"
gsed -i "s#yourgithubacct#$github#" "$HOME/.config/git/config"
gsed -i "s#yourname#$name#"         "$HOME/.config/hg/hgrc"
gsed -i "s#youremail#$email#"       "$HOME/.config/hg/hgrc"


# -----------------------------------------------------------------------------
# permissions
# -----------------------------------------------------------------------------

chmod 700 "$HOME/.gnupg" "$HOME/.ssh"

# vim: set filetype=sh foldmethod=marker foldlevel=0 nowrap:
