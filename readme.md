## 🔧 What This Project Does

This shell script automates the installation of the Cursor AI code editor on Ubuntu. Here's what it does step by step:

1. **Fetch the Latest Version**  
   Retrieves the latest Cursor AI version and download URL from a public JSON file.

2. **Download Files**  
   Downloads the Cursor AppImage and icon into a temporary directory.

3. **Install to System Directory**  
   Moves the AppImage and icon to `/opt/cursor-ai` for centralized access.

4. **Set Permissions**  
   Applies the appropriate permissions to ensure the app runs smoothly and securely.

5. **Create Desktop Shortcut**  
   Generates a `.desktop` launcher file so Cursor AI appears in your app menu like a native app.


## Structure

- `assets/`
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
curl -fsSL https://raw.githubusercontent.com/devmemory/cursor-ubuntu-installer/main/scripts/cursor.sh | sudo bash -s -- install
```

### uninstall
```
curl -fsSL https://raw.githubusercontent.com/devmemory/cursor-ubuntu-installer/main/scripts/cursor.sh | sudo bash -s -- uninstall
```


## Data Source and License
The version information JSON used in this project is sourced from https://github.com/oslook/cursor-ai-downloads/tree/main repository, which is licensed under the MIT License.
