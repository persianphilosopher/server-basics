#!/usr/bin/env bash

# detect architecture
detect_arch() {
  local arch
  arch=$(uname -m)

  case "$arch" in
    *64*) PERMIT=64 ;;
    *86*) PERMIT=86 ;;
    *arm*) PERMIT=314 ;;
    *)
      echo "Unknown architecture: $arch" >&2
      return 1
      ;;
  esac
}

require_linux() {
  local system
  system=$(uname -s | tr '[:upper:]' '[:lower:]')

  if [[ "$system" != "linux" ]]; then
    echo "This script requires Linux." >&2
    return 1
  fi
}
