#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CURRENT_USER="$(id -un)"

echo "server-basics start"
echo "Current user: $CURRENT_USER"
echo

if [[ ! -x "$REPO_ROOT/scripts/bootstrap-user" ]]; then
  echo "Missing executable: scripts/bootstrap-user" >&2
  exit 1
fi

if [[ ! -x "$REPO_ROOT/scripts/init" ]]; then
  echo "Missing executable: scripts/init" >&2
  exit 1
fi

if [[ "$CURRENT_USER" == "root" ]]; then
  echo "You are logged in as root."
  echo "Bootstrapping a real admin user first..."
  echo
  "$REPO_ROOT/scripts/bootstrap-user"
  echo
  echo "Now log in as the new user and run:"
  echo "  ./start.sh"
  exit 0
fi

read -r -p "Create a new admin user before continuing? [y/N] " CREATE_USER
CREATE_USER="${CREATE_USER:-N}"

if [[ "$CREATE_USER" =~ ^[Yy]$ ]]; then
  echo
  sudo "$REPO_ROOT/scripts/bootstrap-user"
  echo
  echo "Now log in as the new user and run:"
  echo "  ./start.sh"
  exit 0
fi

echo "Continuing with init for user: $CURRENT_USER"
echo
"$REPO_ROOT/scripts/init"
