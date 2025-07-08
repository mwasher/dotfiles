export PATH=$HOME/.local/bin:$PATH
export VISUAL=vim
export EDITOR=$VISUAL

case "$(uname -s)" in
  Darwin)
    export EZA_CONFIG_DIR=~/.config/eza
	  ;;

  Linux)
  	;;
esac
