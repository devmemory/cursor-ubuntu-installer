# Cursor AI Ubuntu Installer
This repository contains scripts to install and uninstall Cursor AI on Ubuntu.

## Structure

- `assets/`
  - `manifest.env`: URLs for AppImage and icon (editable)
  - `cursor.png`: Icon file
- `scripts/`
  - `install.sh`: Install script
  - `uninstall.sh`: Uninstall script

## Requirements

- Ubuntu with `curl` and `sudo` installed
- Please manually install `libfuse2` and `curl` packages before running install script:
```
sudo apt update
sudo apt install libfuse2 curl
```

## How to use
### install
```
curl -fsSL https://raw.githubusercontent.com/devmemory/cursor-ubuntu-sell/main/scripts/cursor.sh | sudo bash -s -- install
```

### uninstall
```
curl -fsSL https://raw.githubusercontent.com/devmemory/cursor-ubuntu-sell/main/scripts/cursor.sh | sudo bash -s -- uninstall
```