# Fonts 🔤

Installing Fonts in Linux: [article](https://itsfoss.com/install-fonts-ubuntu/)

Install [**Font Manager**](https://github.com/FontManager/font-manager) from the Software Store

| Font type                       | Location                                                    |
| ------------------------------- | ----------------------------------------------------------- |
| User fonts                      | `~/.fonts/` or `~/.local/share/fonts/`                      |
| System fonts                    | `/usr/local/share/fonts/`                                   |
| Google Fonts (via Font Manager) | `~/.var/app/org.gnome.FontManager/data/fonts/Google\ Fonts` |

In some cases, the Google Fonts downloaded by Font Manager aren't detected by the application, so you can symlink that directory within your user fonts location:

```sh
ln -s ~/.var/app/org.gnome.FontManager/data/fonts/Google\ Fonts ~/.fonts/GoogleFonts
```

Updating the font-cache (add `-v` for verbose output):

```sh
fc-cache -f
```

List installed fonts:

```sh
fc-list | sort -f
```

You can see name of my downloaded [User fonts list](https://github.com/datkumar/Configs/blob/main/config-files/fonts/font-names.txt) as well as [Google fonts list](https://github.com/datkumar/Configs/blob/main/config-files/fonts/font-names-google.txt)

## NerdFonts

[NerdFonts GitHub page](https://github.com/ryanoasis/nerd-fonts)

You can [preview programming fonts](https://www.programmingfonts.org) as well as download them from the [NerdFonts download page](https://www.nerdfonts.com/font-downloads)

Another popular repository is [**Powerline fonts**](https://github.com/powerline/fonts)

## My favorite programming fonts

|              Font              | Installation                                                                                                                    |
| :----------------------------: | ------------------------------------------------------------------------------------------------------------------------------- |
|          **0xProto**           | Download [latest release](https://github.com/0xType/0xProto/releases/) zip from their Github                                    |
|      **Geist** by Vercel       | Download `Geist` and `GeistMono` [latest release](https://github.com/vercel/geist-font/releases/) zips from their Github        |
|          **FiraCode**          | Refer their [Linux install guide](https://github.com/tonsky/FiraCode/wiki/Linux-instructions#installing-with-a-package-manager) |
|        **CodeNewRoman**        | [NerdFont Downloads](https://www.nerdfonts.com/font-downloads)                                                                  |
| **Cascadia Code** by Microsoft | Download [latest release](https://github.com/microsoft/cascadia-code/releases) zip from their Github                            |

I save all the `.zip` font downloads into `~/Downloads/Font-Downloads/` folder. Then, extract them all at once in `~/.fonts/` into their respective folders via:

```sh
mkdir -p ~/.fonts
for fontzip in ~/Downloads/Font-Downloads/*.zip; do unzip -qo $fontzip -d ~/.fonts/$(basename $fontzip .zip); done
```

---

## Installing Fonts in Windows

- Download the zips from respective sources and place all in `Font-Download` folder within your Downloads

- In windows, System fonts are stored in `C:\Windows\Fonts` and User fonts in `C:\Users\kumar\AppData\Local\Microsoft\Windows\Fonts` (note that User fonts folder might not exist)

- So the tweaked script to extract contents of zips into respective folders in User fonts folder is as following. Run it in git-bash terminal:

  ```bash
  mkdir -p ~/AppData/Local/Microsoft/Windows/Fonts
  for fontzip in ~/Downloads/Font-Downloads/*.zip; do unzip -qo $fontzip -d ~/AppData/Local/Microsoft/Windows/Fonts/$(basename $fontzip .zip); done
  ```

- To register fonts in Windows, open PowerShell as Admin and run below commands. It recursively traverses your Fonts folder and registers all `.ttf` and `.otf` font files under **Windows Registry** keys:

  ```powershell
  # Register TrueType Font (.ttf) files. Press Enter to continue
  Get-ChildItem -Recurse "$env:LOCALAPPDATA\Microsoft\Windows\Fonts" -Filter *.ttf | ForEach-Object {
    $fontPath = $_.FullName
    $fontName = $_.BaseName
    reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "$fontName (TrueType)" /t REG_SZ /d "$fontPath" /f
  }

  # Register OpenType Font (.otf) files. Press Enter to continue
  Get-ChildItem -Recurse "$env:LOCALAPPDATA\Microsoft\Windows\Fonts" -Filter *.otf | ForEach-Object {
    $fontPath = $_.FullName
    $fontName = $_.BaseName
    reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "$fontName (OpenType)" /t REG_SZ /d "$fontPath" /f
  }
  ```

- Restart computer. Then check in `Fonts` in Control Panel
