#!/bin/sh

# Locales
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="C"
# Intervals
sleep_interval=0.1

# Topbar
while sleep $sleep_interval 
do

    # Volume
    vol_left=$(pactl list sinks | grep "Volume" | head -n 1 | awk '{ print $5  }' | cut -f1 -d%)
    vol_right=$(pactl list sinks | grep "Volume" | awk '{ print $12 }' | cut -f1 -d%)
    mute=$(pactl list sinks | grep "Mute" | awk '{ print $2 }' | cut -f1 -d%)

    vol_string=""

    if [[ "$mute" == "yes"   ]]; then
        vol_string="M"
    elif [[ "$vol_left" == "$vol_right"  ]]; then
        vol_string="$vol_left"
    else
        vol_string="$vol_left | $vol_right"
    fi

    # Set Bar
    xsetroot -name " [$vol_string] $(date +%a\ %F\ %T) ";
done &

export GPG_TTY=$(tty)
