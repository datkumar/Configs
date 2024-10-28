# Fonts 🔤

Installing Fonts in Linux: [article](https://itsfoss.com/install-fonts-ubuntu/)

Install [Font Manager](https://github.com/FontManager/font-manager) from the Software Store

| Font type                               | Location                                                    |
| --------------------------------------- | ----------------------------------------------------------- |
| User fonts                              | `~/.fonts/` or `~/.local/share/fonts/`                      |
| System fonts                            | `/usr/local/share/fonts/`                                   |
| Google Fonts downloaded by Font Manager | `~/.var/app/org.gnome.FontManager/data/fonts/Google\ Fonts` |

In some cases, the Google Fonts downloaded by Font Manager aren't detected by the application, so you can symlink that directory within your user fonts location:

```sh
ln -s ~/.var/app/org.gnome.FontManager/data/fonts/Google\ Fonts ~/.fonts/GoogleFonts
```

Updating the font-cache:

```sh
fc-cache -f
```

List installed fonts:

```sh
fc-list | sort -f
```

You can see name of my downloaded [User fonts list](../config-files/fonts/font-names.txt) as well as [Google fonts list](../config-files/fonts/font-names-google.txt)

## NerdFonts

[NerdFonts GitHub](https://github.com/ryanoasis/nerd-fonts)

You can [preview programming fonts](https://www.programmingfonts.org) as well as [download Nerd fonts](https://www.nerdfonts.com/font-downloads)

Another popular repository is [**Powerline fonts**](https://github.com/powerline/fonts)
