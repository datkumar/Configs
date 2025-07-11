# VSCode <img alt="VSCode" src="../assets/vscode.svg" height="28">

## Installation

Following their [instructions for Linux](https://code.visualstudio.com/docs/setup/linux). Refer that page for your respective Linux distro

### Fedora install

```sh
# Install key and "yum" repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

# Update the package cache and install "code"
dnf check-update
sudo dnf install code # or code-insiders
```

### Ubuntu install

```sh
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

```

## Themes, Settings, Extensions

VSCode User preferences are stored in `~/.config/Code/User/` folder. These include files like `settings.json`, `keybindings.json` as well as your language-specific snippets in the `snippets/` folder. Extensions are stored in the `~/.vscode/extensions` folder.

To view a list of your VSCode extensions: `code --list-extensions`

Preview a wide range of VSCode themes for your language at [vscodethemes.com](https://vscodethemes.com/)

You can refer my list of VSCode files within the `vscode/` folder:

- Settings in `settings.json` file
- list of extensions in `extensions.txt` file
- Kayboard shortcuts in `keybindings.json` file

---

## "Open in VSCode" option

Assuming you're on the GNOME desktop environment (the default on Ubuntu, Fedora etc), your file manager by default is [Nautilus](https://apps.gnome.org/Nautilus/). So, you can add a script to run as an option in your context menu when you right-click a folder or file. The scripts are stored in `~/.local/share/nautilus/scripts/` folder

- Create the bash script file `Open-in-VSCode.sh`:

  ```sh
  nano ~/.local/share/nautilus/scripts/Open-in-VSCode.sh
  ```

- Paste below contents into the file, save it and exit. Referred from [this post](https://stackoverflow.com/a/63459408/16365842)

  ```sh
  #!/usr/bin/env bash
  code ${NAUTILUS_SCRIPT_SELECTED_FILE_PATHS}
  ```

- Give it execution permission:

  ```sh
  chmod +x ~/.local/share/nautilus/scripts/Open-in-VSCode.sh
  ```

- Now you can see the `Open-in-VSCode.sh` option in the `Scripts` tab of the right-click menu
