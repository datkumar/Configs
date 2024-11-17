#!/usr/bin/env bash

DEST=./Windows/config-files
# Delete old backup folder (if exists)
rm -rf $DEST
# Create a new one
mkdir -p $DEST

# WSL Ubuntu Bash config
cp ~/.bashrc $DEST

# Tmux config
#cp ~/.tmux.conf $DEST

# Git global config
cp ~/.gitconfig $DEST

# -------------- VSCode --------------
mkdir -p $DEST/vscode

# User settings
cp /mnt/c/Users/kumar/AppData/Roaming/Code/User/settings.json $DEST/vscode/settings.jsonc

# List of names of extensions
code --list-extensions >$DEST/vscode/extensions.txt

# Keyboard shortcut customizations
cp /mnt/c/Users/kumar/AppData/Roaming/Code/User/keybindings.json $DEST/vscode/keybindings.jsonc

# Projects (WSL base folder not assignable)
cp /mnt/c/Users/kumar/AppData/Roaming/Code/User/globalStorage/alefragnani.project-manager/projects.json $DEST/vscode/projects.json

# Snippets (Optional. Mine are empty)
# cp ~/.config/Code/User/snippets $DEST/vscode/snippets/

# -------------- Fonts --------------

# -------------- Firefox --------------

# -------------- Manually export --------------
