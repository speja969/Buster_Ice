#!/bin/bash
# ACTION: Terminal Informations about System
# INFO: Terminal Informations about System
# DEFAULT: y

default_user=$(logname 2>/dev/null || echo ${SUDO_USER:-${USER}})
HOME="/home/${default_user}"

sudo cp ~/Baster_Pejax/scripts/debinfo /usr/bin/debinfo

sudo chmod 777 /usr/bin/debinfo

echo debinfo >> ~/.bashrc

