#!/bin/bash
# This script will download and install the BoehMod launcher and its
# dependencies on your Debian (or derivative) system.

# pass '--arch' to use pacman instead of apt

set -e

echo "Installing dependencies NPM and git..."
if [ "$1" = "--arch" ]; then
 sudo pacman -S npm git
else
 sudo apt -qqq install npm git
fi
echo "Done."

echo "Cloning the GitHub repository..."
git clone https://github.com/BoehMod/BoehMod-Launcher
echo "Done."

cd "$PWD"/ElectronLauncher

echo "Installing the launcher (Grabbing Node and Electron modules)..."
npm -qqq install
echo "Done."

SCRIPT="$HOME/Desktop/boehmodlauncher.sh"

echo "Creating run script..."
touch "$SCRIPT"
echo "#!/bin/bash" >> "$SCRIPT"
echo "cd $PWD" >> "$SCRIPT"
echo "npm start" >> "$SCRIPT"
chmod +x "$SCRIPT"
echo "Done."
