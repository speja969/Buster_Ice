#!/bin/bash
       
sudo apt-get -y install compton compton-conf

cp ~/Baster_Pejax/dotfiles/compton.conf ~/.config/
mkdir ~/bin
cp ~/Baster_Pejax/dotfiles/start-compton.sh ~/bin/


