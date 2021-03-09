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


# Other program settings
FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_DEFAULT_OPTS
export LESS=-R
LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_mb
LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_md
LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_me
LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_so
LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_se
LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_us
LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESS_TERMCAP_ue
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

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

GPG_TTY=$(tty)
export GPG_TTY
