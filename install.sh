#!/bin/bash

echo "=== Pop!_OS Visual Setup Installer ==="

# Install system packages
sudo apt update
sudo apt install -y gnome-tweaks gnome-shell-extensions dconf-cli curl unzip jq

# Enable all listed GNOME extensions
EXTENSIONS=(
  "transparent-top-bar@ftpix.com"
  "compiz-windows-effect@hermes83.github.com"
  "compiz-alike-magic-lamp-effect@hermes83.github.com"
  "just-perfection-desktop@just-perfection"
  "dash-to-dock@micxgx.gmail.com"
  "CustomizeClockOnLockScreen@pratap.fastmail.fm"
  "extension-list@tu.berry"
  "blur-my-shell@aunetx"
  "cosmic-dock@system76.com"
  "cosmic-workspaces@system76.com"
  "ding@rastersoft.com"
  "pop-cosmic@system76.com"
  "pop-shell@system76.com"
  "popx11gestures@system76.com"
  "system76-power@system76.com"
  "ubuntu-appindicators@ubuntu.com"
)

echo "Enabling extensions..."
for ext in "${EXTENSIONS[@]}"; do
    gnome-extensions enable "$ext" 2>/dev/null || echo "Extension $ext not installed yet."
done

# Restore GNOME settings
if [ -f "popos-setup.dconf" ]; then
  echo "Loading GNOME settings..."
  dconf load / < popos-setup.dconf
else
  echo "Settings file not found!"
fi

echo "🎉 Done! Reboot your system to apply all changes."
