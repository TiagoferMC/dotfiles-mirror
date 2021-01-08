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
exec dwm


