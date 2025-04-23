source "bootstrap/lib.sh"
source "bootstrap/installers.sh"

pinfo ">> Deploying for user '$(whoami)' on dist Arch Linux"

local arch="arch"

deps=(
  neovim
  ripgrep
  eza
  bat
  fd
  uv
)

 pinfo ">> Installing depdencies"
 for dep in "${deps[@]}"; do
  install_$dep
 done

install_zsh

install_dotfiles

