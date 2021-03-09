#!/data/data/com.termux/files/usr/bin/bash

# Packages
pkg update && pkg upgrade
pkg install curl wget vim neovim openssh tmux zsh python nodejs

# Pip packages
pip install youtube-dl

# zsh
chsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Vim Dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh

sh ./installer.sh ~/.vim/bundles

rm installer.sh

# TermuxBlack
wget https://github.com/Hax4us/TermuxBlack/raw/master/install.sh

bash install.sh

rm install.sh

# Copy Files
echo Copying files...
cp -r ./homedir/.* ~

# Truecolor
echo Truecolor test:
bash ./tools/truecolor.sh

