#!/bin/bash
set -e

INSTALL_DIR="/opt/cursor-ai"
DESKTOP_FILE="/usr/share/applications/cursor.desktop"

echo "🧹 Uninstalling Cursor AI..."

if [ -d "$INSTALL_DIR" ]; then
  echo "❌ Removing installation directory $INSTALL_DIR ..."
  sudo rm -rf "$INSTALL_DIR"
else
  echo "ℹ️ Installation directory not found."
fi

if [ -f "$DESKTOP_FILE" ]; then
  echo "🗑️ Removing desktop launcher..."
  sudo rm -f "$DESKTOP_FILE"
else
  echo "ℹ️ Desktop launcher not found."
fi

echo "✅ Cursor AI has been completely uninstalled."