# Ubuntu <img alt="Fedora" src='https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/UbuntuCoF.svg/512px-UbuntuCoF.svg.png' height="25">

## My list of packages

<!-- grub-customizer ? -->

### Present in `apt` repos

```sh
sudo add-apt-repository universe
sudo apt update && sudo apt upgrade -y

sudo apt install -y \
 wget curl git g++ clang clang-tools clang-format clang-tidy make cmake zip unzip  \
 tmux libfuse2 pkg-config  libssl-dev \
 lua5.4 liblua5.4-dev neovim texlive-full chktex texstudio  \
 btop htop hwinfo info zsh scdoc fzf bat jq eza ripgrep zoxide xxd \
 gnome-tweaks nmap ddcutil dmidecode piper gnome-epub-thumbnailer vlc
```

### PPA packages

A [PPA](https://launchpad.net/ubuntu/+ppas) (Personal Package Archive) is a repository hosted on Launchpad (Ubuntu’s platform) where developers or contributors can publish software packages. They are used for getting newer versions of software or software not in official Ubuntu repos.

**My PPA list**:

<!-- [fastfetch](https://github.com/fastfetch-cli/fastfetch), [onefetch](https://github.com/o2sh/onefetch/wiki/Installation), [font-manager](https://github.com/FontManager/font-manager), [grub-customizer](https://launchpad.net/~danielrichter2007/+archive/ubuntu/grub-customizer), [OBS](https://obsproject.com/download) -->

```sh
# Add PPA repositories of those packages
sudo add-apt-repository ppa:obsproject/obs-studio
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo add-apt-repository ppa:o2sh/onefetch
sudo add-apt-repository ppa:font-manager/staging
sudo add-apt-repository ppa:danielrichter2007/grub-customizer

# Update system's repositories and install those packages
sudo apt update
sudo apt install -y obs-studio fastfetch onefetch font-manager grub-customizer
```

### Snap Packages

Snap does not allow multiple package names to install in same line

```sh
sudo snap install libreoffice
sudo snap install obsidian --classic
sudo snap install drawio
sudo snap install foliate
sudo snap install bruno
sudo snap install discord
sudo snap install pdftk
```
