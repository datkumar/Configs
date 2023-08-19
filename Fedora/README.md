# Fedora 🎩

- Text Editor is `gnome-text-editor` instead of `gedit` 
- Python is already installed: `python3`, `python` 
## Install ZSH:

[Installing ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

[Fedora Magazine page](https://fedoramagazine.org/set-zsh-fedora-system/)

[Tecmint article](https://www.tecmint.com/install-zsh-shell-in-fedora/)


```sh
sudo dnf update
sudo dnf install zsh

# Running zsh opens the first run wizard
zsh
# Select your sutiable options in that wizard to save

# Run below line if 'chsh' not installed
sudo dnf install util-linux-user
# View all available SHELLs
chsh -l
# Make 'zsh' the default SHELL
chsh -s $(which zsh)

```

---
### Oh-My-Zsh:

[Irenapova blogpost (zsh,omz,powerlevel10k)](https://irenapopova.com/blog/zsh%20shell-post/)


[Website](https://ohmyz.sh/), [GitHub](https://github.com/ohmyzsh/ohmyzsh/)

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```