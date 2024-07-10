#!/bin/bash
eval "$(dbus-launch --sh-syntax --exit-with-session)"

# Composer
picom -b

# Keybindings
sxhkd &
autokey-gtk &

# Wallpaper
/home/tiagofer/Scripts/Wallpaper/wallpaper.sh &

# Caps Indicator
caps-indicator &

# Other Things
. ./.profile

# Audio
pipewire &

# Window Manager
dunst &
dwmblocks &
exec dwm
