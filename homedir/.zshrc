# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/deck/.oh-my-zsh"

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
alias pacman-size='expac "%n %m" -l"\n" -Q $(pacman -Qq) | sort -rhk 2 | less'

# Use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

# Verbosity and settings that you pretty much just always are going to want.
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

alias gparted="gksu gparted"

autoload zmv
alias zcp='zmv -C' zln='zmv -L'

# Environment Variables
if  [ "$(echo $XDG_SESSION_TYPE)" = "wayland" ]; then
    export DISPLAY=:1
fi

# Git Stuff (Used Here Especially Because Remote SSH)
export GPG_TTY=$(tty)

#xhost +si:localuser:$USER

# --- Custom tab title ---

# Always recompute on new shell — don't inherit from parent
unset TAB_PREFIX
if [[ -z "$TAB_PREFIX" ]]; then
  export TAB_PREFIX=" $(awk -F '=' ' /^PRETTY_NAME/ { gsub(/'"'"'|"/, ""); gsub(/ Linux/, ""); print $2 }' /etc/os-release)"
fi
_TAB_PREFIX="$TAB_PREFIX"

# Helper to set the terminal tab/window title
_set_title() {
  print -Pn "\e]0;${1}\a"
}

# Called before each prompt (idle — show cwd)
_custom_precmd_title() {
  _set_title "${_TAB_PREFIX} %1~ "
}

_custom_preexec_title() {
  local cmd="$1"
  local first_word="${cmd%% *}"

  case "$first_word" in
    vi|vim|nvim|neovim|emacs|emacs-nw|emacs-nox)
      # Resolve what will actually run
      local display_name
      if [[ "$first_word" == "vim" ]] && [[ "$(whence vim)" = "nvim" ]]; then
        display_name="nvim"
      else
        display_name="$first_word"
      fi

      local args=("${(z)cmd}")
      local file_arg
      for a in "${args[@]}"; do
        [[ "$a" != -* ]] && file_arg="$a"
      done
      local fname="${file_arg:t}"
      if [[ -n "$fname" && "$fname" != "$first_word" ]]; then
        _set_title "${_TAB_PREFIX} ${display_name}: ${fname} "
      else
        _set_title "${_TAB_PREFIX} ${display_name} "
      fi
      ;;
    command)
      # `command vim` etc — strip `command` and reprocess
      _custom_preexec_title "${cmd#command }"
      ;;
    *)
      _set_title "${_TAB_PREFIX} ${first_word} [%1~] "
      ;;
  esac
}

# Remove OMZ's title hooks and replace with ours
precmd_functions=(${precmd_functions:#omz_termsupport_precmd})
preexec_functions=(${preexec_functions:#omz_termsupport_preexec})

add-zsh-hook precmd  _custom_precmd_title
add-zsh-hook preexec _custom_preexec_title

export PATH="$HOME/.local/bin":"$HOME/.local/bin/distrobox":"$HOME/.cargo/bin":$PATH

