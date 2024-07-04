#!/bin/bash

wallpaper_duration=1800 # 1800 = 30 minutes
chance_of_animated=2 # 50%

restart_script() {
    killall xwinwrap
    ~/Scripts/Wallpaper/wallpaper.sh &
}

maybe_kill() {
    sleep $wallpaper_duration
    if [ $(($RANDOM % $chance_of_animated)) -eq 0 ]; then
        restart_script
    else
        maybe_kill
    fi

}

if [ $(($RANDOM % $chance_of_animated)) -eq 0 ]; then
    animated_wallpaper_path="/mnt/Drive2/Documents/Wallpapers/Animated/"
    number_of_gifs=$(ls -1 $animated_wallpaper_path | wc -l)
    selected_gif_number=$((1 + $RANDOM % number_of_gifs))
    xwinwrap -ov -fs -- /bin/mpv "$animated_wallpaper_path/animated $selected_gif_number.gif" --loop=$wallpaper_duration -wid WID 
    restart_script
else
    #xwinwrap -ov -fs -- /usr/lib/xscreensaver/glslideshow -window-id WID -zoom 100 -clip -duration $wallpaper_duration &
    xwinwrap -ov -fs -- /usr/lib/xscreensaver/glslideshow -window-id WID -zoom 100 -duration $wallpaper_duration &
    maybe_kill
fi
