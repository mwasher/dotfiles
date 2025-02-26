alias ls="ls --color=auto"
alias grep="grep --color=auto"

alias aenv="source .venv/bin/activate"

alias vis="vim -S ~/.session.vim"

case "$(uname -s)" in
  Darwin)
	  ;;

  Linux)
  	;;
esac

if command -v nvim &> /dev/null; then
  alias vi="nvim"
  alias vim="nvim"
fi

if command -v bat &> /dev/null; then
  alias cat="bat --theme \"ansi\"" 
  alias catp="bat -p --theme \"ansi\"" 
fi

if command -v eza &> /dev/null; then
  alias ls="eza --group"
fi

