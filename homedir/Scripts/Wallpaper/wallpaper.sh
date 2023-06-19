#!/bin/bash

wallpaper_duration=1800 # 1800 = 30 minutes

#xwinwrap -ov -fs -- /usr/lib/xscreensaver/glslideshow -window-id WID -zoom 100 -clip -duration $wallpaper_duration &
xwinwrap -ov -fs -- /usr/lib/xscreensaver/glslideshow -window-id WID -zoom 100 -duration $wallpaper_duration &
