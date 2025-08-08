# ~/.zshenv – for persistent env setup, loads even in scripts
# Loads before login shells

# ---------------------------------------------
#  System preferences
# ---------------------------------------------

# Set locale to English (US) with UTF-8 encoding
export LANG=en_US.UTF-8

# For Sway Compatibility:
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=wayland


# Preferred Editor per environment
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='gnome-text-editor'
fi

# ---------------------------------------------
#  Dev Stuff
# ---------------------------------------------
# Tool Version Managers & User-Specific Bins should generally come first
# And after it, Language-Specific Environment Variables and their Binaries
# Then the various SDKs

# fnm (Fast Node Manager) setup
FNM_PATH="$HOME/.local/share/fnm"
export PATH="$FNM_PATH:$PATH"
# Init fnm
eval "$(fnm env --use-on-cd --shell zsh)"
fnm use --install-if-missing lts-latest


# pnpm  
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm globally installed binaries (needs active Node.js version) 
PNPM_GLOBAL_BIN_DIR="$(pnpm config get global-bin-dir)"
export PATH="$PNPM_GLOBAL_BIN_DIR:$PATH"


# Rust
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Deno
[ -f "$HOME/.deno/env" ] && . "$HOME/.deno/env"


# Go
export GOROOT="/usr/local/go"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export GOPROXY="https://proxy.golang.org,direct"
export PATH="$GOROOT/bin:$GOBIN:$PATH"


# uv 'dev-tools' virtual environment's binaries
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env" 
export PATH="$HOME/.venvs/dev-tools/bin:$PATH"


# Android
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/apps/android-studio/bin"
# Flutter
export PATH="$PATH:$HOME/FlutterSdk/flutter/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"

