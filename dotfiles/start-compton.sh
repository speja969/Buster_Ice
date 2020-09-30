#!/bin/bash
# The if statement is from the crunchbang-compositor and bl-compositor script
if glxinfo | egrep -iq 'direct rendering: yes'; then
    compton -b --vsync opengl
else
    compton -b
fi
