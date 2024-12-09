# WSL Ubuntu

## Install Ubuntu via WSL

As per Microsoft's [WSL install guide](https://learn.microsoft.com/en-us/windows/wsl/install):

> Go into `Windows Features`, turn on `Windows Subsystem for Linux` and then restart computer

- Open Terminal as Admin and in PowerShell:
- Install WSL: `wsl --install`
- View available distros: `wsl -l --online`
- Might have to run this before: `wsl --update`
- Install WSL with default distro (Ubuntu): `wsl --install`
  - You can specify distro as: `wsl --install -d Ubuntu`
- Restart computer
- After restart, open Terminal. Open the Ubuntu tab
- For setup, it'll ask you to provide username (mine was `kumar-wsl`) and password
- Update packages: `sudo apt update && sudo apt upgrade -y`

Note the different Windows native and WSL home folders

| Terminal   | Windows native home     | WSL home                                 |
| ---------- | ----------------------- | ---------------------------------------- |
| PowerShell | `~` or `C:\Users\kumar` | `\\wsl$\Ubuntu\home\kumar-wsl`           |
| Git-Bash   | `~` or `/c/Users/kumar` | `/\\wsl.localhost/Ubuntu/home/kumar-wsl` |
| WSL        | `/mnt/c/Users/kumar`    | `~` or `/home/kumar-wsl`                 |

## Post-install steps

- Edit the `.bashrc` and paste config contents such as [my `.bashrc`](https://github.com/datkumar/Configs/blob/main/Windows/config-files/.bashrc)

- Install packages: [fastfetch](https://github.com/fastfetch-cli/fastfetch#installation), [`build-essential`](https://itsfoss.com/build-essential-ubuntu/)

  ```sh
  sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
  sudo apt update
  sudo apt install wget curl git tmux zip unzip build-essential net-tools fzf jq bat ripgrep eza bat htop fastfetch hwinfo
  # zoxide install script
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
  ```

  The `build-essential` contains a list of packages dependencies that are required to create a Debian package (`.deb`) . These packages are `libc`, `gcc`, `g++`, `make`, `dpkg-dev` etc.

  The `bat` package is installed under name `batcat` in Ubuntu due to name clash. So creat symlink as below:

  ```sh
  mkdir -p ~/.local/bin
  ln -s /usr/bin/batcat ~/.local/bin/bat
  ```

- Type `exit` to close WSL Ubuntu session

- See output of `lsblk` to know your distro is mounted at `/mnt/wslg/distro`. Your usual local Windows files in `C` drive are available at `/mnt/c`

### Alacritty

- Install:

  ```sh
  winget install -e --id Alacritty.Alacritty
  ```

- On Windows, the config file will be looked for in: `%APPDATA%\alacritty\alacritty.toml`. To know value of that variable, open **CMD** and run `echo %APPDATA%`. You will see output as `C:\Users\kumar\AppData\Roaming`

- So, create config file `AppData/Roaming/alacritty/alacritty.toml` via **Git-Bash** as:

  ```sh
  mkdir -p ~/AppData/Roaming/alacritty
  touch ~/AppData/Roaming/alacritty/alacritty.toml
  ```

## Dev-softwares

- Download the archive file into Windows Downloads folder
- Open Terminal inside that folder, and enter `wsl`
- Now follow the rest of the steps of Linux guide inside your WSL considering this folder location
