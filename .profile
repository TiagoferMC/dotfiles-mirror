#!/bin/sh

# Locales
LANG="en_US.UTF-8"
export LANG="en_US.UTF-8"

LANGUAGE="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

LC_ALL="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

LC_CTYPE="C"
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
        vol_string="$vol_left%"
    else
        vol_string="$vol_left% | $vol_right%"
    fi

    # Brightness
    brightness=$(xbacklight | cut -f1 -d.)

    # VPN
    connection_status=cat /var/log/mullvad-vpn/daemon.log | tail -n 3 | grep "New tunnel state" | awk {'print $6'}
    country=cat /var/log/mullvad-vpn/daemon.log | tail -n 3 | grep "New tunnel state" | awk -F \, {'print $7'} | awk -F \" {'print $2'}
    city=cat /var/log/mullvad-vpn/daemon.log | tail -n 3 | grep "New tunnel state" | awk -F \, {'print $9'} | awk -F \" {'print $1'} | cut -d \  -f 2

    vpn="$connection_status $country ($city)"

    # Set Bar
    xsetroot -name " V: $vol_string | B: $brightness% | VPN: $vpn | $(date +%a\ %F\ %T) ";
done &

# Other program settings:
export DICS="/usr/share/stardict/dic/"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.
export AWT_TOOLKIT="MToolkit wmname LG3D"	#May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm

# This is the list for lf icons:
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.webp=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpe=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.tif=🖼:\
*.tiff=🖼:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.wav=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.mov=🎥:\
*.mpg=🎥:\
*.wmv=🎥:\
*.m4b=🎥:\
*.flv=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.jar=♨:\
*.java=♨:\
"

export GPG_TTY=$(tty)
