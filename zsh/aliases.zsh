alias ls='ls --color=auto'
alias grep='grep --color=auto'

case "$(uname -s)" in
  Darwin)
	  ;;

  Linux)
  	;;
esac

if command -v nvim &> /dev/null; then
    alias vi='nvim'
    alias vim='nvim'
fi

if command -v bat &> /dev/null; then
  alias cat="bat --theme \"Visual Studio Dark+\"" 
fi
