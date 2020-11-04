#!/bin/bash

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

cd ~/projects

git clone https://github.com/GasparVardanyan/urxvt-extensions.git
cd urxvt-extensions
sudo chmod -R 777 .
cd urxvt-extensions/cd 1\ -\ defaults\ @\ 20190901

mkdir ~/.urxvt/ext
cp matcher ~/.urxvt/ext
cp selection-pastebin ~/.urxvt/ext
cd ~/projects/urxvt-perls/deprecated
cp url-select ~/.urxvt/ext
cp clipboard ~/.urxvt/ext
cd ..
cp keyboard-select ~/.urxvt/ext
sudo chmod -R 777 ~/.urxvt
