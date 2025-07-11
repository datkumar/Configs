# Terminal setup <img alt="Terminal" src="/assets/zsh.svg" height="28">

The default shell is `sh` that is symlinked to `bash` in most Linux distros

> Ensure at least one **Powerline or Nerd Font** is installed to support special characters or glyphs in your theme. Refer my [Fonts Guide](../Fonts/README.md)

---

## Shell: ZSH <img alt="ZSH" src="/assets/zsh.svg" height="25" >

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

<br>

Instead of just one `.zshrc` file, you can separate your ZSH config into these files:

| Config file   | Purpose                                                                                                                                                        |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `~/.zshenv`   | Loaded for all `zsh` invocations (whether it's interactive login or scripts). Used to store environment variables like `PATH`, `EDITOR`, `LANG` etc.           |
| `~/.zshrc`    | Loaded in non-login interactive shell, such as when you open the terminal. Used to store aliases, shell prompt, load plugins or functions, some UI tweaks etc. |
| `~/.zprofile` | Loaded only ONCE per session in your login shell. Used for session setup (like example SSH stuff), starting services etc.                                      |

You can refer my `.zshrc` and `.zshenv` config files

<br>

### ZSH Plugins (manual updates)

- Since I'm not using [Oh-My-Zsh](https://ohmyz.sh/) which acts like a plugin manager for ZSH plugins, I would need to manually download and update my required plugins. This isn't much of an issue since most of those plugins are just ZSH shell scripts. You can browse the list of [OMZ plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins) or download from other sources

- I'm storing my ZSH plugins in `~/.zsh_plugins`:

  ```sh
  mkdir -p ~/.zsh_plugins
  # Download the plugin repos
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh_plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh_plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-completions.git ~/.zsh_plugins/zsh-completions
  ```

---

## Terminal Emulator: WezTerm <img alt="WezTerm" src="/assets/wezterm.svg" height="25" >

[WezTerm](https://wezterm.org/index.html) is my preferred [GPU-accelerated terminal emulator](https://www.howtogeek.com/what-is-gpu-acceleration-in-linux-terminals/). Other popular options are [Alacritty](https://alacritty.org/), [Kitty](https://sw.kovidgoyal.net/kitty/) or [Ghostty](https://ghostty.org/)

Following the [Linux install](https://wezterm.org/install/linux.html) instructions:

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

- WezTerm uses the Lua for configuration in the `~/.wezterm.lua` config file, so create it and paste following starter contents

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

- Sometimes, you might need to install the terminfo file for Wezterm for supporting all it's new features:

  ```sh
  cd ~
  # Download latest terminfo from GitHub (check that URL exists)
  curl -LO https://raw.githubusercontent.com/wez/wezterm/main/termwiz/data/wezterm.terminfo
  # Compile and install it for your user
  tic -x ~/wezterm.terminfo
  # Now, you can remove the downloaded terminfo file
  rm ~/wezterm.terminfo
  ```

  It is installed as `~/.terminfo/w/wezterm`

- Refer my `~/.wezterm.lua` config file and their [Configuration page](https://wezterm.org/config/files.html) for more info

---

## Shell prompt: Starship <img alt="Starship" src="/assets/starship.png" height="25">

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

  You can refer my `starship.toml` file and their [Configuration page](https://starship.rs/config/) for more info

---

## Useful CLI Utils

| Package                                                         | Description   |
| --------------------------------------------------------------- | ------------- |
| [**`fzf`**](https://github.com/junegunn/fzf)                    | Fuzzy finder  |
| [**`bat`**](https://github.com/sharkdp/bat)                     | Colored `cat` |
| [**`eza`**](https://github.com/eza-community/eza)               | Colored `ls`  |
| [**`jq`**](https://github.com/jqlang/jq)                        | Pretty JSON   |
| [**ripgrep**](https://github.com/BurntSushi/ripgrep) (**`rg`**) | Regex `grep`  |
| [**zoxide**](https://github.com/ajeetdsouza/zoxide) (**`z`**)   | Smarter `cd`  |

Install those utils via your package manager:

```sh
# Fedora (dnf):
sudo dnf install -y fzf bat jq eza ripgrep zoxide
# Ubuntu (apt):
sudo apt install -y fzf bat jq eza ripgrep zoxide
```

Watch this video for a quick demo showcase 👇

<iframe width="480" height="270" src="https://www.youtube.com/embed/2OHrTQVlRMg?si=ty6XNzzHYQAW4Qe5" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

**More optional utils:**

- Fast, user-friendly `find` : [**`fd`**](https://github.com/sharkdp/fd)
- Multiple Runtime version manager : [**`asdf`**](https://asdf-vm.com/)
- Run arbitrary commands on file change : [**`entr`**](https://github.com/clibs/entr)
- Midnight Commander, a visual file manager : [**`mc`**](https://github.com/MidnightCommander/mc)
