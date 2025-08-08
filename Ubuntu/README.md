# Ubuntu <img alt="Ubuntu" src="../assets/ubuntu.svg" height="28">

First, update existing packages:

```sh
# Update apt and snap packages
sudo apt update && sudo apt upgrade -y
sudo snap refresh

# If Flatpaks installed, update them
flatpak update
```

## My list of Packages

### Packages of `apt` repos

```sh
sudo add-apt-repository universe
sudo apt update && sudo apt upgrade -y
sudo apt install -y \
  wget curl git zsh tmux cmake make zip unzip pkg-config \
  build-essential clang clang-tools clang-format clang-tidy \
  fzf fd-find bat jq eza ripgrep zoxide lua5.4 liblua5.4-dev neovim \
  libfuse2 libssl-dev gnome-keyring seahorse testdisk \
  btop htop hwinfo info xxd net-tools nmap ddcutil dmidecode piper \
  texlive-full chktex texstudio scdoc \
  gnome-epub-thumbnailer gnome-tweaks gnome-shell-extension-manager vlc
```

### PPA packages

A [PPA](https://launchpad.net/ubuntu/+ppas) (Personal Package Archive) is a repository hosted on Launchpad (Ubuntu’s platform) where developers or contributors can publish software packages. They are used for getting newer versions of software or software not in official Ubuntu repos.

**My PPA list**:

<!-- [fastfetch](https://github.com/fastfetch-cli/fastfetch), [onefetch](https://github.com/o2sh/onefetch/wiki/Installation), [font-manager](https://github.com/FontManager/font-manager), [grub-customizer](https://launchpad.net/~danielrichter2007/+archive/ubuntu/grub-customizer), [OBS](https://obsproject.com/download) -->

```sh
# Add PPA repositories of those packages
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo add-apt-repository ppa:o2sh/onefetch
sudo add-apt-repository ppa:font-manager/staging
sudo add-apt-repository ppa:danielrichter2007/grub-customizer

# Update system's repositories and install those packages
sudo apt update
sudo apt install -y fastfetch onefetch font-manager grub-customizer
```

### Snap Packages

<!-- Snap does not allow multiple package names to install in same line -->

```sh
sudo snap install pdftk
```

### Flatpaks

> I prefer Flatpaks over Snaps wherever possible

- First install flatpak and set up flathub repository:

  ```sh
  sudo apt install flatpak
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  flatpak install flathub
  ```

- Then install all the flatpak apps:

  ```sh
  flatpak install --assumeyes \
    org.libreoffice.LibreOffice \
    com.jgraph.drawio.desktop \
    com.obsproject.Studio \
    com.github.johnfactotum.Foliate \
    md.obsidian.Obsidian \
    com.usebruno.Bruno \
    com.discordapp.Discord
  ```
