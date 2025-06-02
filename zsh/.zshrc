unsetopt BEEP

# Set cursor to blinking block
echo -ne  '\e[1 q]'

# Platform specific
case "$(uname -s)" in
  Linux)
    # Load env variable exports
    [[ -f $ZDOTDIR/.dircolors ]]
      eval "$(dircolors $ZDOTDIR/.dircolors)"
  	;;

  Darwin)
    if command -v /opt/homebrew/bin/brew &> /dev/null; then
      eval $(/opt/homebrew/bin/brew shellenv)
    fi
	  ;;
esac

# Load env variable exports
[[ -f $ZDOTDIR/exports.zsh ]] && source $ZDOTDIR/exports.zsh 

# Load aliases
[[ -f $ZDOTDIR/aliases.zsh ]] && source $ZDOTDIR/aliases.zsh

# Load custom functions
[[ -f $ZDOTDIR/helpers.zsh ]] && source $ZDOTDIR/helpers.zsh

# Load local config if present
[[ -f $ZDOTDIR/.zlocal ]] && source $ZDOTDIR/.zlocal

# Create directory for local installed tools
mkdir -p $HOME/.local/bin

# Prompt configuration
setopt PROMPT_SUBST

function __git_prompt () {
    local ref
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref=$(git rev-parse --short HEAD 2> /dev/null) || return 0

    local STATUS
    local -a FLAGS

    FLAGS=('--porcelain')

    if [[ "${DISABLE_UNTRACKED_FILES_DIRTY:-}" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi

    case "${GIT_STATUS_IGNORE_SUBMODULES:-}" in
      (git)  ;;
      (*) FLAGS+="--ignore-submodules=${GIT_STATUS_IGNORE_SUBMODULES:-dirty}"  ;;
    esac

    STATUS=$(git status ${FLAGS} 2> /dev/null | tail -n1)

    if [[ -n $STATUS ]]; then
      echo "%F{red}[%F{purple} ${ref#refs/heads/}%F{red}]%f "
    else
      echo "%F{green}[%F{purple} ${ref#refs/heads/}%F{green}]%f "
    fi

}

export VIRTUAL_ENV_DISABLE_PROMPT=1

function __virtualenv_prompt {
    if [[ -z "${VIRTUAL_ENV}" ]]; then
      echo
    else
      echo "%F{green}${VIRTUAL_ENV:+[ ${VIRTUAL_ENV##*/}]}%f "
    fi
}

PROMPT="%(?:%F{purple}➤:%F{red}!%?)%f %F{magenta}%m%f:%F{purple}%~%f "
PROMPT+="\$(__git_prompt)"
PROMPT+="\$(__virtualenv_prompt)"

# Fix keycodes
bindkey -v
bindkey "^[[H"  beginning-of-line
bindkey "^[[F"  end-of-line
bindkey "^[[3~" delete-char
bindkey "^R"    history-incremental-search-backward

# Configure persistent history
HISTFILE=$ZDOTDIR/.zhistory
HISTSIZE=4096
HISTFILESIZE=4096
SAVEHIST=4096
setopt EXTENDED_HISTORY
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

# ZSH plugins to use, will be autoloaded below
plugins=(
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
)

# ZSH plugin configurations
function zvm_config() {
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  ZVM_VI_HIGHLIGHT_FOREGROUND=black
  ZVM_VI_HIGHLIGHT_BACKGROUND=white
  ZVM_INIT_MODE=sourcing
}

# Enable completions
autoload -Uz compinit
compinit -i

# Set auto suggest completion to ctrl-space
bindkey '^ ' autosuggest-accept

# Load the plugins
plugin-load $plugins

# Disable underlines of zsh paths in command input
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Source FZF and install for ZSH
fzf_path="$HOME/.local/share/fzf"
if [[ ! -d $fzf_path ]]; then
  echo "Cloning FZF..."
  git clone --quiet --depth 1 https://github.com/junegunn/fzf.git $fzf_path
  $fzf_path/install --key-bindings --completion --no-update-rc --no-bash --no-zsh
  ln -s $fzf_path/bin/fzf $HOME/.local/bin/fzf
  source $fzf_path/shell/completion.zsh
  source $fzf_path/shell/key-bindings.zsh
else
  source $fzf_path/shell/completion.zsh
  source $fzf_path/shell/key-bindings.zsh
fi

# Configure FZF
if [[ -d $fzf_path ]]; then
  export FZF_DEFAULT_OPTS="--height 20% --layout reverse --border top"
  export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
fi

# Kubernetes completions
if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
fi

# uv completions
if command -v uv &> /dev/null; then
  eval "$(uv generate-shell-completion zsh)"
fi

. "$HOME/.local/share/../bin/env"
