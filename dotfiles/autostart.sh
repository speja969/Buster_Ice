
## GNOME PolicyKit and Keyring
#/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &
#eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg) &

nitrogen --restore &

export PATH="${PATH}:$HOME/.scripts"

tint2 &

~/keyboard.sh

fbxkb &

urxvtd -q &

#~/conkystartup.sh
sleep 10 && /usr/bin/conky-session &

pnmixer &

compton -cC -i 0.85 -e 0.85 -m 0.9 -r 4 -l -4 -t -4 &
# $HOME/bin/start-compton.sh &

# Start screensaver
xscreensaver -no-splash &

# Turn on Numlock at start-up
numlockx on &
