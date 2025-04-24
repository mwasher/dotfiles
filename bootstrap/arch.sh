source "bootstrap/lib.sh"
source "bootstrap/installers.sh"

pinfo ">> Deploying for user '$(whoami)' on dist Arch Linux"

arch="arch"

pinfo ">> Installing common dependencies:"
for dep in "${commonDeps[@]}"; do
  install_$dep
done

install_zsh

install_dotfiles
