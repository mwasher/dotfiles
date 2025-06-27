install_neovim() {
  pinfo "  >> neovim"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar neovim
      ;;
    ubuntu)
      user_cmd curl -o $HOME/.local/bin/nvim -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
      user_cmd chmod +x $HOME/.local/bin/nvim 
      ;;
    redhat)
      ;;
    macos)
      user_cmd brew install neovim
      ;;
  esac

  verify_install "neovim" "nvim" $?
}

install_git() {
  pinfo "  >> git"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar git
      ;;
    ubuntu)
      sudo_cmd apt install -y git
      ;;
    redhat)
      ;;
    macos)
      user_cmd brew install git
      ;;
  esac

  verify_install "git" "git" $?
}

install_gcc() {
  pinfo "  >> gcc"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar gcc
      ;;
    ubuntu)
      sudo_cmd apt install -y gcc
      ;;
    redhat)
      ;;
    macos)
      user_cmd brew install gcc
      ;;
  esac

  verify_install "gcc" "gcc" $?
}

install_go() {
  pinfo "  >> go"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar go
      ;;
    ubuntu)
      ;;
    redhat)
      ;;
    macos)
      user_cmd brew install go
      ;;
  esac

  verify_install "go" "go" $?
}

install_ripgrep() {
  pinfo "  >> ripgrep"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar ripgrep
      ;;
    ubuntu)
      sudo_cmd apt install -y ripgrep
      ;;
    redhat)
      ;;
    macos)
      user_cmd brew install ripgrep
      ;;
  esac

  verify_install "ripgrep" "rg" $?
}

install_eza() {
  pinfo "  >> eza"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar eza
      ;;
    ubuntu)
      user_cmd curl -o /tmp/eza.tar.gz -L https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz
      user_cmd tar -C $HOME/.local/bin -xzf /tmp/eza.tar.gz
      user_cmd rm -f /tmp/eza.tar.gz
      ;;
    redhat)
      ;;
    macos)
      user_cmd brew install eza
      ;;
  esac

  verify_install "eza" "eza" $?
}

install_bat() {
  pinfo "  >> bat"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar bat
      command="bat"
      ;;
    ubuntu)
      sudo_cmd apt install -y bat
      command="batcat"
      ;;
    redhat)
      ;;
    macos)
      user_cmd brew install bat
      ;;
  esac

  verify_install "bat" command $?
}

install_fd() {
  pinfo "  >> fd"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar fd
      ;;
    ubuntu)
      sudo_cmd apt install -y fd-find
      sudo_cmd ln -sf $(which fdfind) /usr/bin/fd
      ;;
    redhat)
      ;;
    macos)
      user_cmd brew install fd
      ;;
  esac

  verify_install "fd" "fd" $?
}

install_uv() {
  pinfo "  >> uv"

  case $arch in
    arch)
      user_cmd "curl -LsSf https://astral.sh/uv/install.sh | sh"
      ;;
    ubuntu)
      sudo_cmd apt install -y python3-venv
      user_cmd "curl -LsSf https://astral.sh/uv/install.sh | sh"
      ;;
    redhat)
      ;;
    macos)
      user_cmd brew install uv
      ;;
  esac

  verify_install "uv" "uv" $?
}

install_nodejs() {
  pinfo "  >> nodejs"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar nodejs npm
      ;;
    ubuntu)
      sudo_cmd apt install -y --no-install-recommends nodejs npm
      ;;
    redhat)
      ;;
    macos)
      user_cmd brew install nodejs
      ;;
  esac

  verify_install "nodejs" "node" $?
  verify_install "npm" "npm" $?
}

install_starship() {
  pinfo "  >> starship"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar starship
      ;;
    ubuntu)
      ;;
    redhat)
      ;;
    macos)
      user_cmd brew install starship
      ;;
  esac

  verify_install "starship" "starship" $?
}

install_zsh() {
  ptask ">> Installing zsh"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar zsh
      ;;
    ubuntu)
      sudo_cmd apt install -y zsh
      ;;
    redhat)
      ;;
    macos)
      ;;
  esac

  verify_install "zsh" "zsh" $?

  ptask ">> Setting login shell"
  sudo_cmd chsh -s $(which zsh) $(whoami)
}

verify_install() {
  package=$1
  command=$2
  retval=$3

  if [[ $retval -ne 0 ]]; then
    perror "Failed to install '${package}' for '${arch}'"
    exit $retval
  fi

  if ! command -v $command &> /dev/null; then
    pwarn "'${command}' not found in path"
  fi
}

install_dotfiles() {
  ptask ">> Linking dotfiles:"

  pinfo "  >> zsh"
  ln -snf "${dotRoot}/zsh" ~/.config/zsh
  ln -snf "${dotRoot}/zsh/.zshenv" ~/.zshenv

  pinfo " >> starship"
  ln -snf "${dotRoot}/starship/starship.toml" ~/.config/starship.toml

  pinfo "  >> neovim"
  ln -snf "${dotRoot}/nvim" ~/.config/nvim

  pinfo "  >> eza"
  ln -snf "${dotRoot}/eza" ~/.config/eza

  pinfo "  >> wezterm"
  ln -snf "${dotRoot}/wezterm" ~/.config/wezterm

  pinfo "  >> hushlogin"
  touch ~/.hushlogin
}
