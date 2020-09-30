#!/bin/bash

sudo apt -y install flatpak && flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo 'export PATH=$PATH:/var/lib/flatpak/exports/bin' >> ~/.bashrc
       
## program se startuje komandom:
## flatpak run $app_id
## gde je $app_id is the source repository for the application
## obicno $app_id je com.<ime_aplikacije>....

