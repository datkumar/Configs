
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

# Trim shell prompt: https://unix.stackexchange.com/questions/273529/shorten-path-in-zsh-prompt
#PROMPT=%(5~|%-1~/…/%3~|%4~)


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

# Agnoster theme code:https://github.com/agnoster/agnoster-zsh-theme/blob/master/agnoster.zsh-theme
# Override the "prompt_dir" function of "agnsoter" theme
# to modify how the shell prompt shows present directory
prompt_dir() {
  local depth=3
  local path=${PWD/#$HOME/\~}  # Replace $HOME with ~
  local parts=("${(@s:/:)path}")  # Split path into an array

  if (( ${#parts[@]} > depth )); then
    local short_path="…/${(j:/:)${(@)parts[-$depth,-1]}}"
  else
    local short_path="$path"
  fi

  # Use Agnoster's default colors (blue background, white foreground)
  prompt_segment blue black "$short_path"
}



# ----------------------- Dev ---------------------

# fnm
FNM_PATH=$HOME/.local/share/fnm
if [ -d "$FNM_PATH" ]; then
  export PATH=$HOME/.local/share/fnm:$PATH
  eval "`fnm env`"
fi


# pnpm
export PNPM_HOME=$HOME/.local/share/pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Deno
. "$HOME/.deno/env"
# Add deno completions to search path
if [[ ":$FPATH:" != *":/home/kumar-laptop/.zsh/completions:"* ]]; then export FPATH="/home/kumar-laptop/.zsh/completions:$FPATH"; fi


# Java
#export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
#export PATH=$PATH:$JAVA_HOME/bin

# Flutter, Android
# Flutter SDK Location: /home/kumar-laptop/FlutterSdk/flutter
export PATH=$PATH:$HOME/FlutterSdk/flutter/bin
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$HOME/.local/share/JetBrains/Toolbox/apps/android-studio/bin
export PATH=$PATH:$HOME/.pub-cache/bin
#export CHROME_EXECUTABLE=/usr/bin/firefox


# SonarQube
export PATH=$PATH:$HOME/SonarScanner/bin

# Kitty Terminal
export PATH=$PATH:$HOME/.local/kitty.app/bin

# --------------------------------------------------

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/kumar-laptop/.dart-cli-completion/zsh-config.zsh ]] && . /home/kumar-laptop/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# Add Go binaries to PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin


# Lua, LuaRocks
export LUA_PATH='/usr/local/share/lua/5.4/?.lua;/usr/share/lua/5.4/?.lua;/usr/share/lua/5.4/?/init.lua;/usr/lib64/lua/5.4/?.lua;/usr/lib64/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/home/kumar-laptop/.luarocks/share/lua/5.4/?.lua;/home/kumar-laptop/.luarocks/share/lua/5.4/?/init.lua;/usr/local/share/lua/5.4/?/init.lua'
export LUA_CPATH='/usr/lib64/lua/5.4/?.so;/usr/lib64/lua/5.4/loadall.so;./?.so;/home/kumar-laptop/.luarocks/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/?.so'
export PATH=$PATH:$HOME/.luarocks/bin


# ----------------------- User config --------------

# Personal aliases, overriding those provided by OMZ libs, plugins, and themes. 
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
alias cls="clear"
alias refreshenv="exec $(which $SHELL)"
alias gedit="gnome-text-editor" # The bundled text editor with GNOME isn't GEdit
alias zshconfig="gedit ~/.zshrc"
alias diskinfo="lsblk -o NAME,MOUNTPOINTS,TYPE,FSTYPE,FSVER,SIZE,FSUSED,FSAVAIL,MODEL,LABEL,UUID"

# Dev abbreviations
alias fvm-start="flutter pub global activate fvm"
alias c="code"
alias fr="flutter run"
alias fc="flutter clean"


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
#if [[ $(date +"%H") -ge 19 ]] then
#    set-brightness 0
#fi


# -------------- Shell completions--------------

# Prepares to initialize ZSH’s autocompletion system
autoload -Uz compinit

# Enables interactive menu selection during completions with global scope
zstyle ':completion:*' menu select

# Adds directory to Zsh’s search path for custom functions
fpath+=~/.zsh_functions

# fnm completions for Zsh
eval "$(fnm env --use-on-cd --shell zsh)"

# Setup zoxide in on zsh
eval "$(zoxide init zsh)"


. "$HOME/.local/bin/env"
