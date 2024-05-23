#!/bin/bash
eval "$(dbus-launch --sh-syntax --exit-with-session)"

# Composer
picom -b

# Keybindings
sxhkd &

# Wallpaper
/home/tiagofer/Scripts/Wallpaper/wallpaper.sh

# Other Things
. ./.profile

# Audio
setsid -f pipewire

# Window Manager
setsid -f dunst
setsid -f dwmblocks
exec dwm
