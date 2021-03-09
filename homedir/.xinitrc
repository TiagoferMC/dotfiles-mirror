#!/bin/bash

# Composer
picom -b

# Keybindings
sxhkd &

# Wallpaper
/home/tiagofer/Scripts/Wallpaper/wallpaper.sh

# Other Things
. ./.profile

# Window Manager
setsid -f dunst
setsid -f dwmblocks
exec dwm
