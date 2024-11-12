# Tmux <img alt="Tmux" src="https://raw.githubusercontent.com/tmux/tmux/c8677d3272b69587d8c4e7e5ef9da405e552e8ae/logo/tmux-logomark.svg" height="25">

> To know the basics of using Tmux, refer [my blogpost](https://datkumar.hashnode.dev/tmux-a-multiverse-of-terminals)

## Installation

Tmux comes installed with most Linux distributions by default. You can check your installed version as:

```sh
tmux -V
```

If `tmux` isn't found, refer their [Installation page](https://github.com/tmux/tmux/wiki/Installing) for instructions

## Configuration

- When it comes to user configuration, Tmux looks for the `.tmux.conf` file within either of the `~` or `$XDG_CONFIG_HOME/tmux` directories. Create the config file at one of these location if none exists

- You should also set up [tpm](https://github.com/tmux-plugins/tpm) to manage various plugins you might want to add to tmux that enhance the default experience such as:

  - [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible): A helpful set of values initialized for tmux options
  - [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect): Save tmux sessions to disk. Then restore them after system reboot (Tmux doesn’t persist sessions across system shutdowns by default)
  - [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum): Automate the saving and restoring of sessions from disk
  - [tmux-yank](https://github.com/tmux-plugins/tmux-yank): Copy your highlighted text to clipboard

You can also refer [my `.tmux.config` file](https://github.com/datkumar/Configs/blob/main/config-files/.tmux.conf)

Check out [awesome-tmux](https://github.com/rothgar/awesome-tmux) for more resources

### Loading your updated config

Attach into a tmux session (create one if none exists) and then:

- To install your plugins: `PrefixKey I`
- To update your plugins: `PrefixKey U` and then type `all`
- Load your config:

  ```sh
  tmux source ~/.tmux.conf
  ```

- Make sure the tmux-resurrect save-directory (by default `~/.tmux/resurrect`) and permissions are given:

  ```sh
  mkdir -p ~/.tmux/resurrect
  chmod 755 ~/.tmux
  ```

- You need to manually save the first tmux snapshot the first time. In your tmux session:
  - To manually save: `PrefixKey Ctrl s`
  - To manually restore: `PrefixKey Ctrl r`
