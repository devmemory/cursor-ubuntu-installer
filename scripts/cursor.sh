#!/bin/bash
set -e

usage() {
  echo "Usage: $0 {install|uninstall}"
  exit 1
}

SCRIPT_BASE_URL="https://raw.githubusercontent.com/devmemory/cursor-ubuntu-installer/main/scripts"

case "$1" in
  install)
    curl -fsSL "$SCRIPT_BASE_URL/install.sh" | sudo bash
    ;;
  uninstall)
    curl -fsSL "$SCRIPT_BASE_URL/uninstall.sh" | sudo bash
    ;;
  *)
    usage
    ;;
esac
