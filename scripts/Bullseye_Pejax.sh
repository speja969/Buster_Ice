#!/bin/bash

sudo apt update && sudo apt -y upgrade

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

mkdir ~/.config

sudo chmod 777 ~/.config

mkdir ~/.config/openbox

mkdir ~/.config/tint2

mkdir ~/.scripts

sudo apt-get install -y software-properties-common && sudo apt-add-repository contrib && sudo apt-add-repository non-free

sudo apt-get update

sudo apt-get install -y openbox obmenu obconf rxvt-unicode micro mousepad compton compton-conf firefox-esr pcmanfm tint2 menu pulseaudio numlockx pavucontrol mlocate lxappearance vlc arandr apt-file synaptic firmware-linux firmware-linux-nonfree doublecmd-common xutils mesa-utils xarchiver htop disk-manager sysstat acpi hardinfo hddtemp wicd k3b i3lock aptitude gnome-disk-utility python3-pip python-pip ttf-mscorefonts-installer fonts-ubuntu fonts-ubuntu-console suckless-tools simplescreenrecorder font-manager ranger geany gdebi lightdm fbxkb mpv curl gmrun xscreensaver galternatives pnmixer sxiv scrot xsettingsd ffmpeg git qbittorrent wmctrl

cp ~/Bullseye_Pejax/dotfiles/tint2rc ~/.config/tint2

cp ~/Bullseye_Pejax/dotfiles/compton.conf ~/.config/

cp ~/Bullseye_Pejax/dotfiles/autostart.sh ~/.config/openbox

cp ~/Bullseye_Pejax/dotfiles/.Xresources ~/

cp ~/Bullseye_Pejax/dotfiles/rc.xml ~/.config/openbox

cp ~/Bullseye_Pejax/dotfiles/menu.xml ~/.config/openbox

cp ~/Bullseye_Pejax/dotfiles/keyboard.sh ~/

sudo cp ~/Bullseye_Pejax/dotfiles/rs.png /usr/share/fbxkb/images/rs.png

mkdir ~/.config/mpv

cp ~/Bullseye_Pejax/dotfiles/mpv.conf ~/.config/mpv

sudo cp ~/Bullseye_Pejax/dotfiles/ncmpcpp_48x48.png /usr/share/icons

sudo chmod 777 /usr/share/icons/ncmpcpp_48x48.png



# korekcija autorizacije za gdebi
sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.gdebi-gtk.policy


# korekcija autorizacije za synaptic
sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.synaptic.policy

# korekcija autorizacije za doublecmd
sudo sed -i 's/<allow_active>auth_admin_keep/<allow_active>yes/' /usr/share/polkit-1/actions/org.doublecmd.root.policy


sudo chmod --recursive 777 ~/.config/openbox
sudo chmod 777 ~/keyboard.sh

mkdir -p ~/Documents/DEB

## debinfo -- prikaz resursa pri otvaranju terminala
sudo cp ~/Bullseye_Pejax/scripts/debinfo /usr/bin
sudo chmod 777 /usr/bin/debinfo
echo debinfo >> ~/.bashrc

## instalacija comptona
cp ~/Bullseye_Pejax/scripts/install_compton.sh ~/.scripts
mkdir ~/bin
cp ~/Bullseye_Pejax/dotfiles/start-compton.sh ~/bin
sudo chmod --recursive 777 ~/bin

## instalacija ncmpcpp
sudo apt install -y mpd ncmpcpp
mkdir ~/.mpd
mkdir ~/.ncmpcpp
cp ~/Bullseye_Pejax/dotfiles/config ~/.ncmpcpp
cp ~/Bullseye_Pejax/dotfiles/mpd.conf ~/.mpd
touch ~/.mpd/mpd.db ~/.mpd/mpd.log ~/.mpd/mpd.pid
sudo chmod --recursive 777 ~/.mpd
sudo chmod --recursive 777 ~/.ncmpcpp
echo "Exec=x-terminal-emulator -T 'ncmpcpp' -e ncmpcpp" > /tmp/ncmpcpp_replacement
sudo sed -i "s/^.*Exec=ncmpcpp.*$/$(cat /tmp/ncmpcpp_replacement)/" /usr/share/applications/ncmpcpp.desktop
sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ncmpcpp.desktop
echo "Icon=/usr/share/icons/ncmpcpp_48x48.png" >> /usr/share/applications/ncmpcpp.desktop

## screeny
cp ~/Bullseye_Pejax/scripts/screeny ~/.scripts

## script for reinstall youtube-dl
cp ~/Bullseye_Pejax/scripts/reinstall_youtube-dl.sh ~/.scripts

## obmenu-generator
cp ~/Bullseye_Pejax/scripts/obmenu-generator.sh ~/.scripts

mkdir ~/projects
cd ~/projects
git clone https://github.com/speja969/debian-openbox.git

sudo chmod --recursive 777 ~/projects
sudo chmod --recursive 777 ~/.scripts

cd ~/projects/debian-openbox/10_openbox_terminator
sudo ./install.sh

cd ~/projects/debian-openbox/10_openbox_arc-theme-gtk
sudo ./install.sh

cd ~/projects/debian-openbox/10_openbox_numix-paper-icons
sudo ./install.sh

cd ~/projects/debian-openbox/install_wpsoffice
sudo ./install.sh

cd ~/projects/debian-openbox/script_install_dt-dark-theme
sudo ./install.sh

cd ~/projects/debian-openbox/10_openbox_conky
sudo ./install.sh

cd ~/projects/debian-openbox/config_shortcut-kill-x
sudo ./install.sh

# Copy wallpapers folderes
sudo cp -r ~/Bullseye_Pejax/WALLPAPERS/Wallpapers_Debian /usr/share/backgrounds
sudo cp -r ~/Bullseye_Pejax/WALLPAPERS/wallpapers-pixabay /usr/share/backgrounds

sudo sed -i 's!wallpapers-pack1!wallpapers-pixabay!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
sudo sed -i 's!bl-colorful-aptenodytes-forsteri-by-nixiepro.png!kuala-lumpur-1820944_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/install.sh
sudo sed -i 's!/usr/share/backgrounds/wallpapers-pack1/bl-colorful-aptenodytes-forsteri-by-nixiepro.png!/usr/share/backgrounds/wallpapers-pixabay/kuala-lumpur-1820944_1920.jpg!' ~/projects/debian-openbox/15_openbox_wallpaper-packs/bg-saved.cfg

# ACTION: Install nitrogen tool, copy more wallpapers pack and set default wallpaper to all users
cd ~/projects/debian-openbox/15_openbox_wallpaper-packs
sudo ./install.sh

sudo cp ~/Bullseye_Pejax/WALLPAPERS/Wallpapers_Debian/lightdm_login.jpg /usr/share/images/desktop-base
sudo chmod 777 /usr/share/images/desktop-base/lightdm_login.jpg
sudo sed -i 's!#background=!background=/usr/share/images/desktop-base/lightdm_login.jpg!' /etc/lightdm/lightdm-gtk-greeter.conf

sudo chmod --recursive 777 ~/.config/nitrogen

#sudo chown --recursive $USER:$USER .

## setting default text editor
xdg-mime default pcmanfm.desktop inode/directory


## settings htop.desktop & ranger.desktop files
echo "Exec=x-terminal-emulator -T 'htop task manager' -e htop" > /tmp/htop_replacement

sudo sed -i "s/^.*Exec=htop.*$/$(cat /tmp/htop_replacement)/" /usr/share/applications/htop.desktop

sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/htop.desktop

echo "Exec=x-terminal-emulator -T 'ranger task manager' -e ranger" > /tmp/ranger_replacement

sudo sed -i "s/^.*Exec=ranger.*$/$(cat /tmp/ranger_replacement)/" /usr/share/applications/ranger.desktop

sudo sed -i 's!Terminal=true!Terminal=false!' /usr/share/applications/ranger.desktop

