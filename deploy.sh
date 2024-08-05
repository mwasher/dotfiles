#!/usr/bin/env zsh

mkdir -p $HOME/.config

cd "`dirname \"$0\"`"

echo 'Linking dotfiles:' 

echo '  zsh'
mkdir -p $HOME/.config/zsh
ln -sf $PWD/zsh/zshenv $HOME/.zshenv
ln -sf $PWD/zsh/zshrc $HOME/.config/zsh/.zshrc
ln -sf $PWD/zsh/aliases.zsh $HOME/.config/zsh/aliases.zsh
ln -sf $PWD/zsh/helpers.zsh $HOME/.config/zsh/helpers.zsh
ln -sf $PWD/zsh/exports.zsh $HOME/.config/zsh/exports.zsh

case "$(uname -s)" in
  Darwin)
	  ;;

  Linux)
    ln -sf $PWD/zsh/dircolors $HOME/.dircolors
  	;;
esac

echo '  nvim'
mkdir -p $HOME/.config/nvim
ln -sf $PWD/nvim/init.lua $HOME/.config/nvim/init.lua
ln -sf $PWD/nvim/lua $HOME/.config/nvim/lua

echo '  wezterm'
mkdir -p $HOME/.config/wezterm
ln -sf $PWD/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua

echo '  starship'
mkdir -p $HOME/.config/starship
ln -sf $PWD/starship/starship.toml $HOME/.config/starship/starship.toml

echo 'Creating .hushlogin'
touch ~/.hushlogin

