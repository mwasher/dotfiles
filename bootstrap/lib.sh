C_RED="\033[0;31m"
C_GREEN="\033[0;32m"
C_YELLOW="\033[0;33m"
C_BLUE="\033[0;34m"
C_RESET="\033[0m"

ptask() {
  echo -e "${C_BLUE}$1${C_RESET}"
}

pinfo() {
  echo -e "${C_GREEN}$1${C_RESET}"
}

pwarn() {
  echo -e "${C_YELLOW}$1${C_RESET}"
}

perror() {
  echo -e "${C_RED}$1${C_RESET}"
}

sudo_init() {
  sudo -nv 2>/dev/null && return

  sudo -vp "Enter sudo password: "
  retval=$?

  if [[ $retval -ne 0 ]]; then
    perror "Invalid sudo password provided."
  fi

  return $retval
}

sudo_cmd() {
  sudo_init || exit 1

  echo >> $logFile
  echo "$(date -u)" >> $logFile
  sudo "$@" &> $logFile

  return $?
}

user_cmd() {
  echo >> $logFile
  echo "$(date -u)" >> $logFile
  eval "$@" &> $logFile

  return $?
}
