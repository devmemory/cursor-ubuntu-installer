#!/bin/bash
set -e

SCRIPT_DIR="$(dirname "$0")"

usage() {
  echo "Usage: $0 {install|uninstall}"
  exit 1
}

case "$1" in
  install)
    bash "$SCRIPT_DIR/install.sh"
    ;;
  uninstall)
    bash "$SCRIPT_DIR/uninstall.sh"
    ;;
  *)
    usage
    ;;
esac