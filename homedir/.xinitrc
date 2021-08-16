#!/bin/bash

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
