#!/bin/bash

##    1. Skinuti .iso Debiana (free) varijantu: https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.4.0-amd64-netinst.iso
##    2. Pomoću Rufusa ili Etchera napraviti butabilni USB Flash
##    3. Instalirati na particiju metodom INSTALL ili GRAPHICAL INSTALL (zavisno od RAM-a i procesora)
##    4. Izostaviti ROOT password tako da USER ima automatski SUDO ovlašćenja
##    5. Na pitanje koje Grafičko okruženje da se instalira od više ponuđenih (KDE,LXDE,...Debian default), ne izabrati ni jedno i čak odčekirati po difoltu čekirano Debian default graphic ...(ostaviti čekirane SSH i default utillity)
##    6. Posle instalacije i restarta, butuje se u konzolu (TTY)
##    7. Unesemo izabrane username i password 
##    8. Zatim instaliramo openbox, firefox-esr, lxterminal i lightdm
##       sudo apt install openbox firefox-esr lxterminal lightdm
##    9. sudo reboot
##    10. Posle restarta u firefox-u se prijavimo na Google nalog i u Google Drive-u daunlodujemo instalacionu skriptu
##       GDrive-->LINUX-->fajlovi-->OpenBox-->My dotfiles-->buster_install_script55.sh
##       cd Downloads
##       sudo chmod 777 buster_install_script55.sh
##       bash ./ buster_install_script55.sh
##       pokreće se instalacija ostalih programa i mojih podešavanja OpenBox-a:

sudo apt update && sudo apt upgrade

mkdir ~/.config/openbox

mkdir ~/.config/tint2

mkdir ~/.scripts

sudo apt-get install -y software-properties-common && sudo apt-add-repository contrib && sudo apt-add-repository non-free

sudo apt-get update

sudo apt-get install -y openbox obconf rxvt-unicode mousepad firefox-esr pcmanfm nitrogen tint2 menu pulseaudio pavucontrol gnome-backgrounds mate-backgrounds mlocate lxappearance vlc arandr apt-file synaptic firmware-linux firmware-linux-nonfree doublecmd-common xutils mesa-utils xarchiver htop disk-manager sysstat acpi hardinfo hddtemp wicd k3b i3lock aptitude gnome-disk-utility python3-pip python-pip materia-gtk-theme deepin-icon-theme ttf-mscorefonts-installer fonts-ubuntu fonts-ubuntu-console suckless-tools simplescreenrecorder font-manager ranger geany gdebi lightdm fbxkb mpv curl gmrun xscreensaver xterm pnmixer sxiv scrot xsettingsd ffmpeg wmctrl

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=10cRX-hSq73uPa9iYobokpZyhoIq2rWa8' -O ~/.config/tint2/tint2rc

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1NMA1a5GaQsGikmjh9Me4YOJPAknYpU1M' -O ~/.config/openbox/autostart.sh

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1kFBY_jhstNc92bPB1IurH8x2ZcXbpVlt' -O ~/.Xresources

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=12QZptYgCCM9XjNYAyJM6dOYzWmSvMnGy' -O ~/.config/openbox/rc.xml

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1vMHNIL_ttMWCxq2kzy_TKCEYPlqf2Ldq' -O ~/keyboard.sh

sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1ns98S6qMTohrCDFttxhl8i4nmV6M_kNp' -O /usr/share/fbxkb/images/rs.png

sudo mkdir ~/.config/mpv

sudo wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1jgYNy3Scdb86RfDW3IhuM9_cP9_RVGO-' -O ~/.config/mpv/mpv.conf



# korekcija autorizacije za gdebi
sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.gdebi-gtk.policy


# korekcija autorizacije za synaptic
sudo sed -i 's/<allow_active>auth_admin/<allow_active>yes/' /usr/share/polkit-1/actions/com.ubuntu.pkexec.synaptic.policy

# korekcija autorizacije za doublecmd
sudo sed -i 's/<allow_active>auth_admin_keep/<allow_active>yes/' /usr/share/polkit-1/actions/org.doublecmd.root.policy

echo 'deb http://download.opensuse.org/repositories/home:/Head_on_a_Stick:/obmenu-generator/Debian_10/ /' | sudo tee /etc/apt/sources.list.d/home:Head_on_a_Stick:obmenu-generator.list

curl -fsSL https://download.opensuse.org/repositories/home:Head_on_a_Stick:obmenu-generator/Debian_10/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home:Head_on_a_Stick:obmenu-generator.gpg > /dev/null

sudo apt update

sudo apt install -y obmenu-generator

obmenu-generator -s -i

obmenu-generator -p -i

## Kad skripta buster_install_script55.sh završi:
## sudo chmod --recursive a+x ~/.config/openbox
## sudo chmod a+x ~/keyboard.sh

## Iz padajućeg menija:
## Advanced Settings → Obmenu-Generator → Menu Schema
## u 34-oj liniji xterm zameniti sa rxvt-unicode
## 105-u liniju zakomentarisati
## 108-u liniju odkomentarisati I  zamenito oblogout sa obsession-logout
## sudo reboot

## Sad iz nitrogen-a izaberemo Wallpaper (/usr/share/backgrounds)

## Sledi instalacija programa koji se instaliraju po posebnim uputstvima (WPS-Office, ncmpcpp, ranger, deadbeef,...)



mkdir ~/Documents/DEB  # odkomentirati ako instaliramo bar jedan .deb program

## WPS Office
wget --no-check-certificate http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9604/wps-office_11.1.0.9604.XA_amd64.deb -O ~/Documents/DEB/wps-office_11.1.0.9604.XA_amd64.deb

## DeadBeef muzički plejer
wget --no-check-certificate https://sourceforge.net/projects/deadbeef/files/travis/linux/1.8.4/deadbeef-static_1.8.4-1_amd64.deb/download -O ~/Documents/DEB/deadbeef-static_1.8.4-1_amd64.deb

## XnView MP pregledač slika
wget --no-check-certificate https://download.xnview.com/XnViewMP-linux-x64.deb -O ~/Documents/DEB/XnViewMP-linux-x64.deb


## debinfo -- prikaz resursa pri otvaranju terminala
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1LFYs-ainHuoVkgEnN6ca__vC_rFjH9ve' -O ~/.scripts/install_debinfo.sh

## instalacija comptona
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=12Q58-hpw_rZYLqeR6P8Gtfg1MSpE5C1f' -O ~/.scripts/install_compton.sh

## instalacija ncmpcpp
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1jij7oosi2RLhLw4TMAn5ITwiRl6cm2tO' -O ~/.scripts/install_ncmpcpp.sh

## screeny
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1gvTi2BgNbe6W0Ke2knUy4YLbjl1oXnpS' -O ~/.scripts/screeny

## reinstall youtube-dl
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=18cDxMp3L1vuVBVbW8IiePbjpCJMwp1wP' -O ~/.scripts/reinstall_youtube-dl.sh

## install flatpak
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=12XSq17YCeMIf8zpudC7KEHYHiaqjWR82' -O ~/.scripts/install_flatpak.sh

## install JetBrainsMono font
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1ubexVi6qWfXlfP3DL70_d4VJjvOejQi5' -O ~/.scripts/install_JetBrainsMono_font.sh

