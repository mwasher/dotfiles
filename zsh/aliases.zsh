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
  alias cat="bat --theme=ansi" 
  alias catp="bat -p --theme=ansi" 
elif command -v batcat &> /dev/null; then
  alias catp="batcat -p --theme=ansi" 
  alias cat="batcat --theme=ansi" 
fi

if command -v eza &> /dev/null; then
  alias ls="eza -gb --icons=always --group-directories-last --git" 
fi

if command -v fzf &> /dev/null; then
  alias fz="fzf --preview \"bat --style=numbers --color=always --theme=ansi {}\""
fi
