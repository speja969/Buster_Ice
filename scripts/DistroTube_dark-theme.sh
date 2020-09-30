#!/bin/bash
# ACTION: Install DistroTube dark-theme
# INFO: Install DistroTube dark-theme
# DEFAULT: y

sudo apt update && sudo apt upgrade

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

mkdir ~/.themes          #ako već ne postoji
sudo chown $USER:$USER ~/.themes
sudo chmod 777 ~/.themes
cd ~/.themes
git clone https://gitlab.com/dwt1/dt-dark-theme.git 
