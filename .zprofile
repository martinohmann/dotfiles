# autologin on tty1
# [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
[ ! -s ~/.mpd/pid ] && mpd
