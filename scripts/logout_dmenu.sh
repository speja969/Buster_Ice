#!/bin/bash
#
# a simple dmenu session script 
#
###

DMENU='dmenu -i -b -fn -xos4-terminus-medium-r-*--12-*-*-*-*-*-iso10646-1 -nb #000000 -nf #999999 -sb #000000 -sf #31658C'
choice=$(echo -e "logout\nshutdown\nreboot\nsuspend\nhibernate" | $DMENU)

case "$choice" in
  logout) killall -QUIT icewm & ;;
  shutdown) test -e /run/systemd/system && systemctl poweroff || sudo -n /sbin/poweroff & ;;
  reboot) test -e /run/systemd/system && systemctl reboot || sudo -n /sbin/reboot & ;;
  suspend) test -e /run/systemd/system && systemctl suspend || sudon -n /usr/sbin/pm-suspend & ;;
  hibernate) sudo pm-hibernate & ;;
esac
