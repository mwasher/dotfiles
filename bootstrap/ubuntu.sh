source "bootstrap/lib.sh"
source "bootstrap/installers.sh"

pinfo ">> Deploying for user '$(whoami)' on dist Ubuntu Linux"

arch="ubuntu"

pinfo ">> Installing common dependencies:"
for dep in "${commonDeps[@]}"; do
  install_$dep
done

install_zsh

install_dotfiles
