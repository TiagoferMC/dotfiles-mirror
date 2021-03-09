#!/data/data/com.termux/files/usr/bin/bash

# Packages
pkg update && pkg upgrade
pkg install curl wget vim neovim openssh tmux zsh python nodejs git

# Pip packages
pip install --upgrade pip
pip install youtube-dl

# Storage
termux-setup-storage

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

# TermuxBlack
wget https://github.com/Hax4us/TermuxBlack/raw/master/install.sh

bash install.sh -i

pkg upgrade

rm install.sh
rm termuxblack.key

# Copy Files
echo Copying files...
cp -r homedir/. ~

# Init Files
. ~/.profile
. ~/.bash_profile
. ~/.bashrc
. ~/.zshrc

# Truecolor
echo Truecolor test:
bash tools/truecolor.sh

