#!/usr/bin/env bash

# bleh.sh
source ~/.local/share/blesh/ble.sh
bleopt highlight_syntax=
bleopt prompt_eol_mark="$(echo -e '\e[7m%\e[0m')"
bleopt exec_errexit_mark=
bleopt exec_elapsed_mark=
bleopt exec_exit_mark=
bleopt edit_marker=
bleopt edit_marker_error=

# PS1
PS1="$(echo -e '\e[36m\w \e[33mᐅ ')"

alias cl="clear"
alias v="nvim"
alias pacman-size='expac "%n %m" -l"\n" -Q $(pacman -Qq) | sort -rhk 2 | less'

# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -v" \
	mkd="mkdir -pv" \
	ffmpeg="ffmpeg -hide_banner"

# Colorize commands when possible.
alias \
	ls="ls -hN --color=auto --group-directories-first" \
	grep="grep --color=auto" \
	diff="diff --color=auto" \
	ccat="highlight --out-format=ansi"

# Git Stuff (Used Here Especially Because Remote SSH)
export GPG_TTY=$(tty)

export PATH="$HOME/.local/bin":"$HOME/.cargo/bin":$PATH
