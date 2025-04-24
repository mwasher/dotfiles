#!/usr/bin/bash

commonDeps=(
  neovim
  ripgrep
  eza
  bat
  fd
  uv
)

source "bootstrap/lib.sh"

export PATH="${HOME}/.local/bin:${PATH}"

cd "$(dirname $0)"
dotRoot=$(pwd -P)

logFile="${dotRoot}/deploy.log"
rm -f $logFile

mkdir -p $HOME/.config
mkdir -p $HOME/.cache
mkdir -p $HOME/.local/bin

if [[ $(grep -sE '^ID='  /etc/os-release) =~ "arch" ]]; then
  source "bootstrap/arch.sh"
elif [[ $(grep -sE '^ID='  /etc/os-release) =~ "ubuntu" ]]; then
  source "bootstrap/ubuntu.sh"
elif [[ -f "/etc/redhat-release" ]]; then
  source "bootstrap/redhat.sh"
elif [[ $(uname -a 2>/dev/null) =~ "Darwin" ]]; then
  source "bootstrap/macos.sh"
else
  perror "ERROR: Distribution not found."
  exit 1
fi

pinfo "\nSuccess. Starting zsh...\n"

exec zsh

