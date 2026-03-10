#!/usr/bin/env bash

# Load custom dircolors if available

BASICS_ROOT="${BASICS_ROOT:-$HOME/server-basics}"
DIRCOLORS_FILE="$BASICS_ROOT/config/dircolors"

if [[ -f "$DIRCOLORS_FILE" ]]; then
  eval "$(dircolors -b "$DIRCOLORS_FILE")"
else
  eval "$(dircolors -b)"
fi
