#!/bin/bash

wallpaper_duration=1800 # 1800 = 30 minutes



wallpaper_type=$(($RANDOM % 2))

case $wallpaper_type in
    "0")
        xwinwrap -ov -fs -- /bin/mpv /mnt/Drive2/Documents/Wallpapers/Animated/animated\ 1.gif --loop=inf -wid WID & 
        ;;

    "1")
        #xwinwrap -ov -fs -- /usr/lib/xscreensaver/glslideshow -window-id WID -zoom 100 -clip -duration $wallpaper_duration &
        xwinwrap -ov -fs -- /usr/lib/xscreensaver/glslideshow -window-id WID -zoom 100 -duration $wallpaper_duration &
        ;;
    *)
        echo Error!
esac













