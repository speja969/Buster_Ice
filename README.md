## **Bullseye Pejax** (instructions in Serbian)
### *Debian Bullseye sa OpenBox WM*

1. Potrebno je prvo skinuti sa Debianovog sajta ISO instalacioni fajl:
    * https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.6.0-amd64-netinst.iso
    * ili non-free verziju https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/10.6.0+nonfree/amd64/iso-cd/firmware-10.6.0-amd64-netinst.iso
1. Pomoću Rufusa ili Etchera napraviti butabilni instalacioni USB Flash 
1. Instalirati na odabranu particiju metodom INSTALL ili GRAPHICAL INSTALL (zavisno od RAM-a i procesora)
1. Izostaviti _ROOT_ password tako da _USER_ ima automatski _SUDO_ ovlašćenja
1. Na pitanje koje Grafičko okruženje da se instalira (_Tasksel_), od više ponuđenih (_KDE_,_LXDE_,..._Debian default_),  
 ne izabrati ni jedno i čak odčekirati sve osim _SSH_ i _default utillity_
1. Posle instalacije i restarta, butuje se u konzolu (_TTY_), gde unosimo username i password  
1. ažuriranje softvera  
_` sudo apt update && sudo apt full-upgrade`_
1. instaliranje git-a  
_`sudo apt install git`_
1. kloniranje git repozitorijuma Bullseye_Pejax  
_`git clone https://github.com/speja969/Bullseye_Pejax.git`_
1. promena aktivnog direktorijuma  
_`cd Bullseye_Pejax`_
1. maksimalno podizanje ovlašćenja pristupa repozitorijumu Bullseye_Pejax rekurzivno  
_`sudo chmod --recursive 777 .`_
1. promena aktivnog direktorijuma  
_`cd scripts`_
1. Startovanje skripte _Bullseye_Pejax.sh_  
_`sudo ./Bullseye_Pejax.sh`_
1. Restart  
_`sudo reboot`_
1. Posle restarta potrebno je u konfiguracionim fajlovima **ncmpcpp** (_`~/.mpd/mpd.conf`_ i _`~/.ncmpcpp/config`_)  
promeniti putanju foldera sa muzikom ili ostaviti po default-u (_`~/Music`_):  
_`sudo geany ~/.mpd/mpd.conf`_  
_`sudo geany ~/.ncmpcpp/config`_  
_`sudo reboot`_
1. Po želji možete instalirati obmenu-generator:  
_`cd ~/.scripts`_  
_`sudo ./obmenu-generator.sh`_  
ako želite ikonice na padajućem meniju:  
_`desni klik mišem na Desktop`_-->_`Advanced Settings`_-->_`Obmenu-Generator`_-->  
_`Generate a static menu with icons`_

## AKO SE INSTALIRA U VIRTUALBOX-u
* potrebno je u tački 6. pre restarta instalirati GuestAdditions iz konzole (TTY):  
https://youtu.be/CwQ8XzP-h4Q?list=PL7ygF5ucclBQgWy6VruCjggBEXZxOcnxz
* Dodati user-a grupi vboxsf (za šerovanje fajlova sa HOST-om)  
_`sudo adduser $USER vboxsf`_
* dalje je isto od tačke 7. do kraja

![Tiling capabilities](https://user-images.githubusercontent.com/62497469/92691918-af710700-f343-11ea-957f-2f8a56197b0b.png)
![Cheese_20 09 2_11 54 55](https://user-images.githubusercontent.com/62497469/91967654-cb592500-ed13-11ea-9b6b-18d53566a27d.png)
![Double Commander](https://user-images.githubusercontent.com/62497469/92326972-72acc380-f056-11ea-9880-e0922fd20094.png)
![Font Manager](https://user-images.githubusercontent.com/62497469/92327031-03839f00-f057-11ea-8662-4e6f9cd7dfbf.png)
![Geany](https://user-images.githubusercontent.com/62497469/92327061-36c62e00-f057-11ea-86ca-130de1247d59.png)
![gnome-disk-utiliti](https://user-images.githubusercontent.com/62497469/92327077-6412dc00-f057-11ea-84c8-e8927f1ad1c0.png)
![Mousepad](https://user-images.githubusercontent.com/62497469/92327101-96243e00-f057-11ea-8b99-917800a6fd1b.png)
![Nitrogen](https://user-images.githubusercontent.com/62497469/92327116-ba801a80-f057-11ea-8058-7b023d0aa7cf.png)
![PCManFM](https://user-images.githubusercontent.com/62497469/92327132-e00d2400-f057-11ea-9c7f-0be41bee339d.png)
![rxvt-unicode](https://user-images.githubusercontent.com/62497469/92327166-07fc8780-f058-11ea-8e74-79cfda46f425.png)
![Xarchiver](https://user-images.githubusercontent.com/62497469/92327192-3712f900-f058-11ea-8244-359d9ba9f1a0.png)
