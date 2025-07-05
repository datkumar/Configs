# Terminal setup <img alt="Terminal" src='https://upload.wikimedia.org/wikipedia/commons/d/da/GNOME_Terminal_icon_2019.svg' height="25">

The default shell is `sh` that is symlinked to `bash` in most Linux systems

> Ensure at least one **Powerline or Nerd Font** is installed to support special characters or glyphs in your theme. Refer my [Fonts Guide](../Fonts/README.md)

## Shell: ZSH <img alt="ZSH" src="https://raw.githubusercontent.com/Zsh-art/logo/refs/heads/main/svg/color_logomark.svg" width="25" >

<!-- Referred from: [OMZ GitHub guide](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) , [Fedora Magazine page](https://fedoramagazine.org/set-zsh-fedora-system/) , [Tecmint article](https://www.tecmint.com/install-zsh-shell-in-fedora/) -->

- Install the `zsh` shell via your package manager

  ```sh
  # Fedora (dnf):
  sudo dnf install -y zsh
  # Ubuntu (apt):
  sudo apt install -y zsh
  ```

- Make `zsh` as your default shell. Ensure the `chsh` command is found on your system

  ```sh
  # List all available shells
  cat /etc/shells
  # Make 'zsh' the default shell
  chsh -s $(which zsh)
  ```

- Reboot the system. Open the terminal, it opens the **setup wizard** asking for multiple options to configure ZSH. In the wizard, select options as per your preference. These will be saved in your Shell config file i.e. `~/.zshrc`

- Ensure your shell being loaded is zsh whenever you open terminal

  ```sh
  echo $SHELL
  # The output should be: /usr/bin/zsh
  ```

Instead of just one `.zshrc` file, you can separate your ZSH config into these files:

| Config file   | Purpose                                                                                                                                                        |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `~/.zshenv`   | Loaded for all `zsh` invocations (whether it's interactive login or scripts). Used to store environment variables like `PATH`, `EDITOR`, `LANG` etc.           |
| `~/.zshrc`    | Loaded in non-login interactive shell, such as when you open the terminal. Used to store aliases, shell prompt, load plugins or functions, some UI tweaks etc. |
| `~/.zprofile` | Loaded only ONCE per session in your login shell. Used for session setup (like example SSH stuff), starting services etc.                                      |

You can refer my [`.zshrc`](https://github.com/datkumar/Configs/blob/main/config-files/.zshrc) config file

### ZSH Plugins (manual updates)

- Since I'm not using [Oh-My-Zsh](https://ohmyz.sh/) which acts like a plugin manager for ZSH plugins, I would need to manually download and update my required plugins. This isn't much of an issue since most of those plugins are just ZSH shell scripts. You can browse the list of [OMZ plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins) or download from other sources

- I'm storing my ZSH plugins in `~/.zsh_plugins`:

  ```sh
  mkdir -p ~/.zsh_plugins

  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh_plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh_plugins/zsh-syntax-highlighting
  ```

<!-- ## Oh-My-Zsh (OMZ) <img alt="Oh-My-ZSH" src="https://ohmyz.sh/img/ohmyzsh-original-logo.svg" width="25">

It provides many plugins, themes etc for ZSH

**OMZ Install**:

As per the [OMZ Website](https://ohmyz.sh/) and [OMZ GitHub](https://github.com/ohmyzsh/ohmyzsh/)

```sh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

Themes: [OMZ themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes) , [Extended themes](https://github.com/ohmyzsh/ohmyzsh/wiki/External-themes), [powerlevel10k](https://github.com/romkatv/powerlevel10k)

---

### OMZ Plugins

- First see if that plugin is present in the [list of plugins available for OMZ](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
- Else, you'll need to put them inside in the `$ZSH_CUSTOM/plugins` folder. The `ZSH_CUSTOM` variable is by default `~/.oh-my-zsh/custom`
- Finally specify your plugins for zsh to load as `plugins=(git dnf ...)` in the `~/.zshrc` file

To view all set aliases at once just enter `alias` in terminal

More ZSH utils: [blog](https://safjan.com/top-popular-zsh-plugins-on-github-2023/)

#### ZSH Auto-suggestions and Syntax-highlighting

> These are't included by OMZ

Installation instructions: [**zsh-autosuggestions**](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh) , [**zsh-syntax-highlighting**](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)

Below commands clone the two repos into `$ZSH_CUSTOM/plugins/`

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Make sure to include them in the `plugins=(...)` array inside `~/.zshrc` file

The starting default OMZ profile is available at `~/.oh-my-zsh/templates/zshrc.zsh-template`

-->

---

## Shell prompt: Starship <img alt="Starship" src="https://starship.rs/icon.png" width="25">

- Install Starship by following their [install guide](https://starship.rs/guide/):

  ```sh
  curl -sS https://starship.rs/install.sh | sh
  ```

- Add this line at the end in `~/.zshrc` file:

  ```sh
  # Initialize Starship prompt:
  eval "$(starship init zsh)"
  ```

- Create the `~/.config/starship.toml` config file and paste following starter contents:

  ```toml
  # Get editor completions based on the config schema
  "$schema" = 'https://starship.rs/config-schema.json'

  # Inserts a blank line between shell prompts
  add_newline = true

  # Replace the '❯' symbol in the prompt with '➜'
  [character] # The name of the module we are configuring is 'character'
  success_symbol = '[➜](bold green)' # The 'success_symbol' segment is being set to '➜' with the color 'bold green'

  # Disable the package module, hiding it from the prompt completely
  [package]
  disabled = true
  ```

  You can refer their [Configuration page](https://starship.rs/config/) and my [`starship.toml`](https://github.com/datkumar/Configs/blob/main/config-files/.zshrc) file

---

## Terminal Emulator: WezTerm <img alt="WezTerm" src="https://raw.githubusercontent.com/wezterm/wezterm/refs/heads/main/assets/icon/wezterm-icon.svg" width="25" >

It is my preferred GPU-accelerated terminal emulator. Other popular options are [Alacritty](https://alacritty.org/) and [Kitty](https://sw.kovidgoyal.net/kitty/)

Following their [Linux install](https://wezterm.org/install/linux.html) instructions:

- Install `wezterm` for your distro:

  ```sh
  # Fedora (copr recommended):
  sudo dnf copr enable wezfurlong/wezterm-nightly
  sudo dnf install wezterm

  # Ubuntu (configure apt):
  curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
  echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
  sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
  sudo apt update
  sudo apt install wezterm
  ```

- WezTerm uses the Lua language syntax for configuration in the `~/.wezterm.lua` config file, so create it and paste following starter contents

  ```lua
  -- Pull in the wezterm API
  local wezterm = require 'wezterm'

  -- This will hold the configuration.
  local config = wezterm.config_builder()

  -- Changing the initial geometry for new windows:
  config.initial_cols = 120
  config.initial_rows = 28

  -- Changing the font size and color scheme.
  config.font_size = 10
  config.color_scheme = 'AdventureTime'

  -- Finally, return the configuration to wezterm:
  return config
  ```

- Refer their [Configuration page](https://wezterm.org/config/files.html) and my [`~/.wezterm.lua`](https://github.com/datkumar/Configs/blob/main/config-files/.zshrc) config file for more options

<!-- ## Alacritty <img alt="Alacritty" src='https://upload.wikimedia.org/wikipedia/commons/9/90/Alacritty_logo.svg' width="25">

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

- Install the required dependencies as per your distro by referring their [Dependencies](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#dependencies) section

  ```sh
  # Fedora (dnf)
  sudo dnf install cmake freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel g++ scdoc

  # Ubuntu (apt)
  sudo apt install cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
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

- Install alacritty terminfo (if you want to keep `TERM = "alacritty"`) in your Alacritty config (`~/.alacritty.toml`)

  ```sh
  # Go into "extra" inside the cloned repo folder
  cd ~/alacritty/extra

  # Add the terminfo
  tic -x alacritty.info
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

- Add a custom keyboard shortcut (I set it as `Super + T`) to launch `alacritty` command instead of the usual terminal command

- Your Alacritty settings are kept in `~/.alacritty.toml` config file (create one if it doesn't exist) so edit it to personalize your terminal. You can refer [my `.alacritty.toml` file](https://github.com/datkumar/Configs/blob/main/config-files/.alacritty.toml) as well as their [Configuration page](https://alacritty.org/config-alacritty.html) for more options -->

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

Install those utils via your package manager:

```sh
# Fedora (dnf)
sudo dnf install -y fzf bat jq eza ripgrep zoxide

# Ubuntu (apt)
sudo apt install -y fzf bat jq eza ripgrep zoxide
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
