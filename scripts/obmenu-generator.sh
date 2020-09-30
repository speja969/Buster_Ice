#!/bin/bash

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

echo 'deb http://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/home:Head_on_a_Stick:obmenu-generator.list

sudo sed -i 's!deb http://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_10/ /!deb [trusted=yes] http://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_10/ /!' /etc/apt/sources.list.d/home:Head_on_a_Stick:obmenu-generator.list

curl -fsSL https://download.opensuse.org/repositories/home:Head_on_a_Stick:obmenu-generator/Debian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home:Head_on_a_Stick:obmenu-generator.gpg > /dev/null

sudo apt update

sudo apt install -y obmenu-generator

obmenu-generator -s -i

obmenu-generator -p -i

sed -i 's!xterm!terminator!' ~/.config/obmenu-generator/schema.pl

sed -i 's!~/.config/openbox/autostart!~/.config/openbox/autostart.sh!' ~/.config/obmenu-generator/schema.pl

sed -i 's!{exit!#{exit!' ~/.config/obmenu-generator/schema.pl

sudo sed -i 's_# {item_{item_g;s/oblogout/obsession-logout/g' ~/.config/obmenu-generator/schema.pl

sed -i 's!xterm!terminator!' ~/.config/obmenu-generator/config.pl	


sed -i 's!<showIcons>no</showIcons>!<showIcons>yes</showIcons>!' ~/.config/openbox/rc.xml
