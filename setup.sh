#!/bin/bash

# Packages
sudo pacman -Syu
sudo pacman -S curl wget vi vim neovim openssh tmux zsh python nodejs npm git ruby ttf-fira-code woff-fira-code woff2-fira-code dnscrypt-proxy dnscrypt-proxy-openrc networkmanager

# Pip packages
pip install --upgrade pip
pip install youtube-dl

# Ruby Gem Packages
gem install wayback_machine_downloader

# zsh
chsh -s zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-autocomplete
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.oh-my-zsh/custom/plugins/

# Vim Dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh

sh ./installer.sh ~/.vim/bundles

rm installer.sh

# AUR

# BlackArch

# Git
git config --global user.name "Tiagofer"
git config --global user.email "tiagofer@me.com"
git config --global commit.gpgsign true
git config --global tag.gpgsign true
git config --global pull.rebase false


# Copy Files
echo Copying files...
cp -r homedir/. ~
sudo cp -r etc/* /etc

# Init Files
. ~/.profile
. ~/.bash_profile
. ~/.bashrc
. ~/.zshrc

# Truecolor
echo Truecolor test:
bash tools/truecolor.sh

