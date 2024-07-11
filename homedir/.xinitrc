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

# Polkit Agent
/usr/lib/polkit-kde-authentication-agent-1 &

# Audio
pipewire &

# Window Manager
dunst &
dwmblocks &
exec dwm
