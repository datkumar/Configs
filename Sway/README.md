# Sway <img alt="Sway" src="../assets/sway.svg" height="28">

## Installation

- Install `sway` via your package manager. The `sway` package would come with useful dependencies such as: `swaybg`, `sway-wallpapers`/`sway-backgrounds`, `swayidle`, `swaylock`, `wmenu`, `foot` etc. Install additional helpful packages with it:

```sh
# FEDORA:
sudo dnf copr enable erikreider/SwayNotificationCenter
sudo dnf install sway waybar wofi swaylock swayidle swayimg SwayNotificationCenter \
  wireplumber pipewire-libs pulseaudio-libs pavucontrol playerctl \
  blueman brightnessctl wlsunset wev grim slurp wl-clipboard
# GTK alternative apps
sudo dnf install nemo qalculate-gtk

# UBUNTU
sudo apt install sway waybar wofi swaylock swayidle swayimg sway-notification-center \
  wireplumber pipewire-audio-client-libraries pulseaudio-utils pavucontrol playerctl \
  blueman brightnessctl wev grim slurp wl-clipboard fonts-font-awesome
# GTK alternative apps
sudo apt install nemo qalculate-gtk
```

## Configuration

The config files are placed in `$XDG_CONFIG_HOME/` i.e. `~/.config/` as:

- [**Sway**](https://github.com/swaywm/sway/wiki): `sway/config` (copy from `/etc`)

- [**Swaynag**](https://man.archlinux.org/man/swaynag.5.en): `swaynag/config`

- [**SwayNC**](https://github.com/ErikReider/SwayNotificationCenter?tab=readme-ov-file#ubuntu) for Notification center: `swaync/config.json`, `swaync/configSchema.json`, `swaync/style.css` (copy from `/etc`)

- [**Waybar**](https://github.com/Alexays/Waybar/wiki/Configuration) for Topbar: `waybar/config` or `waybar.config.jsonc`, `waybar/styles.css` (copy from `/etc`)

- [**Wofi**](https://man.archlinux.org/man/wofi.1.en) for Launcher: `wofi/config`, `wofi/styles.css`

- **Wireplumber** Bluetooth device preference file: `wireplumber/wireplumber.conf.d/60-audio-priority.conf` (already exist)

- Preferences for **GTK** apps: `gtk-3.0/settings.ini`, `gtk-4.0/settings.ini`

> **Note**: A lot of GNOME-native apps won't respect your GTK theme preferences. So install equivalent GTK-native apps. Might have to edit `*.desktop` entries also to avoid duplicate label/icons

```sh
# Create required folders in home config
cd ~/.config
mkdir -p sway swaynag swaync waybar wofi mako wireplumber/wireplumber.conf.d

# Copy default config files from /etc
cp /etc/sway/config ~/.config/sway/config
cp -r /etc/xdg/swaync/* ~/.config/swaync/
cp -r /etc/xdg/waybar/* ~/.config/waybar/
```

Create rest of the files and start editing

### Sway config file

Some suggested changes within the `~/.config/sway/config` file

- Set Terminal

  ```sh
  # Your preferred terminal emulator
  set $term wezterm
  ```

- Set `wofi` as the Application Launcher

  ```sh
  # Your preferred application launcher
  set $menu wofi --show drun
  ```

- Set Waybar as the Status Bar. Comment out the existing `bar{ ... }` block and write:

  ```sh
  # Status Bar:
  # Read `man 5 sway-bar` for more information about this section.
  exec_always waybar
  ```

- Set Wallpaper:

  ```sh
  ### Output configuration
  # Default wallpaper (more resolutions are available in /usr/share/backgrounds/sway/)
  output * bg IMAGE_LOCATION fill
  ```

- To fix the Trackpad Tap-Click:

  Find input device name: `swaymsg -t get_inputs`. In the output, look for something like:

  ```txt
    Input device: ELAN469D:00 04F3:304B Touchpad
      Type: Touchpad
      Identifier: 1267:12363:ELAN469D:00_04F3:304B_Touchpad
      Product ID: 12363
      Vendor ID: 1267
      Libinput Send Events: enabled
  ```

  So add the `input` block accordingly in the config file

  ```sh
  ### Input configuration
  # You can get the names of your inputs by running: swaymsg -t get_inputs
  # Read `man 5 sway-input` for more information about this section.
  input "1267:12363:ELAN469D:00_04F3:304B_Touchpad" {
      tap enabled
      dwt enabled
      natural_scroll enabled
      middle_emulation enabled
      scroll_method two_finger
  }
  ```

- Brightness settings:

  - To check brightness backlight device, run: `brightnessctl --list`

  - If `brightnessctl` isn't working when you manually try to enter command: `brightnessctl -d amdgpu_bl1 set +10%` where if you get permission denied, you need to add the rule as: `sudo nano /etc/udev/rules.d/90-backlight.rules` and paste:

    ```sh
    SUBSYSTEM=="backlight", KERNEL=="amdgpu_bl1", MODE="0664", GROUP="video"
    ```

  - Reload rules and add current user to the video group

    ```sh
    # Reload rules
    sudo udevadm control --reload-rules
    sudo udevadm trigger

    # Add current user to the video group
    sudo usermod -aG video $USER
    ```

  - Log-out or reboot and test the `brightnessctl` command again

- Screen-capture Trouble-shooting. The "Screen Capture" input option in OBS was not showing up in Ubuntu for me (although Fedora was working fine)

  ```sh
  sudo apt install obs-studio pipewire xdg-desktop-portal xdg-desktop-portal-wlr
  mkdir -p ~/.config/xdg-desktop-portal/
  nano ~/.config/xdg-desktop-portal/portals.conf
  ```

  Paste these contents and save file:

  ```txt
  [preferred]
  default=xdg-desktop-portal-wlr
  ```
