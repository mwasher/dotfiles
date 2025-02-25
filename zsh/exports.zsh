export PATH=$HOME/.local/bin:$PATH

export VIRTUAL_ENV_DISABLE_PROMPT=1
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml

export EDITOR="nvim"

case "$(uname -s)" in
  Darwin)
	  ;;

  Linux)
  	;;
esac
