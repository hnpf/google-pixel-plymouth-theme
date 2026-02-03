#!/bin/bash

# root elevation
if [ "$EUID" -ne 0 ]; then 
  sudo bash "$0" "$@"
  exit $?
fi

echo "Installing gemini-pixel for Plymouth!"

THEME_NAME="gemini-pixel"
THEME_DIR="/usr/share/plymouth/themes/$THEME_NAME"

if [ ! -d "$THEME_NAME" ]; then
    echo "Failed: $THEME_NAME folder not found. Run this from the repo root."
    exit 1
fi

mkdir -p "$THEME_DIR"
cp -r "$THEME_NAME/"* "$THEME_DIR/"
echo "Files dumped into $THEME_DIR"
if command -v plymouth-set-default-theme &> /dev/null; then
    plymouth-set-default-theme -R "$THEME_NAME"
    echo "Theme active: $THEME_NAME"
else
    echo "Plymouth was not found. Please install it first."
    exit 1
fi
echo "Rebuilding initrd..."
if [ -f /etc/arch-release ]; then
    echo "Hello, Arch user! Rebuilding..."
    mkinitcpio -P
elif [ -f /etc/debian_version ]; then
    echo "Hello, Debian/Ubuntu user! Rebuilding..."
    update-initramfs -u
elif [ -f /etc/fedora-release ]; then
    echo "Hello, Fedora user! Rebuilding..."
    dracut --force
else
    echo "Distro is unknown. Please manually rebuild your initramfs/initrd."
fi

echo ""
echo "All done!! If your system boots too fast (suffering from success), you can speed up the script in $THEME_DIR."
