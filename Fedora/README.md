# Fedora <img alt="Fedora" src='https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Fedora_icon_%282021%29.svg/2089px-Fedora_icon_%282021%29.svg.png' height="25">

## Post-Install steps for Fedora

Refer below TechHut video:

<iframe width="480" height="270" src="https://www.youtube.com/embed/RrRpXs2pkzg?si=yburF7eFUNdkZRwx" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

### DNF

- `dnf` is the package manager for Fedora. On a fresh install, DNF might seem slow
- Edit options in the `/etc/dnf/dnf.conf` file to make it faster. You can refer [my DNF config](https://github.com/datkumar/Configs/blob/main/config-files/dnf.conf) file as well as the [DNF Configuration docs](https://dnf.readthedocs.io/en/latest/conf_ref.html) to see all available options

### RPM Fusion

Follow the instructions on [RPM Fusion Configuration page](https://rpmfusion.org/Configuration#Important_notes) to enable RPM Fusion repositories on Fedora

```sh
# Enable access to both the free and the nonfree repository
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# On Fedora, the default is openh264, so we have to explicitly enable
sudo dnf config-manager --enable fedora-cisco-openh264

sudo dnf update @core
```

### Multimedia codecs

- You may need to install few media codecs that weren't present in the minimal free and open sources codecs in the fresh installation
- Refer the [Fedora docs](https://docs.fedoraproject.org/en-US/quick-docs/installing-plugins-for-playing-movies-and-music/) as well as the [RPMFusion docs](https://rpmfusion.org/Howto/Multimedia) and only install what's **relevant to your machine** specifications. Avoid the firmware commands. Mine is an AMD system so I do:

```sh
# Install additional multimedia plugins
sudo dnf group info Multimedia
sudo dnf group install Multimedia

# FFMPEG full
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf install ffmpegthumbnailer

# Hardware codecs with AMD (mesa)
sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
```

### Flathub

Flatpak is installed by default on Fedora, but you need to Enable **Flathub** for accessing a wider range of flatpaks. Refer [Flatpak](https://flatpak.org/setup/Fedora) and [Flathub](https://flathub.org/setup/Fedora) instructions

```sh
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

> Also refer [GNOME-specific setup](../GNOME/README.md)

## Some Fedora quirks

- The **Text Editor** is `gnome-text-editor` instead of `gedit`

- The **Picture-in-Picture** mode doesn't work on Firefox in Fedora as Wayland doesn't support it. Use the [PiP on Top](https://extensions.gnome.org/extension/4691/pip-on-top/) GNOME Shell extension to overcome it

- Use two fingers on touchpad for [Right-click](https://discussion.fedoraproject.org/t/right-click-of-touchpad-does-not-working/70181)

- For C++, neither **GCC** nor **Clang** comes installed with Fedora. Follow [Fedora developer docs](https://developer.fedoraproject.org/tech/languages/c/cpp_installation.html) to install. Use `g++` and `clang++` while compiling

  ```sh
  sudo dnf install -y gcc-c++   # or clang
  ```

- Java comes installed as `openjdk-17`. Note that it has **JRE** NOT **JDK** (`java` command works but `javac` isn't found)

- Python (`python3`, `python`) is already installed; but NOT `pip`. You can install as `python3-pip` package

- Save AppImages in `~/Applications/` folder

> Development variants of packages have `-devel` suffix for RedHat-based distributions and `-dev` suffix for Debian-based distributions. Refer [this post](https://stackoverflow.com/a/55579478)

## Common DNF commands

> Fedora recently upgraded `dnf` to version `dnf5` in Fedora 41 release

Enter `dnf -h` for all available commands

```sh
# Install package(s)
sudo dnf install package1 package2

# Update all packages
sudo dnf up
sudo dnf up --refresh --best

# List all installed packages (grep over it to search something specific)
dnf list --installed

# Search over available packages
dnf search jdk

# Get details about a package such as name, version, summary etc.
dnf info java-17-openjdk-fastdebug

# Remove package(s)
sudo dnf remove package1 package2

# Clear DNF cache (any of these two below)
sudo dnf clean all
# Rebuild dnf cache
sudo dnf makecache
```

### DNF repositories

Your repositories are stored in `/etc/yum.repos.d/` as `.repo` files. Run `dnf repolist` to get list of your repositories

## Common Flatpak commands

Enter `flatpak -h` for all available commands

```sh
# Install a flatpak package
flatpak install md.obsidian.Obsidian

# Update all flatpak packages
flatpak update -y

# List all installed flatpak packages
flatpak list

# Search for a flatpak package
flatpak search obsidian

# Get details about a flatpak package
flatpak info md.obsidian.Obsidian

# Remove flatpak package
flatpak uninstall package1
```

## My `dnf` packages to install

```sh
sudo dnf up --best --refresh -y
sudo dnf install -y \
 wget curl git tmux gcc-c++ clang clang-tools-extra make cmake zip unzip pkg-config \
 fastfetch btop htop hwinfo info zsh lua lua-devel neovim python3-neovim \
 fzf bat jq eza ripgrep zoxide nmap ddcutil dmidecode piper \
 gnome-epub-thumbnailer xxd pdftk texlive-scheme-full texlive-chktex texstudio openssl openssl-devel \
 vlc google-chrome-stable gnome-tweaks grub-customizer
```

**More programs**: [onefetch](https://github.com/o2sh/onefetch/wiki/Installation), [showmethkey](https://github.com/AlynxZhou/showmethekey), [font-manager](https://github.com/FontManager/font-manager)

```sh
# Add Copr of repositories of those packages
sudo dnf copr enable jerrycasiano/FontManager
sudo dnf copr enable varlad/onefetch
sudo dnf copr enable pesader/showmethekey

# Install packages from those added repositories
sudo dnf install -y font-manager onefetch showmethekey
```

[Copr](https://copr.fedorainfracloud.org/) (Cool Other Package Repo) is a Fedora build system, similar to Launchpad for Ubuntu, where contributors and devs publish extra or experimental software. They are used for installing non-official or newer software that’s not in Fedora’s main repos.

### My Flatpak apps to install

```sh
flatpak install --assumeyes flathub \
  com.obsproject.Studio \
  md.obsidian.Obsidian \
  com.usebruno.Bruno \
  com.discordapp.Discord \
  com.jgraph.drawio.desktop \
  com.github.johnfactotum.Foliate \
  com.mattjakeman.ExtensionManager \
  io.github.seadve.Kooha
```

## Fedora Resources

- [DNF command reference](https://dnf.readthedocs.io/en/stable/index.html)
- [**Fedora Quick Docs**](https://docs.fedoraproject.org/en-US/quick-docs/)
  - [Using the DNF software package manager](https://docs.fedoraproject.org/en-US/quick-docs/dnf/)
  - [APT-like commands for DNF](https://docs.fedoraproject.org/en-US/quick-docs/dnf-vs-apt/)
- **Fedora Developer Docs**: [Languages & Databases](https://developer.fedoraproject.org/tech.html) , [Tools](https://developer.fedoraproject.org/tools.html)
