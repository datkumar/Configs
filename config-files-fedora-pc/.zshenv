# FNM (Fast Node Manager)
FNM_PATH=$HOME/.local/share/fnm
export PATH="$FNM_PATH:$PATH"
## fnm (auto-generated)
#FNM_PATH="/home/kumar/.local/share/fnm"
#if [ -d "$FNM_PATH" ]; then
#  export PATH="/home/kumar/.local/share/fnm:$PATH"
#  eval "`fnm env`"
#fi
## fnm end

# pnpm
export PNPM_HOME=$HOME/.local/share/pnpm
export PATH=$PNPM_HOME:$PATH
## pnpm (auto-generated)
#export PNPM_HOME="/home/kumar/.local/share/pnpm"
#case ":$PATH:" in
#  *":$PNPM_HOME:"*) ;;
#  *) export PATH="$PNPM_HOME:$PATH" ;;
#esac
## pnpm end

# Deno
#. "/home/kumar/.deno/env"
[ -f "$HOME/.deno/env" ] && . "$HOME/.deno/env"

# Flutter, Android
export PATH=$PATH:$HOME/FlutterSdk/flutter/bin
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$HOME/.local/share/JetBrains/Toolbox/apps/android-studio/bin

# Go binaries
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# Rust
#. "$HOME/.cargo/env"
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Lua, LuaRocks
export PATH=$PATH:"$HOME/.luarocks/bin:/usr/local/bin"
export LUA_PATH=$LUA_PATH:"/home/kumar/.luarocks/share/lua/5.4/?.lua;/home/kumar/.luarocks/share/lua/5.4/?/init.lua;/usr/local/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?/init.lua"
export LUA_CPATH=$LUA_CPATH:"$HOME/.luarocks/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/?.so"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nano'
else
    export EDITOR='gnome-text-editor'
fi

# For QT apps
export QT_QPA_PLATFORMTHEME=qt5ct
