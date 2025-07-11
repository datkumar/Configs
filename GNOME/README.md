# GNOME <img alt="GNOME" src="/assets/gnome.svg" height="28">

## GNOME Shell Extensions

- Visit [their site](https://extensions.gnome.org/). Install and enable the GNOME Shell integration from your browser
- You can view [my list of installed extensions](https://github.com/datkumar/Configs/blob/main/config-files/gnome-shell-extensions.txt)
- Also install [Extension Manager](https://flathub.org/apps/com.mattjakeman.ExtensionManager) from Flathub to manage these

- The **Picture-in-Picture** mode doesn't work on Firefox as Wayland doesn't support it. Use the [PiP on Top](https://extensions.gnome.org/extension/4691/pip-on-top/) GNOME Shell extension to overcome it

## GNOME Tweaks

```sh
# Fedora (dnf)
sudo dnf install gnome-tweaks

# Ubuntu (apt)
sudo apt install gnome-tweaks
```

### Adwaita Theme port for GTK3

Refer the [adw-gtk3 repo](https://github.com/lassekongo83/adw-gtk3)

```sh
# Fedora (dnf)
sudo dnf install adw-gtk3-theme

# Ubuntu (apt)
curl -s https://julianfairfax.codeberg.page/package-repo/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/julians-package-repo.gpg
echo 'deb [ signed-by=/usr/share/keyrings/julians-package-repo.gpg ] https://julianfairfax.codeberg.page/package-repo/debs packages main' | sudo tee /etc/apt/sources.list.d/julians-package-repo.list
```

Now set the them for Legacy applications to `Adw-gtk3-dark` under `Appearance` section in the `Tweaks` app

## GNOME-Look

Visit [gnome-look.org](https://www.gnome-look.org/browse/) to browse system themes, icon-packs, cursors, GRUB themes etc. (might have to debug to get it working)
