pathadd() {
  local dir="${1:-}"
  if [[ -n "$dir" && -d "$dir" && ":$PATH:" != *":$dir:"* ]]; then
    export PATH="$dir:$PATH"
  fi
}
