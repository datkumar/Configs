# GNOME 👣

## GNOME Shell Extensions

- Visit [their site](https://extensions.gnome.org/). Install and enable the GNOME Shell integration from your browser
- You can view [my list of installed extensions](../config-files/gnome-shell-extensions.txt)
- Also install [Extension Manager](https://flathub.org/apps/com.mattjakeman.ExtensionManager) from Flathub to manage these

## GNOME Tweaks

```sh
sudo dnf install gnome-tweaks
```

### Adwaita Theme port for GTK3

- Clone the repo [adw-gtk3](https://github.com/lassekongo83/adw-gtk3)
- Extract the two folders `adw-gtk3`, `adw-gtk3-dark` into `~/.local/share/themes`
- Also recommended to install the flatpak themes
  ```sh
  flatpak install org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark
  ```

## GNOME-Look

Visit [gnome-look.org](https://www.gnome-look.org/browse/) to browse system themes, icon-packs, cursors, GRUB themes etc. (might have to debug to get it working)
