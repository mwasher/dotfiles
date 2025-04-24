source "bootstrap/deps.sh"
source "bootstrap/installers.sh"

ptask "\n>> Deploying for user '$(whoami)' on dist Ubuntu Linux\n"

arch="ubuntu"

ptask ">> Installing common dependencies:"
for dep in "${commonDeps[@]}"; do
  install_$dep
done

install_zsh

install_dotfiles
