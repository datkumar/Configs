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

# Oh-My-Zsh (OMZ)

It provides plugin manager, SHELL prompt

Themes: [OMZ-Included](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes) , [Extended](https://github.com/ohmyzsh/ohmyzsh/wiki/External-themes), [powerlevel10k](https://github.com/romkatv/powerlevel10k)

[Irenapova blogpost (zsh,omz,powerlevel10k)](https://irenapopova.com/blog/zsh%20shell-post/)

[Website](https://ohmyz.sh/), [GitHub](https://github.com/ohmyzsh/ohmyzsh/)

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

---

> Ensure at least one powerline/nerd font is installed to support special oh-my-zsh themes like 'agnoster' . Refer [Fonts Guide](../Fonts/README.md)

> [**Starship**](https://starship.rs/) Shell Prompt instead of OMZ: [YT_vid](https://www.youtube.com/watch?v=VgTu1_92U0U) , [Sample_config](https://github.com/andrew8088/dotfiles/blob/main/starship/starship.toml)

## Gnome-Terminal Color Schemes:

Articles: [BytesBuzz](https://www.bytesbuzz.com/best-ubuntu-terminal-themes-and-color-schemes/) , [FreeCodeCamp](https://www.freecodecamp.org/news/jazz-up-your-zsh-terminal-in-seven-steps-a-visual-guide-e81a8fd59a38/)

> Basic Profile:

- Size: `120` col x `35` row
- Font: `CodeNewRoman`
- Theme: `Gnome dark`
- Colors: `Tango`

Themes: [hyper-snazzy (creates new profile)](https://github.com/tobark/hyper-snazzy-gnome-terminal) , [Gogh](https://gogh-co.github.io/Gogh/)

---

## CLI Utilities

| _Package_                                                       | _Description_ |
| --------------------------------------------------------------- | ------------- |
| [**`fzf`**](https://github.com/junegunn/fzf)                    | Fuzzy finder  |
| [**`bat`**](https://github.com/sharkdp/bat)                     | Colored `cat` |
| [**`exa`**](https://github.com/ogham/exa)                       | Colored `ls`  |
| [**`jq`**](https://github.com/jqlang/jq)                        | Pretty JSON   |
| [**ripgrep**](https://github.com/BurntSushi/ripgrep) (**`rg`**) | Regex `grep`  |
| [**zoxide**](https://github.com/ajeetdsouza/zoxide) (**`z`**)   | Smarter `cd`  |

To install all of the above at one in Fedora:

```sh
sudo dnf install -y fzf bat exa jq ripgrep zoxide
```

Using these utils: [YT vid](https://youtu.be/2OHrTQVlRMg?si=KrgRvyDCGMuHHEJc)

> More optional utils:

- Fast, user-friendly `find` : [**`fd`**](https://github.com/sharkdp/fd)
- Multiple Runtime version manager : [**`asdf`**](https://asdf-vm.com/)
- Fix previous command : [**thefuck**](https://github.com/nvbn/thefuck)
- Run arbitrary commands on file change : [**`entr`**](https://github.com/clibs/entr)
- Midnight Commander, a visual file manager : [**`mc`**](https://github.com/MidnightCommander/mc)

---

### ZSH Plugins

- First see if it's present in the [List of plugins available for OMZ](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)

- Else, you'll need to put them inside in the `$ZSH_CUSTOM/plugins` folder. The `ZSH_CUSTOM` variable is by deafult `~/.oh-my-zsh/custom`

- Finally specify your plugins for zsh to load as `plugins=(git dnf ...)` in the `~/.zshrc` file

OMZ plugin guides: [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) , [dnf](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dnf) , [flutter](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/flutter) , [history](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/history)

> To view all set aliases at one just enter `alias` in terminal

More ZSH utils: [blog](https://safjan.com/top-popular-zsh-plugins-on-github-2023/)

### ZSH Auto-suggestions & Syntax Highlighting

> These are't included by OMZ

Installation instructions: [**zsh-autosuggestions**](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh) , [**zsh-syntax-highlighting**](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)

Below commands clone the two repos into `$ZSH_CUSTOM/plugins/`

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Make sure to include them in the `plugins=(...)` array inside `~/.zshrc` file

---

### Final ZSH Profile

The starting OMZ profile upon first install is available as `~/.oh-my-zsh/templates/zshrc.zsh-template`

```sh
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

# --------------------------------------------------------
# NVM setup (Automatically done during installation)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# pnpm setup (Automatically done during installation)
# pnpm
export PNPM_HOME="/home/kumar/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# --------------------------------------------------------
# Add binary executable locations of programs to PATH:

# Python3 👉️ Already present at /usr/bin/python3

# If multiple Java installations on system, use the 'alternatives'
# directives of Linux to manage, add & switch versions
# If single installation, set environment variables as done below:
# OpenJDK Java 20 👇️ (installed via IntelliJ)
# export JAVA_HOME=$PATH:$HOME/.jdks/openjdk-20.0.2
# export PATH=$PATH:$JAVA_HOME/bin

# Flutter 👇️
export PATH=$PATH:$HOME/FlutterSdks/flutter/bin
export CHROME_EXECUTABLE=$(which firefox)

# Go 👇️
export PATH=$PATH:/usr/local/go/bin

# Rust 👇️
export PATH=$PATH:$HOME/.cargo/bin
# --------------------------------------------------------

zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# ENABLE_CORRECTION="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins to load:
# Standard from $ZSH/plugins/ & Custom from $ZSH_CUSTOM/plugins/
plugins=(
    git
    dnf
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Load OMZ into ZSH
source $ZSH/oh-my-zsh.sh

# Initialise zoxide in zsh
eval "$(zoxide init zsh)"

# Custom aliases, that override omz, plugins etc
alias cls="clear"
alias refreshenv="exec $(which $SHELL)"
alias gedit="gnome-text-editor" # For Fedora only
alias zshconfig="gedit ~/.zshrc"

# Make outputs more colorful:
alias ls="exa"
alias la="exa -a"
alias ll="exa -alh"
alias tree="exa --tree"
alias cat=bat
# colorizing pager for man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
# bat as a previewer for fzf
alias fzf="fzf --preview 'bat --color=always --line-range=:500 {}' --preview-window '~3'"
```

---
