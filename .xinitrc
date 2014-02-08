#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [[ $# -gt 0 ]]; then
  WM=$1
fi

# disable beep
xset b off

urxvtd --quiet --opendisplay --fork
thunar --daemon &

case $WM in
  xfce)
    exec startxfce4
    ;;
  *)
    exec $HOME/.local/bin/dwm-startup
    ;;
esac
