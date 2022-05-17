#!/usr/bin/env zsh

# Init and pull down submodules 
echo 'Cloning submodules'
git submodule init
git submodule update

# Create base config directory if necessary
mkdir -p $HOME/.config

# Make sure we are working out of the .dotfiles directory
cd "`dirname \"$0\"`"

echo 'Linking dotfiles:' 

# TODO: make sure zsh is installed and set as the shell for user
echo '  zsh'
mkdir -p $HOME/.config/zsh
ln -sf $PWD/zsh/zplugins.d $HOME/.config/zsh/.zplugins.d
ln -sf $PWD/zsh/zshfn.d $HOME/.config/zsh/.zshfn.d
ln -sf $PWD/zsh/zshenv $HOME/.zshenv
ln -sf $PWD/zsh/zshrc $HOME/.config/zsh/.zshrc
ln -sf $PWD/zsh/zcolors $HOME/.config/zsh/.zcolors
ln -sf $PWD/zsh/zshal $HOME/.config/zsh/.zshal
ln -sf $PWD/zsh/zshrc $HOME/.config/zsh/.zshrc

# TODO: make sure nvim is installed
echo '  nvim'
mkdir -p $HOME/.config/nvim
ln -sf $PWD/nvim/init.vim $HOME/.config/nvim/init.vim

# TODO: make sure tmux is installed
echo '  tmux'
ln -sf $PWD/tmux/tmux.conf $HOME/.tmux.conf

echo 'Creating .hushlogin'
touch ~/.hushlogin

