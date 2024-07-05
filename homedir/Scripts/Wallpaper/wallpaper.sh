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
    selected_file=$(ls -1 $animated_wallpaper_path | shuf -n 1)
    xwinwrap -ov -fs -nf -ni -- /bin/mpv "$animated_wallpaper_path/$selected_file" --loop=inf -wid WID -no-osc --aid=no &
    sleep $wallpaper_duration
    restart_script
else
    #xwinwrap -ov -fs -- /usr/lib/xscreensaver/glslideshow -window-id WID -zoom 100 -clip -duration $wallpaper_duration &
    xwinwrap -ov -fs -nf -ni -- /usr/lib/xscreensaver/glslideshow -window-id WID -zoom 100 -duration $wallpaper_duration &
    maybe_kill
fi
