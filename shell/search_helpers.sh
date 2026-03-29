deepsearch() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: deepsearch <pattern>" >&2
    return 1
  fi
  grep -RIn -- "$1" .
}

deepword() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: deepword <pattern>" >&2
    return 1
  fi
  grep -RInw -- "$1" .
}
alias peyda='locate -b'
