# VSCode <img alt="VSCode" src='https://upload.wikimedia.org/wikipedia/commons/9/9a/Visual_Studio_Code_1.35_icon.svg' height="25">

## Installation

Following their [instructions for Fedora](https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions). Refer that page for your respective Linux distro

- Install key and `yum` repository

  ```sh
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
  ```

- Update the package cache and install `code`

  ```sh
  dnf check-update
  sudo dnf install code # or code-insiders
  ```

## Themes, Settings, Extensions

VSCode User preferences are stored in `~/.config/Code/User/` folder. These include files like `settings.json`, `keybindings.json` as well as your language-specific snippets in the `snippets/` folder. Extensions are stored in the `~/.vscode/extensions` folder.

To view a list of your VSCode extensions: `code --list-extensions`

Preview a wide range of VSCode themes for your language at [vscodethemes.com](https://vscodethemes.com/)

You can refer my list of VSCode files:

- My [`settings.json`](https://github.com/datkumar/Configs/blob/main/config-files/vscode/settings.jsonc)
- My [list of extensions](https://github.com/datkumar/Configs/blob/main/config-files/vscode/extensions.txt)
- My [`keybindings.json`](https://github.com/datkumar/Configs/blob/main/config-files/vscode/keybindings.jsonc)

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
