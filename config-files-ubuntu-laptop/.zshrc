# ~/.zshrc – Shell behavior, Prompt, Plugins, Aliases

# -------------------------------------------------------------
# History and Shell options
# -------------------------------------------------------------
# History:
HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
#
# Shell options:
setopt autocd         # Pass just directory to cd into it 
setopt beep           # Beep on error
setopt extendedglob   # Advanced globbing
setopt nomatch        # Avoid glob errors
setopt notify         # Job status notifications

# -------------------------------------------------------------
# Aliases
# -------------------------------------------------------------
# For a full list of active aliases, run `alias`
#
alias cls="clear"
alias refreshenv="exec $SHELL"
alias gedit="gnome-text-editor" # GNOME's bundled text editor isn't GEdit
alias zshconfig="gedit $HOME/.zshrc"
alias diskinfo="lsblk -o NAME,MOUNTPOINTS,TYPE,FSTYPE,FSVER,SIZE,FSUSED,FSAVAIL,MODEL,LABEL,UUID"
alias cat="batcat" # bat command named 'batcat' in Ubuntu
#
alias ls="eza"
alias la="eza -a"
alias ll="eza -alh"
alias tree="eza --tree"

# bat as a previewer for fzf
alias fzf="fzf --preview 'batcat --color=always --line-range=:500 {}' --preview-window '~3'"

# Colorizing man pages
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export MANROFFOPT="-c"

# Development aliases:
# alias c="code"
alias fr="flutter run"
alias fc="flutter clean"
#alias fvm-start="flutter pub global activate fvm"


# -------------------------------------------------------------
# Prompt and Plugins
# -------------------------------------------------------------

# Starship prompt (fast and light-weight)
eval "$(starship init zsh)"

# Source manually installed local ZSH Plugins:
source $HOME/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zoxide (fast enough to load immediately)
eval "$(zoxide init zsh)"

# FNM (Fast Node Manager) init
eval "$(fnm env)"

# -------------------------------------------------------------
# Completions
# -------------------------------------------------------------
# Load zsh-completions
fpath+=$HOME/.zsh_plugins/zsh-completions/src

# Compinstall metadata (if you might run `compinstall` again)
zstyle :compinstall filename "$HOME/.zshrc"

# Load completion system with caching
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit -C
else
  compinit
fi

# Enables menu-based selection when using tab-completion
zstyle ':completion:*' menu select

# -------------------------------------------------------------
# Key Bindings
# -------------------------------------------------------------
bindkey '\e[1;5D' backward-word  # Ctrl+Left (WezTerm)
bindkey '\e[1;5C' forward-word   # Ctrl+Right (WezTerm)
bindkey '\e[5D' backward-word    # Alt fallback
bindkey '\e[5C' forward-word

# -------------------------------------------------------------
# Optional: Benchmarking
# -------------------------------------------------------------
zmodload zsh/zprof

