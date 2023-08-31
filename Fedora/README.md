# Fedora <img src='https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Fedora_icon_%282021%29.svg/2089px-Fedora_icon_%282021%29.svg.png' width="30">

- Fedora developer guides: [Languages & Databases](https://developer.fedoraproject.org/tech.html) , [Tools](https://developer.fedoraproject.org/tools.html)

- Text Editor is `gnome-text-editor` instead of `gedit`

- Java is already installed as `openjdk-17`. But it has **JREs** NOT **JDKs** (`java` command works but `javac` doesn't)

- Python (`python3`, `python`) is already installed; but NOT pip (install `python3-pip` package)

- Neither GCC nor CLang comes installed with Fedora. For C++ on Fedora, follow [their guide](https://developer.fedoraproject.org/tech/languages/c/cpp_installation.html). Use `g++` and `clang++` while compiling.

  ```sh
  sudo dnf install -y gcc-c++   # or clang
  ```

- Picture-in-Picture mode doesn't work on Firefox in Fedora as Wayland doesn't support it. Use the [PiP on Top](https://extensions.gnome.org/extension/4691/pip-on-top/) GNOME extension to overcome it

## DNF

Run `sudo dnf update -y` before installing new packages

[DNF Configuration Guide](https://dnf.readthedocs.io/en/latest/conf_ref.html)

[DNF Quick Docs](https://docs.fedoraproject.org/en-US/quick-docs/dnf/)

Development variants of packages have `-devel` suffix for RedHat-based distributions (Debian-based distros have `-dev` suffix). Refer [this post](https://stackoverflow.com/a/55579478)

[APT-like commands for DNF](https://docs.fedoraproject.org/en-US/quick-docs/dnf-vs-apt/)

[Fedora docs package management guide](https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/package-management/DNF/)

[Fedora third-part repos](https://docs.fedoraproject.org/en-US/workstation-working-group/third-party-repos)

Searching which package provides given command (like `g++`): [this post](https://unix.stackexchange.com/questions/701583/what-is-the-link-between-g-and-gcc-c-in-fedoras-dnf-repositories)

Clear DNF cache: `sudo dnf clean dbcache` or `sudo dnf clean all`

```sh
# Find package
dnf search
dnf list
dnf group list
dnf list all
dnf info
dnf repoquery

# Install / Uninstall
dnf install
dnf remove
dnf autoremove
dnf erase

# Update
dnf update
dnf check-update
dnf upgrade
```

[List installed packages on Fedora](https://linuxopsys.com/topics/list-installed-packages-fedora)
