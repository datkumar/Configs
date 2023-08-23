# ZSH <img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG6kvdvxprAVso5OdcNtmyB5r1-CugXKHvDoHZD1POf8Oc0ZlghezIMxPBlABG21VxTT8&usqp=CAU' width="20">

[OMZ GitHub guide](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) , [Fedora Magazine page](https://fedoramagazine.org/set-zsh-fedora-system/) , [Tecmint article](https://www.tecmint.com/install-zsh-shell-in-fedora/)

```sh
sudo dnf update
sudo dnf install -y zsh

# Running zsh opens the first run wizard
zsh
# Select your sutiable options in that wizard to save

# If 'chsh' not installed, run below line
sudo dnf install -y util-linux-user
# View all available SHELLs
chsh -l
# Make 'zsh' the default SHELL
chsh -s $(which zsh)
```

---

### Oh-My-Zsh:

Themes: [OMZ-Included](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes) , [Extended](https://github.com/ohmyzsh/ohmyzsh/wiki/External-themes), [powerlevel10k](https://github.com/romkatv/powerlevel10k)

[Irenapova blogpost (zsh,omz,powerlevel10k)](https://irenapopova.com/blog/zsh%20shell-post/)

[Website](https://ohmyz.sh/), [GitHub](https://github.com/ohmyzsh/ohmyzsh/)

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

---

> Ensure at least one powerline/nerd font is installed to support special oh-my-zsh themes like 'agnoster' . Refer [Fonts Guide](../Fonts/README.md)

---

### Gnome-Terminal Color Schemes:

Articles: [BytesBuzz](https://www.bytesbuzz.com/best-ubuntu-terminal-themes-and-color-schemes/) , [FreeCodeCamp](https://www.freecodecamp.org/news/jazz-up-your-zsh-terminal-in-seven-steps-a-visual-guide-e81a8fd59a38/)

> Basic Profile:

- Size: `120` col x `35` row
- Font: `CodeNewRoman`
- Color: `Gnome dark`
- Palette: `Tango`

Themes: [hyper-snazzy (creates separate profile)](https://github.com/tobark/hyper-snazzy-gnome-terminal) , [Gogh](https://gogh-co.github.io/Gogh/)
