pinfo ">> Deploying for dist: Arch Linux"

pinfo ">> Installing depdencies"
sudo_cmd pacman -S --noconfirm neovim ripgrep eza bat fd

pinfo ">> Installing zsh"
sudo_cmd pacman -S --noconfirm zsh

pinfo ">> Setting login shell"
sudo_cmd chsh -s $(which zsh) $(whoami)

pinfo ">> Linking dotfiles:"

pinfo "  >> zsh"
ln -sf "${dotRoot}/zsh" ~/.config/zsh
ln -sf "${dotRoot}/zsh/.zshenv" ~/.zshenv

pinfo "  >> neovim"
ln -sf "${dotRoot}/nvim" ~/.config/nvim

pinfo "  >> eza"
ln -sf "${dotRoot}/eza" ~/.config/eza

pinfo "  >> wezterm"
ln -sf "${dotRoot}/wezterm" ~/.config/wezterm

pinfo "  >> hushlogin"
touch ~/.hushlogin

pinfo "Setup complete."

# TODO Install deps: uv
