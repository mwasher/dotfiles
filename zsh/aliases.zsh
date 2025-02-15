alias ls="ls --color=auto"
alias grep="grep --color=auto"

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

alias cat="bat --theme \"ansi\"" 
alias catp="bat -p --theme \"ansi\"" 

