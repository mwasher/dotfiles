export EDITOR="nvim"

export PATH=$HOME/.local/bin:$PATH

if [ -d "$HOME/.pyenv" ]; then
  export PATH=$HOME/.pyenv/bin:$PATH
fi

export VIRTUAL_ENV_DISABLE_PROMPT=1
export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml

case "$(uname -s)" in
  Darwin)
	  ;;

  Linux)
  	;;
esac
