#!/usr/bin/env bash

DEST=./config-files
# Delete old backup folder (if exists)
rm -rf $DEST
# Create a new one
mkdir -p $DEST

# DNF config
cp /etc/dnf/dnf.conf $DEST

# File-sytem table for mounting drives
cp /etc/fstab $DEST

# Shell config
cp ~/.zshrc $DEST

# Tmux config
cp ~/.tmux.conf $DEST

# Alacritty Terminal config
cp ~/.alacritty.toml $DEST

# Git global config (global in "~/.gitconfig" and local in ".git/config")
cp ~/.gitconfig $DEST

# GNOME Shell Extensions
# ls ~/.local/share/gnome-shell/extensions >$DEST/gnome-shell-extensions.txt
gnome-extensions list --enabled >$DEST/gnome-shell-extensions.txt

# VLC settings
cp ~/.config/vlc/vlcrc $DEST

# -------------- VSCode --------------
mkdir -p $DEST/vscode

# User settings
cp ~/.config/Code/User/settings.json $DEST/vscode/settings.jsonc

# List of names of extensions
ls ~/.vscode/extensions >$DEST/vscode/extensions.txt

# Keyboard shortcut customizations
cp ~/.config/Code/User/keybindings.json $DEST/vscode/keybindings.jsonc

# Snippets (Optional. Mine are empty)
# cp ~/.config/Code/User/snippets $DEST/vscode/snippets/

# -------------- Fonts --------------

mkdir -p $DEST/fonts

# ls ~/.fonts >$DEST/fonts/font-names.txt
# Exclude the 'GoogleFonts' symlinked folder in output
find ~/.fonts -mindepth 1 -maxdepth 1 -type d ! -name 'GoogleFonts' -printf '%f\n' >$DEST/fonts/font-names.txt

ls ~/.var/app/org.gnome.FontManager/data/fonts/Google\ Fonts >$DEST/fonts/font-names-google.txt

# -------------- Firefox --------------
mkdir -p $DEST/firefox

# Firefox profile folder (replace with your own resepective profile folder)
firefoxProfileFolder=$HOME/.mozilla/firefox/40rdv56b.default-release-1728120512299

# Firefox extensions i.e add-ons:
jq -r '.addons[] | select(.defaultLocale != null) | "\(.defaultLocale.name) by \(.defaultLocale.creator)"' $firefoxProfileFolder/extensions.json >$DEST/firefox/extensions.txt

# Firefox Bookmarks:
# Bookmarks backup (assuming non-empty)
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
latestStgFolder=$(ls -d ~/Downloads/STG-backups-* | sort -V | tail -n 1)
latestStgBackup=$(ls "$latestStgFolder"/auto-stg-backup-day-of-month-*@drive4ik.json | sort -V | tail -n 1)
cp $latestStgBackup $DEST/firefox/

# -------------- Android Studio --------------
mkdir -p $DEST/android-studio
cp -r ~/.config/Google/AndroidStudio* $DEST/android-studio/

# -------------- Manually export --------------

touch $DEST/firefox/tabliss.json
touch $DEST/firefox/ublock-filters.txt

echo "Need to manually export these configs:"
echo "  - Tabliss settings"
echo "  - UBlock filters"
