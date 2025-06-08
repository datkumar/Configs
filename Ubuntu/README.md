# Ubuntu Post-install

## My list of packages

IDK:

```sh
sudo apt update && sudo apt install -y \
grub-customizer
```

### Present in `apt` repos

```sh
sudo add-apt-repository universe
sudo apt update && sudo apt upgrade -y

sudo apt install -y \
 wget curl git tmux g++ clang clang-tools make cmake zip unzip pkg-config libfuse2 \
 lua5.4 liblua5.4-dev neovim texlive-full chktex texstudio libssl-dev \
 btop htop hwinfo info zsh scdoc fzf bat jq eza ripgrep zoxide xxd \
 gnome-tweaks nmap ddcutil dmidecode piper gnome-epub-thumbnailer vlc
```

### PPA packages

A [PPA](https://launchpad.net/ubuntu/+ppas) (Personal Package Archive) is a repository hosted on Launchpad (Ubuntu’s platform) where developers or contributors can publish software packages. They are used for getting newer versions of software or software not in official Ubuntu repos.

My PPA list:[fastfetch](https://github.com/fastfetch-cli/fastfetch), [onefetch](https://github.com/o2sh/onefetch/wiki/Installation), [font-manager](https://github.com/FontManager/font-manager), [grub-customizer](https://launchpad.net/~danielrichter2007/+archive/ubuntu/grub-customizer)

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
sudo snap install pdftk
sudo snap install obsidian --classic
sudo snap install bruno
sudo snap install foliate
sudo snap install discord
sudo snap install drawio
```
