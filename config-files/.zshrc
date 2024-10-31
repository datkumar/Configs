# ----------------------- SHELL init ---------------------

# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Other themes: "agnoster","robbyrussell"
ZSH_THEME="agnoster"

# Case-sensitive completion
# CASE_SENSITIVE="true"

# Hyphen-insensitive completion
# Case-sensitive completion must be off _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Command auto-correction
# ENABLE_CORRECTION="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode auto  # auto/disabled/reminder

# Uncomment the following line to change how often to auto-update (in days)
zstyle ':omz:update' frequency 7

# Uncomment if pasting URLs and other text is messed up
# DISABLE_MAGIC_FUNCTIONS="true"

# Disable colors in ls
# DISABLE_LS_COLORS="true"

# Disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Display red dots whilst waiting for completion
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty. This makes
# repository status check for large repositories much, much faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Command execution timestamp shown in the history command output. The formats are:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd" or strftime function for custom format
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    dnf
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Load OMZ into ZSH
source $ZSH/oh-my-zsh.sh

# ----------------------- Dev ---------------------

# fnm (auto-generated)
FNM_PATH="/home/kumar/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/kumar/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# pnpm (auto-generated)
export PNPM_HOME="/home/kumar/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Java
#export JAVA_HOME=/usr/lib/jvm/java-23-openjdk-23.0.0.0.37-1.rolling.fc40.x86_64-fastdebug

# Flutter, Android
export PATH=$PATH:$HOME/FlutterSdk/flutter/bin
export PATH=$PATH:$HOME/.local/share/JetBrains/Toolbox/apps/android-studio/bin
export PATH=$PATH:$HOME/Android/Sdk/platform-tools

# Golang
export PATH=$PATH:/usr/local/go/bin

# Lua, LuaRocks
export PATH=$PATH:'/home/kumar/.luarocks/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin'
export LUA_PATH='/usr/local/share/lua/5.4/?.lua;/usr/share/lua/5.4/?.lua;/usr/share/lua/5.4/?/init.lua;/usr/lib64/lua/5.4/?.lua;/usr/lib64/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/home/kumar/.luarocks/share/lua/5.4/?.lua;/home/kumar/.luarocks/share/lua/5.4/?/init.lua;/usr/local/share/lua/5.4/?/init.lua'
export LUA_CPATH='/usr/lib64/lua/5.4/?.so;/usr/lib64/lua/5.4/loadall.so;./?.so;/home/kumar/.luarocks/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/?.so'

# ----------------------- User config --------------

# Personal aliases, overriding those provided by OMZ libs, plugins, and themes. 
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
alias cls="clear"
alias refreshenv="exec $(which $SHELL)"
alias gedit="gnome-text-editor" # Fedora has gnome-text editor instead of Gedit
alias zshconfig="gedit ~/.zshrc"

alias cat="bat"
alias ls="eza"
alias la="eza -a"
alias ll="eza -alh"
alias tree="eza --tree"

# Colorizing pager for man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# bat as a previewer for fzf
alias fzf="fzf --preview 'bat --color=always --line-range=:500 {}' --preview-window '~3'"

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# To manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nano'
else
    export EDITOR='gnome-text-editor'
fi


alias get-brightness="ddcutil getvcp 10"
alias set-brightness="ddcutil setvcp 10"
alias bright++="ddcutil setvcp 10 + 5"
alias bright--="ddcutil setvcp 10 - 5"
# Set brightness to zero after 7PM
if [[ $(date +"%H") -ge 19 ]] then
    set-brightness 0
fi

# Prepares to initialize ZSH’s autocompletion system
autoload -Uz compinit

# Enables interactive menu selection during completions with global scope
zstyle ':completion:*' menu select

# Adds directory to Zsh’s search path for custom functions
fpath+=~/.zsh_functions


