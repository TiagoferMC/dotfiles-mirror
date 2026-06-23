#!/bin/env bash
cd "${BASH_SOURCE%/*}" || exit

sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo
# headers=$(paru -Ss linux-neptune --repo \
#    | grep Installed \
#    | awk -F'[/ ]' 'FNR==NR { kernel=$2 ; \
#            gsub("-headers","",kernel) ; \
#            printf "%s-headers ", kernel }')

paru -Syu --needed bash zsh zsh-autosuggestions \
	ttf-firacode-nerd realtime-privileges \
	ffmpegthumbs ffmpegthumbnailer kimageformats \
	kdegraphics-thumbnailers qt6-imageformats \
       	xf86-input-{wacom,elographics} dnscrypt-proxy --overwrite '*'
yes | paru -Scc

sudo usermod -aG libvirt,vboxusers,render,video,audio,realtime deck

sudo cp -r ./etc/* /etc
sudo systemctl enable dnscrypt-proxy

