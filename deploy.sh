mkdir -p $HOME/.config
mkdir -p $HOME/.local
mkdir -p $HOME/.cache

cd "$(dirname $0)"
dotRoot=$(pwd -P)
logFile="${dotRoot}/deploy.log"

source "bootstrap/lib.sh"

if [[ $(grep -sE '^NAME='  /etc/os-release) =~ "Arch" ]]; then
  source "bootstrap/arch.sh"
elif [[ $(grep -sE '^NAME='  /etc/os-release) =~ "Ubuntu" ]]; then
  source "bootstrap/ubuntu.sh"
elif [[ $(grep -sq "Red Hat" /etc/redhat-release) ]]; then
  source "bootstrap/redhat.sh"
elif [[ $(uname -a 2>/dev/null) =~ "Darwin" ]]; then
  source "bootstrap/macos.sh"
else
  perror "ERROR: Distribution not found."
  exit 1
fi


