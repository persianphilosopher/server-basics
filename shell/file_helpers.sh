#!/usr/bin/env bash

extract() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: extract <archive>"
    return 1
  fi

  for n in "$@"; do
    if [[ ! -f "$n" ]]; then
      echo "'$n' - file does not exist"
      continue
    fi

    case "$n" in
      *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
        tar xvf "$n"
        ;;
      *.bz2)
        bunzip2 "$n"
        ;;
      *.rar)
        unrar x "$n"
        ;;
      *.gz)
        gunzip "$n"
        ;;
      *.zip)
        unzip "$n"
        ;;
      *.7z)
        7z x "$n"
        ;;
      *.xz)
        unxz "$n"
        ;;
      *)
        echo "extract: '$n' - unknown archive format"
        ;;
    esac
  done
}

femd5() {
  printf '%s' "$1" | md5sum | cut -d ' ' -f1
}
