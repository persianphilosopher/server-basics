alias myports='ss -tulpn'

portgrep() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: portgrep <port-or-pattern>" >&2
    return 1
  fi
  ss -tulpn | grep -i -- "$1"
}
