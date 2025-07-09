#!/bin/bash
set -e

INSTALL_DIR="/opt/cursor-ai"
TEMP_DIR="$HOME/.cache/cursor-ai"
MANIFEST_URL="https://raw.githubusercontent.com/devmemory/cursor-ubuntu-installer/main/assets/manifest.env"
MANIFEST_PATH="$TEMP_DIR/manifest.env"
DESKTOP_FILE="/usr/share/applications/cursor.desktop"

echo "🚀 Installing Cursor AI..."

# Check required commands
for cmd in curl sudo; do
  if ! command -v $cmd &>/dev/null; then
    echo "❌ Required command '$cmd' not found. Please install it before running this script."
    exit 1
  fi
done

# Check libfuse2 or libfuse2t64 presence
if ! dpkg -s libfuse2 >/dev/null 2>&1 && ! dpkg -s libfuse2t64 >/dev/null 2>&1; then
  echo "⚠️ Neither 'libfuse2' nor 'libfuse2t64' is installed."
  echo "Please install one before continuing:"
  echo "  sudo apt update"
  echo "  sudo apt install libfuse2"
  echo "or"
  echo "  sudo apt install libfuse2t64"
  echo
fi

echo "⚠️ Please ensure 'libfuse2' and 'curl' are installed manually before continuing."
echo

mkdir -p "$TEMP_DIR"

echo "⬇️ Downloading manifest file..."
curl -fsSL "$MANIFEST_URL" -o "$MANIFEST_PATH" || { echo "❌ Failed to download manifest file"; exit 1; }

source "$MANIFEST_PATH"

if [ -z "$APPIMAGE_URL" ] || [ -z "$ICON_URL" ]; then
  echo "❌ APPIMAGE_URL or ICON_URL not set in manifest file"
  exit 1
fi

echo "📂 Creating installation directory..."
sudo mkdir -p "$INSTALL_DIR"

echo "⬇️ Downloading Cursor AppImage from $APPIMAGE_URL ..."
curl -L "$APPIMAGE_URL" -o "$TEMP_DIR/cursor.appimage" || { echo "❌ Failed to download Cursor AppImage"; exit 1; }

echo "🎨 Downloading icon from $ICON_URL ..."
curl -L "$ICON_URL" -o "$TEMP_DIR/cursor.png" || { echo "❌ Failed to download icon"; exit 1; }

echo "📂 Moving files to $INSTALL_DIR ..."
sudo mv "$TEMP_DIR/cursor.appimage" "$INSTALL_DIR/"
sudo mv "$TEMP_DIR/cursor.png" "$INSTALL_DIR/"

echo "🔧 Setting permissions..."
sudo chmod +x "$INSTALL_DIR/cursor.appimage"
sudo chmod 644 "$INSTALL_DIR/cursor.png"

echo "🖥️ Creating desktop launcher..."
sudo tee "$DESKTOP_FILE" > /dev/null <<EOF
[Desktop Entry]
Name=Cursor AI
Comment=AI Code Editor
Exec=$INSTALL_DIR/cursor.appimage --no-sandbox
Icon=$INSTALL_DIR/cursor.png
Type=Application
Categories=Development;IDE;
Terminal=false
EOF

sudo chmod +x "$DESKTOP_FILE"

echo "🧹 Cleaning up temporary files..."
rm -rf "$TEMP_DIR"

echo "✅ Installation complete! You can now launch Cursor AI from the app menu."