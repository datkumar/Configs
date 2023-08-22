# Fonts 🔤

Installing Fonts in Linux: [article](https://www.linuxfordevices.com/tutorials/linux/install-a-font-in-linux)

Install [Font Manager](https://github.com/FontManager/font-manager) from Software Store

---

| **Font type**                       | **Location**                                   |
| ----------------------------------- | ---------------------------------------------- |
| User's Fonts                        | `~/.local/share/fonts/`                        |
| System Fonts                        | `/usr/local/share/fonts/`                      |
| Fonts downloaded by the Font Manger | `~/.var/app/org.gnome.FontManager/data/fonts/` |

Optionally, you can also store user fonts in `~/.fonts/`

---

Update font-cache: `sudo fc-cache -f -v`

---

## NerdFonts:-

[GitHub](https://github.com/ryanoasis/nerd-fonts)

[Preview & Download fonts](https://www.nerdfonts.com/font-downloads)

---

- Store all font downloads in `~/Downloads/NerdFonts`
- Then, move all those fonts to the system fonts location:

  `sudo mv ~/Downloads/NerdFonts/* /usr/local/share/fonts/`

- Move the Font Manager Downloaded fonts into system fonts location:

  `sudo mv ~/.var/app/org.gnome.FontManager/data/fonts/* /usr/local/share/fonts/`

---

[List all installed fonts](https://www.cyberciti.biz/tips/quickly-list-all-available-fonts.html): `fc-list | sort -f`

[Fonts in fresh installation of Fedora](./FedoraInstalledFonts.txt)

[My Current list of installed fonts](./FontsLinux.txt)
