C_RED="\033[0;31m"
C_GREEN="\033[0;32m"
C_YELLOW="\033[0;33m"
C_RESET="\033[0m"

pinfo() {
  echo "${C_GREEN}$1${C_RESET}"
}

pwarn() {
  echo "${C_YELLOW}$1${C_RESET}"
}

perror() {
  echo "${C_RED}$1${C_RESET}"
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
  sudo "$@" &>> $logFile

  return $?
}

user_cmd() {
  echo >> $logFile
  echo "$(date -u)" >> $logFile
  eval "$@" &>> $logFile

  return $?
}
