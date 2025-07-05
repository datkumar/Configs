# ~/.zshenv – for persistent env setup, loads even in scripts
# Loads before login shells

# -------------------------------------------------------------
# Environment Variables and Paths
# -------------------------------------------------------------

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PATH:$PNPM_HOME"

# Go
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"

# Flutter & Android
export PATH="$PATH:$HOME/FlutterSdk/flutter/bin"
export PATH="$PATH:$HOME/Android/Sdk/platform-tools"
export PATH="$PATH:$HOME/Android/Sdk/emulator"
export PATH="$PATH:$HOME/.pub-cache/bin"
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/apps/android-studio/bin"
export ANDROID_HOME="$HOME/Android/Sdk"

# fnm (Fast Node Manager)
export PATH="$HOME/.local/share/fnm:$PATH"

# Deno
[ -f "$HOME/.deno/env" ] && . "$HOME/.deno/env"

# Rust
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"



# # Fast Node Manager (fnm)
# export PATH="$HOME/.local/share/fnm:$PATH"
# # Only switches node version when cd-ing into a project
# eval "$(fnm env --use-on-cd --shell zsh)"  


# # pnpm
# export PNPM_HOME="$HOME/.local/share/pnpm"
# [[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"


# # Deno
# . "$HOME/.deno/env"


# # Go and it's binaries
# export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"


# # Rust
# [ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"


# # Flutter, Android
# export PATH=$PATH:$HOME/FlutterSdk/flutter/bin
# export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$HOME/.local/share/JetBrains/Toolbox/apps/android-studio/bin
# export PATH=$PATH:$HOME/.pub-cache/bin


# # Lua, LuaRocks
# #export PATH=$PATH:$HOME/.luarocks/bin
# #export LUA_PATH='/usr/local/share/lua/5.4/?.lua;/usr/share/lua/5.4/?.lua;/usr/share/lua/5.4/?/init.lua;/usr/lib64/lua/5.4/?.lua;/usr/lib64/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/home/kumar/.luarocks/share/lua/5.4/?.lua;/home/kumar/.luarocks/share/lua/5.4/?/init.lua;/usr/local/share/lua/5.4/?/init.lua'
# #export LUA_CPATH='/usr/lib64/lua/5.4/?.so;/usr/lib64/lua/5.4/loadall.so;./?.so;/home/kumar/.luarocks/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/?.so'


# Preferred Editor per environment
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='gnome-text-editor'
fi


# # If you want to manually set your language environment
# # export LANG=en_US.UTF-8

