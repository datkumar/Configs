# Terminal setup <img alt="Terminal" src='https://upload.wikimedia.org/wikipedia/commons/d/da/GNOME_Terminal_icon_2019.svg' height="25">

The default shell is `sh` that is symlinked to `bash` in most Linux systems

## The Z Shell (ZSH) <img alt="ZSH" src="https://raw.githubusercontent.com/Zsh-art/logo/refs/heads/main/svg/color_logomark.svg" width="25" >

Referred from: [OMZ GitHub guide](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) , [Fedora Magazine page](https://fedoramagazine.org/set-zsh-fedora-system/) , [Tecmint article](https://www.tecmint.com/install-zsh-shell-in-fedora/)

- Install the `zsh` shell via your package manager

  ```sh
  sudo dnf update
  sudo dnf install -y zsh
  ```

- Make `zsh` as your default shell (If the `chsh` command isn't found, run `sudo dnf install -y util-linux-user`)

  ```sh
  # List all available shells
  chsh -l
  # Make 'zsh' the default shell
  chsh -s $(which zsh)
  ```

- Reboot the system. Open the terminal, it opens the **setup wizard** asking for multiple options to configure ZSH. In the wizard, select options as per your preference. These will be saved in your Shell config file i.e. `~/.zshrc`

- Ensure your shell being loaded is zsh whenever you open terminal

  ```sh
  echo $SHELL
  # The output should be: /usr/bin/zsh
  ```

## Oh-My-Zsh (OMZ) <img alt="Oh-My-ZSH" src="https://ohmyz.sh/img/ohmyzsh-original-logo.svg" width="25">

It provides many plugins, themes etc for ZSH

**OMZ Install**:

As per the [OMZ Website](https://ohmyz.sh/) and [OMZ GitHub](https://github.com/ohmyzsh/ohmyzsh/)

```sh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

Themes: [OMZ themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes) , [Extended themes](https://github.com/ohmyzsh/ohmyzsh/wiki/External-themes), [powerlevel10k](https://github.com/romkatv/powerlevel10k)

> Ensure at least one **powerline or nerd font** is installed to support special characters or glyphs in your theme. Refer my [Fonts Guide](../Fonts/README.md)

<!-- [Irenapova blogpost (zsh,omz,powerlevel10k)](https://irenapopova.com/blog/zsh%20shell-post/) -->

Another new shell prompt alternative is [**Starship**](https://starship.rs/)

<!-- ## Gnome-Terminal Color Schemes

> Basic Profile:

- Size: `120` col x `35` row
- Font: `CodeNewRoman`
- Theme: `Gnome dark`
- Colors: `Tango`

Themes: [hyper-snazzy (creates new profile)](https://github.com/tobark/hyper-snazzy-gnome-terminal) , [Gogh](https://gogh-co.github.io/Gogh/) -->

---

## OMZ Plugins

- First see if that plugin is present in the [list of plugins available for OMZ](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
- Else, you'll need to put them inside in the `$ZSH_CUSTOM/plugins` folder. The `ZSH_CUSTOM` variable is by deafult `~/.oh-my-zsh/custom`
- Finally specify your plugins for zsh to load as `plugins=(git dnf ...)` in the `~/.zshrc` file

To view all set aliases at once just enter `alias` in terminal

More ZSH utils: [blog](https://safjan.com/top-popular-zsh-plugins-on-github-2023/)

### ZSH Auto-suggestions and Syntax-highlighting

> These are't included by OMZ

Installation instructions: [**zsh-autosuggestions**](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh) , [**zsh-syntax-highlighting**](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)

Below commands clone the two repos into `$ZSH_CUSTOM/plugins/`

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Make sure to include them in the `plugins=(...)` array inside `~/.zshrc` file

### Final ZSH Profile

The starting default OMZ profile is available at `~/.oh-my-zsh/templates/zshrc.zsh-template`

You can refer [my `~/.zshrc` shell config file](https://github.com/datkumar/Configs/blob/main/config-files/.zshrc)

---

## Alacritty <img alt="Alacritty" src='https://upload.wikimedia.org/wikipedia/commons/9/90/Alacritty_logo.svg' width="25">

It is a modern cross-platform terminal emulator written in Rust that utilizes your GPU

Referring from the [build instructions for Linux](https://github.com/alacritty/alacritty/blob/master/INSTALL.md) from [their site](https://alacritty.org/)

- Make sure Rust is installed. Refer [my Rust installation page](../Rust/README.md). Then, update `rustup` to latest stable version:

  ```sh
  rustup override set stable
  rustup update stable
  ```

- Clone the Alacritty source code:

  ```sh
  git clone git@github.com:alacritty/alacritty.git
  ```

- Install the required dependencies as per your distro. Mine is Fedora(`dnf`) but you can refer their [Dependencies](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#dependencies) section for your respective distro

  ```sh
  sudo dnf install cmake freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel g++ scdoc
  ```

- Build application from the source code. The built binary should be at `target/release/alacritty`

  ```sh
  cd alacritty
  cargo build --release
  ```

- Create desktop entry for the application:

  ```sh
  sudo cp target/release/alacritty /usr/local/bin
  sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
  sudo desktop-file-install extra/linux/Alacritty.desktop
  sudo update-desktop-database
  ```

- Add manuals i.e. `man` pages:

  ```sh
  sudo mkdir -p /usr/local/share/man/man1
  sudo mkdir -p /usr/local/share/man/man5
  scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
  scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
  scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
  scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null
  ```

- Add completions for your shell. Mine is `zsh` but you can refer their [Shell completions](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#shell-completions) section for your respective shell

  ```sh
  mkdir -p ~/.zsh_functions
  cp extra/completions/_alacritty ~/.zsh_functions/_alacritty
  ```

  Then, add this line at the end of your shell config file (`~/.zshrc`):

  ```sh
  fpath+=~/.zsh_functions
  ```

- Reload shell:

  ```sh
  exec $(which $SHELL)
  ```

- Add a custom keyboard shortcut (I set it as `Super + T`) to launch `alacritty` command instead of the usual terminal command (was `gnome-terminal` in Fedora)

- Your Alacritty settings are kept in `~/.alacritty.toml` config file (create one if it doesn't exist) so edit it to personalize your terminal. You can refer [my `.alacritty.toml` file](https://github.com/datkumar/Configs/blob/main/config-files/.alacritty.toml) as well as their [Configuration page](https://alacritty.org/config-alacritty.html) for more options

---

## CLI Utilities

| _Package_                                                       | _Description_ |
| --------------------------------------------------------------- | ------------- |
| [**`fzf`**](https://github.com/junegunn/fzf)                    | Fuzzy finder  |
| [**`bat`**](https://github.com/sharkdp/bat)                     | Colored `cat` |
| [**`eza`**](https://github.com/eza-community/eza)               | Colored `ls`  |
| [**`jq`**](https://github.com/jqlang/jq)                        | Pretty JSON   |
| [**ripgrep**](https://github.com/BurntSushi/ripgrep) (**`rg`**) | Regex `grep`  |
| [**zoxide**](https://github.com/ajeetdsouza/zoxide) (**`z`**)   | Smarter `cd`  |

Install those utils via your package manager (For Fedora, it's `dnf`)

```sh
sudo dnf install -y fzf bat jq eza ripgrep zoxide
```

Watch this video for a quick demo showcase 👇

<iframe width="480" height="270" src="https://www.youtube.com/embed/2OHrTQVlRMg?si=ty6XNzzHYQAW4Qe5" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

**More optional utils:**

- Fast, user-friendly `find` : [**`fd`**](https://github.com/sharkdp/fd)
- Multiple Runtime version manager : [**`asdf`**](https://asdf-vm.com/)
- Run arbitrary commands on file change : [**`entr`**](https://github.com/clibs/entr)
- Fix previous command : [**thefuck**](https://github.com/nvbn/thefuck)
- Midnight Commander, a visual file manager : [**`mc`**](https://github.com/MidnightCommander/mc)

---
