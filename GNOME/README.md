# GNOME <img alt="GNOME" src='https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Gnomelogo-footprint.svg/833px-Gnomelogo-footprint.svg.png' height="25">

## GNOME Shell Extensions

- Visit [their site](https://extensions.gnome.org/). Install and enable the GNOME Shell integration from your browser
- You can view [my list of installed extensions](https://github.com/datkumar/Configs/blob/main/config-files/gnome-shell-extensions.txt)
- Also install [Extension Manager](https://flathub.org/apps/com.mattjakeman.ExtensionManager) from Flathub to manage these

## GNOME Tweaks

```sh
sudo dnf install gnome-tweaks
```

### Adwaita Theme port for GTK3

Refer the [adw-gtk3 repo](https://github.com/lassekongo83/adw-gtk3)

```sh
sudo dnf install adw-gtk3-theme
```

Now set the them for Legacy applications to `Adw-gtk3-dark` under `Appearance` section in the `Tweaks` app

## GNOME-Look

Visit [gnome-look.org](https://www.gnome-look.org/browse/) to browse system themes, icon-packs, cursors, GRUB themes etc. (might have to debug to get it working)
