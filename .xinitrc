#!/bin/bash

# Composer
picom -b

# Keybindings
sxhkd &

# Other Things
. ./.profile

# Wallpaper
/home/tiagofer/Scripts/Wallpaper/wallpaper.sh

# Window Manager
exec dwm
exec dwmblocks
