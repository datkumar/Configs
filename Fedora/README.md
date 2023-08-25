# Fedora <img src='https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Fedora_icon_%282021%29.svg/2089px-Fedora_icon_%282021%29.svg.png' width="30">

- Text Editor is `gnome-text-editor` instead of `gedit`
- Python (`python3`, `python`) is already installed; but NOT pip (`python3-pip`).
- Searching which package provides given command (like `g++`): [this post](https://unix.stackexchange.com/questions/701583/what-is-the-link-between-g-and-gcc-c-in-fedoras-dnf-repositories)
- GCC isn't installed. Refer [their guide](https://developer.fedoraproject.org/tech/languages/c/cpp_installation.html) & [this post](https://stackoverflow.com/questions/12952913/how-do-i-install-g-for-fedora): `sudo dnf install -y gcc-c++`

## DNF

[DNF Configuration Guide](https://dnf.readthedocs.io/en/latest/conf_ref.html)

[DNF Quick Docs](https://docs.fedoraproject.org/en-US/quick-docs/dnf/)

[Fedora docs package management guide](https://docs.fedoraproject.org/en-US/fedora/latest/system-administrators-guide/package-management/DNF/)

[Fedora third-part repos](https://docs.fedoraproject.org/en-US/workstation-working-group/third-party-repos)

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
