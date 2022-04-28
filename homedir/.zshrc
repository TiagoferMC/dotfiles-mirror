# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/tiagofer/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="muse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo z)

source $ZSH/oh-my-zsh.sh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Aliases

alias cl="clear"
alias v="nvim"
alias wifi=". /home/tiagofer/Scripts/WiFi/wifi.sh"
alias mullvpn=". /home/tiagofer/Scripts/VPN/mullvad.sh"
alias mongod-auth="doas mongod --config /etc/mongodb.conf --dbpath /var/lib/mongodb"
alias mongo-connect="mongosh --authenticationDatabase 'admin' -u 'tiagofer' -p"
alias zeronetconfig="doas -u zeronet python /opt/zeronet/zeronet.py --config_file /etc/zeronet.conf"
alias discord="PULSE_LATENCY_MSEC=83 discord" # Fix Discord Audio Rate to 1024/48000
alias pacman-size='expac "%n %m" -l"\n" -Q $(pacman -Qq) | sort -rhk 2 | less'

# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# Verbosity and settings that you pretty much just always are going to want.
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	mkd="mkdir -pv" \
	yt="youtube-dl --add-metadata -i" \
	yta="yt -x -f bestaudio/best" \
	ffmpeg="ffmpeg -hide_banner"

# Colorize commands when possible.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi"

# These common commands are just too long! Abbreviate them.
alias \
	ka="killall" \
	g="git" \
	trem="transmission-remote" \
	YT="youtube-viewer" \
	sdn="doas shutdown -h now" \
	f="$FILE" \
	e="$EDITOR" \
	v="$EDITOR" \
	p="doas pacman" \
	xi="doas xbps-install" \
	xr="doas xbps-remove -R" \
	xq="xbps-query" \
	za="zathura"

alias \
	magit="nvim -c MagitOnly" \
	ref="shortcuts >/dev/null; source ${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc ; source ${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" \
	weath="less -S ${XDG_DATA_HOME:-$HOME/.local/share}/weatherreport" \
	tmux="tmux -f ${XDG_CONFIG_HOME:-$HOME/.config}/tmux/tmux.conf" \

alias gparted="gksu gparted"

# Environment Variables

# Git Stuff (Used Here Especially Because Remote SSH)
export GPG_TTY=$(tty)

# For Java
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/jvm/default/lib/server

# For fim
export FBFONT=/usr/share/kbd/consolefonts/ter-216n.psf.gz

# devkitpro stuff
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=/opt/devkitpro/devkitARM
export DEVKITPPC=/opt/devkitpro/devkitPPC

#source /etc/profile.d/devkit-env.sh

# PATH
export PATH=$PATH:/home/tiagofer/.local/bin/:/home/tiagofer/.perl5/bin:/opt/vcpkg:/opt/vcpkg/installed/x64-linux/include:/home/tiagofer/.local/bin/statusbar/:/root/.gem/ruby/2.7.0/bin:/home/tiagofer/.gem/ruby/2.7.0/bin:/usr/lib/xscreensaver:$DEVKITARM/bin:$DEVKITPPC/bin:$DEVKITPRO/bin

# Perl5
export PERL5LIB="/home/tiagofer/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/home/tiagofer/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/home/tiagofer/.perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/tiagofer/.perl5"

# PyEnv
eval "$(pyenv init -)"

