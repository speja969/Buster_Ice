#!/bin/bash

# Change to the /tmp directory
cd /tmp

# Clone the Git repository
git clone https://github.com/iamdh4/ttf-wps-fonts.git

# Create a sub directory in your system’s fonts directory. This is usually /usr/share/fonts
sudo mkdir /usr/share/fonts/wps-fonts

# Move fonts to the new directory
sudo mv ttf-wps-fonts/* /usr/share/fonts/wps-fonts

# Fix the file permissions
sudo chmod 644 /usr/share/fonts/wps-fonts/*

# Rebuild the font cache
sudo fc-cache -vfs

# Clean up the tmp directory.
rm -rf /tmp/ttf-wps-fonts
