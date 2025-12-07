#!/bin/bash

set -e

echo "=== Installing devkitPro keyring ==="
sudo apt update
sudo apt install -y ca-certificates gnupg

# Add devkitPro APT key safely (no apt-key)
curl -fsSL https://apt.devkitpro.org/devkitpro-keyring.gpg | sudo tee /usr/share/keyrings/devkitpro.gpg >/dev/null

echo "deb [signed-by=/usr/share/keyrings/devkitpro.gpg] https://apt.devkitpro.org/ $(lsb_release -cs) main" | \
  sudo tee /etc/apt/sources.list.d/devkitpro.list

echo "=== Installing devkitPro packages ==="
sudo apt update
sudo apt install devkitpro-pacman -y

# Reload env
source /etc/profile.d/devkit-env.sh

echo "=== Updating pacman and installing toolchains ==="
sudo dkp-pacman -Syu --noconfirm

echo "=== Installing Nintendo Switch tools & portlibs ==="
sudo dkp-pacman -S --noconfirm switch-dev switch-portlibs

echo "=== Installing 3DS tools & portlibs ==="
sudo dkp-pacman -S --noconfirm 3ds-dev 3ds-portlibs

echo "=== Installing Wii U tools & portlibs ==="
sudo dkp-pacman -S --noconfirm wiiu-dev wiiu-portlibs

echo "=== DONE! ==="
echo "devkitPro toolchains installed for:"
echo "  - Nintendo Switch"
echo "  - Nintendo 3DS"
echo "  - Wii U"
echo ""
echo "Make sure to log out and back in to refresh environment variables."
