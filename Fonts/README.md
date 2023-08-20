# Fonts 🔤

Installing Fonts in Linux: [article](https://www.linuxfordevices.com/tutorials/linux/install-a-font-in-linux)

Install [Font Manager](https://github.com/FontManager/font-manager) from Software Store

---

User's Fonts located in `~/.local/share/fonts/`

System Fonts located in `/usr/local/share/fonts/`

Update font-cache: `sudo fc-cache -f -v`

[List all installed fonts](https://www.cyberciti.biz/tips/quickly-list-all-available-fonts.html): `fc-list | sort -f`

---

## NerdFonts:

[GitHub](https://github.com/ryanoasis/nerd-fonts)

[Preview & Download fonts](https://www.nerdfonts.com/font-downloads)

---

- Store all font downloads in `~/Downloads/NerdFonts`
- Then, move all those fonts to the system fonts location:

  `sudo mv ~/Downloads/NerdFonts/* /usr/local/share/fonts/`

---

[Fonts in fresh installation of Fedora](./FedoraInstalledFonts.txt)

[Current list of installed fonts](./FontsLinux.txt)
