#!/usr/bin/env bash

# DEST=./config-files-pc
DEST=./config-files-laptop

# Create the destination folder if it doesn't exist
mkdir -p $DEST

# -------------- Single Config files  --------------

# DNF config
cp /etc/dnf/dnf.conf $DEST

# File-sytem table for mounting drives
cp /etc/fstab $DEST

# Shell config
cp ~/.zshrc $DEST

# Tmux config
cp ~/.tmux.conf $DEST

# Sway config
cp ~/.config/sway/config $DEST

# Alacritty Terminal config
cp ~/.alacritty.toml $DEST

# Git global config (global in "~/.gitconfig" and local in ".git/config")
cp ~/.gitconfig $DEST

# GNOME Shell Extensions
# ls ~/.local/share/gnome-shell/extensions >$DEST/gnome-shell-extensions.txt
gnome-extensions list --enabled >$DEST/gnome-shell-extensions.txt

# VLC settings
cp ~/.config/vlc/vlcrc $DEST

# -------------- VS CODE --------------
mkdir -p $DEST/vscode

# User settings
cp ~/.config/Code/User/settings.json $DEST/vscode/settings.jsonc

# List of names of extensions
code --list-extensions >$DEST/vscode/extensions.txt

# Keyboard shortcut customizations
cp ~/.config/Code/User/keybindings.json $DEST/vscode/keybindings.jsonc

# Snippets (Optional. Mine are empty)
cp -r ~/.config/Code/User/snippets $DEST/vscode/

# Project Manager locations
cp ~/.config/Code/User/globalStorage/alefragnani.project-manager/projects_cache_git.json $DEST/vscode/projects_cache_git.json

# C/C++ Formatting:
mkdir -p $DEST/cpp
cp ~/Desktop/Notes/code-journal/.playground/cpp/.clang-format $DEST/cpp/.clang-format
clang-format --style=Google --dump-config >$DEST/cpp/.clang-format-google
clang-format --style=LLVM --dump-config >$DEST/cpp/.clang-format-llvm

# -------------- FONTS --------------

mkdir -p $DEST/fonts

# ls ~/.fonts >$DEST/fonts/font-names.txt
# Exclude the 'GoogleFonts' symlinked folder in output
find ~/.fonts -mindepth 1 -maxdepth 1 -type d ! -name 'GoogleFonts' -printf '%f\n' >$DEST/fonts/font-names.txt

ls ~/.var/app/org.gnome.FontManager/data/fonts/Google\ Fonts >$DEST/fonts/font-names-google.txt

# -------------- FIREFOX --------------
mkdir -p $DEST/firefox

firefoxProfileName=b7z5gvrc.default-release # laptop
#firefoxProfileName=40rdv56b.default-release-1728120512299 # pc

# Firefox profile folder (replace with your own respective profile folder)
firefoxProfileFolder=$HOME/.mozilla/firefox/$firefoxProfileName

# Firefox extensions i.e add-ons:
jq -r '.addons[] | select(.defaultLocale != null) | "\(.defaultLocale.name) by \(.defaultLocale.creator)"' $firefoxProfileFolder/extensions.json >$DEST/firefox/extensions.txt

# Firefox Bookmarks latest backup:
# Delete previous saved backup file
rm $DEST/firefox/bookmarks-*
bookmarkBackups=$firefoxProfileFolder/bookmarkbackups
latestBookmarkBackup=$(ls -t $bookmarkBackups/*.jsonlz4 | head -n 1)
cp $latestBookmarkBackup $DEST/firefox/
# Assuming you've turned "browser.bookmarks.autoExportHTML" as true in "about:config"
cp $firefoxProfileFolder/bookmarks.html $DEST/firefox/

# Cookie exceptions list:
# Run the SQLite query and save the output to a file
sqlite3 $firefoxProfileFolder/permissions.sqlite <<EOF >$DEST/firefox/cookie-exceptions.txt
.mode column
.headers off
SELECT origin FROM moz_perms WHERE type='cookie';
EOF
# DB is locked when browser is open. So it would error
if [[ $? -ne 0 ]]; then
  echo "Failed to save cookie exceptions. Ensure Firefox is closed before running this script"
fi

# Simple Tab Groups (latest backup of open tabs):
# Delete previous saved backup file
rm $DEST/firefox/auto-stg-backup*.json
latestStgFolder=$(ls -d ~/Downloads/STG-backups-* | sort -V | tail -n 1)
latestStgBackup=$(ls "$latestStgFolder"/auto-stg-backup-day-of-month-*@drive4ik.json | sort -V | tail -n 1)
cp $latestStgBackup $DEST/firefox/

# -------------- ANDROID STUDIO --------------

# Find the latest Android Studio config dir
studioDir=$(ls -d ~/.config/Google/AndroidStudio* | sort -V | tail -n 1)
studioDirName=$(basename "$studioDir")
echo "Detected latest Android Studio directory: $studioDirName"
mkdir -p $DEST/AndroidStudio/$studioDirName

# Define relevant subfolders to back up
relevantStudioFolders=(options codestyles keymaps)
# Copy only the relevant folders, preserving structure
for folder in "${relevantStudioFolders[@]}"; do
  if [ -d "$studioDir/$folder" ]; then
    mkdir -p "$DEST/AndroidStudio/$studioDirName/$folder"
    cp -r "$studioDir/$folder/"* "$DEST/AndroidStudio/$studioDirName/$folder/"
  fi
done

# -------------- MANUAL EXPORT --------------

# touch $DEST/firefox/tabliss.json
# touch $DEST/firefox/ublock-filters.txt

echo "Need to manually export these configs:"
echo "  - Tabliss settings"
echo "  - UBlock filters"
