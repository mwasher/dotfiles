#!/usr/bin/env zsh

# Create base config directory if necessary
mkdir -p $HOME/.config

# Make sure we are working out of the .dotfiles directory
cd "`dirname \"$0\"`"

echo 'Linking dotfiles:' 

# TODO: make sure zsh is installed and set as the shell for user
echo '  zsh'
mkdir -p $HOME/.config/zsh
ln -sf $PWD/zsh/zshenv $HOME/.zshenv
ln -sf $PWD/zsh/zshrc $HOME/.config/zsh/.zshrc
ln -sf $PWD/zsh/aliases.zsh $HOME/.config/zsh/aliases.zsh
ln -sf $PWD/zsh/helpers.zsh $HOME/.config/zsh/helpers.zsh
ln -sf $PWD/zsh/exports.zsh $HOME/.config/zsh/exports.zsh
ln -sf $PWD/zsh/dircolors $HOME/.dircolors

# TODO: make sure nvim is installed
echo '  nvim'
mkdir -p $HOME/.config/nvim
ln -sf $PWD/nvim/init.vim $HOME/.config/nvim/init.vim

echo 'Creating .hushlogin'
touch ~/.hushlogin

