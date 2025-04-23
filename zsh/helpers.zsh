# Generate prompt string for git details
function git_current_branch() {
  # Pull out the name of the current git branch if in a repo
  git_branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/";} {print $NF;}')

  # Determine if all changes are committed or not
  if [[ -z $(git status -s 2> /dev/null) ]]; then
    git_dirty="%F{green}o%f"
  else
    git_dirty="%F{red}x%f"
  fi

  # If we are in a git repo then form the prompt string to use later
  if [[ ! -z $git_branch ]]; then
    echo " [%F{blue}$git_branch%f|$git_dirty]"
  fi
}

# Simple zsh plugin management
function plugin-load {
  local repo plugdir initfile initfiles=()
  ZPLUGINDIR="$ZDOTDIR/plugins"
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules \
        https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) || { echo >&2 "No init file found '$repo'." && continue }
      ln -sf $initfiles[1] $initfile
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}
