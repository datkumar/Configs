#!/usr/bin/env bash

DEST=./Windows/config-files
# Delete old backup folder (if exists)
rm -rf $DEST
# Create a new one
mkdir -p $DEST

# NOTE: This script is being run in WSL Project folder
# So, WSL home is `~` and Windows native home is `/mnt/c/Users/kumar`
# -------------------------------

# Bash config file:
cp ~/.bashrc $DEST/.bashrc-wsl
cp /mnt/c/Users/kumar/.bash_profile $DEST/.bash_profile-native

# Git global config
cp ~/.gitconfig $DEST

# Tmux config
cp ~/.tmux.conf $DEST

# Alacritty config
cp /mnt/c/Users/kumar/AppData/Roaming/alacritty/alacritty.toml $DEST

# -------------- VSCode --------------
mkdir -p $DEST/vscode

# User settings
cp /mnt/c/Users/kumar/AppData/Roaming/Code/User/settings.json $DEST/vscode/settings.jsonc

# List of names of extensions
# VSCode extensions for WSL stored in: ~/.vscode-server/extensions
# VSCode extensions for Windows stored in: %USERPROFILE%\.vscode\extensions
# code --list-extensions >$DEST/vscode/extensions.txt

# Keyboard shortcut customizations
#cp /mnt/c/Users/kumar/AppData/Roaming/Code/User/keybindings.json $DEST/vscode/keybindings.jsonc

# Snippets (Optional. Mine are empty)
cp -r /mnt/c/Users/kumar/AppData/Roaming/Code/User/snippets/ $DEST/vscode/snippets/

# Projects (WSL base folder not assignable)
cp /mnt/c/Users/kumar/AppData/Roaming/Code/User/globalStorage/alefragnani.project-manager/projects.json $DEST/vscode/projects.json

# -------------- My scripts --------------
cp -r ~/scripts $DEST

# -------------- Firefox --------------
