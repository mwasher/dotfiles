export PATH=$HOME/.local/bin:$PATH
export GOPATH=$HOME/.go
export VISUAL=vim
export EDITOR=$VISUAL

case "$(uname -s)" in
  Darwin)
    export EZA_CONFIG_DIR=~/.config/eza
	  ;;

  Linux)
  	;;
esac
