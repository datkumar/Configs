# Fedora <img src='https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Fedora_icon_%282021%29.svg/2089px-Fedora_icon_%282021%29.svg.png' width="30">

- Text Editor is `gnome-text-editor` instead of `gedit`
- Python (`python3`, `python`) is already installed; but NOT pip (`python3-pip`).
- Searching which package provides given command (like `g++`): [this post](https://unix.stackexchange.com/questions/701583/what-is-the-link-between-g-and-gcc-c-in-fedoras-dnf-repositories)
- GCC isn't installed. Refer [their guide](https://developer.fedoraproject.org/tech/languages/c/cpp_installation.html) & [this post](https://stackoverflow.com/questions/12952913/how-do-i-install-g-for-fedora): `sudo dnf install gcc-c++`

## DNF

[DNF Configuration Guide](https://dnf.readthedocs.io/en/latest/conf_ref.html)

Clear DNF cache: `sudo dnf clean dbcache` or `sudo dnf clean all`
