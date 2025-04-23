install_neovim() {
  pinfo "  >> neovim"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar neovim
      ;;
    ubuntu)
      ;;
    redhat)
      ;;
    macos)
      ;;
  esac
}

install_ripgrep() {
  pinfo "  >> ripgrep"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar ripgrep
      ;;
    ubuntu)
      ;;
    redhat)
      ;;
    macos)
      ;;
  esac
}

install_eza() {
  pinfo "  >> eza"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar eza
      ;;
    ubuntu)
      ;;
    redhat)
      ;;
    macos)
      ;;
  esac
}

install_bat() {
  pinfo "  >> bat"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar bat
      ;;
    ubuntu)
      ;;
    redhat)
      ;;
    macos)
      ;;
  esac
}

install_fd() {
  pinfo "  >> fd"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar fd
      ;;
    ubuntu)
      ;;
    redhat)
      ;;
    macos)
      ;;
  esac
}

install_uv() {
  pinfo "  >> uv"

  case $arch in
    arch)
      user_cmd "curl -LsSf https://astral.sh/uv/install.sh | sh"
      ;;
    ubuntu)
      ;;
    redhat)
      ;;
    macos)
      ;;
  esac

  verify_install "uv" "uv" $?
}

install_zsh() {
  pinfo ">> Installing zsh"

  case $arch in
    arch)
      sudo_cmd pacman -S --noconfirm --noprogressbar zsh
      ;;
    ubuntu)
      ;;
    redhat)
      ;;
    macos)
      ;;
  esac

  verify_install "zsh" "zsh" $?

  pinfo ">> Setting login shell"
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
}
