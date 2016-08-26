[[ -f ~/.bashrc ]] && source ~/.bashrc

# OPAM configuration
if [[ -f ~/.opam/opam-init/init.sh ]]; then
  source ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
fi
