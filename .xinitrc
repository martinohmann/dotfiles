#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    # shellcheck disable=SC1090
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# disable beep
xset b off

# set screensaver and dpms to 20min
xset s 1200 1200
xset dpms 1200 1200 1200

# update font config
xset +fp /usr/share/fonts/local
xset fp rehash

# load .Xresources and .Xdefaults
xrdb -merge ~/.Xresources
xrdb -merge ~/.Xdefaults

# init keyring
eval "$(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)"
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK
export GNOME_KEYRING_CONTROL=/run/user/1000/keyring

# override style for QT applications
export QT_STYLE_OVERRIDE=gtk

# disable touchpad
synclient touchpadoff=1

# disable touchpad while typing. will override the touchpadoff=1 rule
# syndaemon -i 1 -k -d

# set dircolors
eval "$(dircolors -b ~/.dircolors)"

# launch compositor
compton -CGb -f -D 5 --backend glx

# enable usb automount
udiskie -2 &

# launch urxvt daemon
urxvtd --quiet --opendisplay --fork

# launch NetworkManager applet
nm-applet &

# launch thunderbird
thunderbird > /dev/null 2>&1 &

# launch nextcloud
nextcloud > /dev/null 2>&1 &

# launch notification daemon
dunst > /dev/null 2>&1 &

# prevent dpms if needed
lightson 590 &

# set background
~/.fehbg

exec i3
