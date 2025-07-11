#!/usr/bin/env bash

# Stop on Errors
set -euo pipefail

# ----------------------------------------
# Sources and Destinations:

# Prompt for system type
echo "Select system type:"
echo "1) Fedora PC"
echo "2) Ubuntu Laptop"
read -rp "Enter 1 or 2: " system_choice

# Set Destination root "D" based on prompt result
case "$system_choice" in
1)
    D=./config-files-fedora-pc
    ;;
2)
    D=./config-files-ubuntu-laptop
    ;;
*)
    echo "Invalid selection. Exiting."
    exit 1
    ;;
esac

# Nested folders within Destination root
D_CFG="$D/.config"
D_ETC="$D/etc"

# Sources folders:
S="$HOME"
S_CFG="$HOME/.config"
S_ETC=/etc
S_LOC="$HOME/.local/share"

# Create Destination folder locations
mkdir -p "$D" "$D_CFG" "$D_ETC/"

# ----------------------------------------
# Fedora PC specific stuff:

# # DNF config
# cp "$S_ETC/dnf/dnf.conf" "$D_ETC/"

# # File-system Table (for mounting drives)
# cp "$S_ETC/fstab" "$D_ETC/"

# ----------------------------------------
# GNOME specific stuff:

# List of Extensions
# gnome-extensions list --enabled >"$D/gnome-shell-extensions.txt"
# Looks within ~/.local/share/gnome-shell/extensions

# # ----------------------------------------

# ZSH
cp "$S/.zshenv" "$D/"
cp "$S/.zshrc" "$D/"

# WezTerm
cp "$S/.wezterm.lua" "$D/"

# Starship
cp "$S_CFG/starship.toml" "$D_CFG/"

# User Scripts
mkdir -p "$D/scripts"
rsync -a "$S/scripts/" "$D/scripts/"

# Git
cp "$S/.gitconfig" "$D/"

# Tmux
cp "$S/.tmux.conf" "$D/"

# NeoVim + LazyVim
mkdir -p "$D_CFG/nvim"
rsync -a "$S_CFG/nvim/" "$D_CFG/nvim/"

# SWAY:
# Create folders
mkdir -p "$D_CFG/sway" "$D_CFG/swaynag" "$D_CFG/swaync"
mkdir -p "$D_CFG/waybar" "$D_CFG/wofi" "$D_CFG/wireplumber"
# Copy Sway stuff to folders
rsync -a "$S_CFG/sway/" "$D_CFG/sway/"
rsync -a "$S_CFG/swaynag/" "$D_CFG/swaynag/"
rsync -a "$S_CFG/swaync/" "$D_CFG/swaync/"
rsync -a "$S_CFG/waybar/" "$D_CFG/waybar/"
rsync -a "$S_CFG/wofi/" "$D_CFG/wofi/"
rsync -a "$S_CFG/wireplumber/" "$D_CFG/wireplumber/"

# GTK preferences
mkdir -p "$D_CFG/gtk-3.0" "$D_CFG/gtk-4.0"
rsync -a "$S_CFG/gtk-3.0/" "$D_CFG/gtk-3.0"
rsync -a "$S_CFG/gtk-4.0/" "$D_CFG/gtk-4.0"

# Modified Desktop entries
DESKTOPS=/usr/share/applications
cp "$DESKTOPS/org.gnome.Nautilus.desktop" "$D/"
cp "$DESKTOPS/nemo.desktop" "$D/"

# VLC
cp "$S_CFG/vlc/vlcrc" "$D/"

# ----------------------------------------
# List of Fonts:

mkdir -p "$D/fonts"

S_FONT="$S_LOC/fonts"

# Manually downloaded fonts
find "$S_FONT" -mindepth 1 -maxdepth 1 -type d ! -name 'Google Fonts' -printf '%f\n' >"$D/fonts/font-names.txt"

# Google fonts
find "$S_FONT/Google Fonts" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' >"$D/fonts/font-names-google.txt"

# ----------------------------------------
# VS Code:

S_VSC="$S_CFG/Code/User"
D_VSC="$D/vscode"
mkdir -p "$D_VSC"

# User settings
cp "$S_VSC/settings.json" "$D_VSC/settings.json"

# List of Extensions
code --list-extensions >"$D_VSC/extensions.txt"

# Custom Keyboard Shortcuts (currently empty)
# cp "$S_VSC/keybindings.json" "$D_VSC/keybindings.json"

# Language-wise Snippets
mkdir -p "$D_VSC/snippets"
rsync -a "$S_VSC/snippets" "$D_VSC/snippets/"

# Project Manager locations
cp "$S_VSC/globalStorage/alefragnani.project-manager/projects.json" "$D_VSC/project-manager-fav.json"
cp "$S_VSC/globalStorage/alefragnani.project-manager/projects_cache_git.json" "$D_VSC/project-manager.json"

# ----------------------------------------
# C/C++ Formatting:

mkdir -p "$D/cpp"

clang-format --style=Google --dump-config >"$D/cpp/.clang-format-google"
clang-format --style=LLVM --dump-config >"$D/cpp/.clang-format-llvm"
cp "$S/Desktop/Dev/code-journal/.playground/cpp/.clang-format" "$D/cpp/.clang-format"

# -----------------------------------------------------------------------------------------
# TODO: CHECK REMAINING

# -----------------------------------------------------------------------------------------

# # FIREFOX -------------------------------------
# mkdir -p $DEST/firefox

# firefoxProfileName=b7z5gvrc.default-release # laptop
# #firefoxProfileName=40rdv56b.default-release-1728120512299 # pc

# # Firefox profile folder (replace with your own respective profile folder)
# firefoxProfileFolder=$HOME/.mozilla/firefox/$firefoxProfileName

# # Firefox extensions i.e add-ons:
# jq -r '.addons[] | select(.defaultLocale != null) | "\(.defaultLocale.name) by \(.defaultLocale.creator)"' $firefoxProfileFolder/extensions.json >$DEST/firefox/extensions.txt

# # Firefox Bookmarks latest backup:
# # Delete previous saved backup file
# rm $DEST/firefox/bookmarks-*
# bookmarkBackups=$firefoxProfileFolder/bookmarkbackups
# latestBookmarkBackup=$(ls -t $bookmarkBackups/*.jsonlz4 | head -n 1)
# cp $latestBookmarkBackup $DEST/firefox/
# # Assuming you've turned "browser.bookmarks.autoExportHTML" as true in "about:config"
# cp $firefoxProfileFolder/bookmarks.html $DEST/firefox/

# # Cookie exceptions list:
# # Run the SQLite query and save the output to a file
# sqlite3 $firefoxProfileFolder/permissions.sqlite <<EOF >$DEST/firefox/cookie-exceptions.txt
# .mode column
# .headers off
# SELECT origin FROM moz_perms WHERE type='cookie';
# EOF
# # DB is locked when browser is open. So it would error
# if [[ $? -ne 0 ]]; then
#   echo "Failed to save cookie exceptions. Ensure Firefox is closed before running this script"
# fi

# # Simple Tab Groups (latest backup of open tabs):
# # Delete previous saved backup file
# rm $DEST/firefox/auto-stg-backup*.json
# latestStgFolder=$(ls -d $HOME/Downloads/STG-backups-* | sort -V | tail -n 1)
# latestStgBackup=$(ls "$latestStgFolder"/auto-stg-backup-day-of-month-*@drive4ik.json | sort -V | tail -n 1)
# cp $latestStgBackup $DEST/firefox/

# # Android Studio --------------------------------------

# # Find the latest Android Studio config dir
# studioDir=$(ls -d $HOME/.config/Google/AndroidStudio* | sort -V | tail -n 1)
# studioDirName=$(basename "$studioDir")
# echo "Detected latest Android Studio directory: $studioDirName"
# mkdir -p $DEST/AndroidStudio/$studioDirName

# # Define relevant subfolders to back up
# relevantStudioFolders=(options codestyles keymaps)
# # Copy only the relevant folders, preserving structure
# for folder in "${relevantStudioFolders[@]}"; do
#   if [ -d "$studioDir/$folder" ]; then
#     mkdir -p "$DEST/AndroidStudio/$studioDirName/$folder"
#     cp -r "$studioDir/$folder/"* "$DEST/AndroidStudio/$studioDirName/$folder/"
#   fi
# done

# #  Manual Exports  -------------------------------------------

# # touch $DEST/firefox/tabliss.json
# # touch $DEST/firefox/ublock-filters.txt

# echo "Need to manually export these configs:"
# echo "  - Tabliss settings"
# echo "  - UBlock filters"
