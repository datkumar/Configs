# Node.js <img alt="Node.js" src='https://upload.wikimedia.org/wikipedia/commons/d/d9/Node.js_logo.svg' height="25">

## Install Node.js via `fnm`

The [Fast Node Manager (`fnm`)](https://github.com/Schniz/fnm) is a fast, cross-platform node version manager written in Rust. Earlier I was using [`nvm`](https://github.com/nvm-sh/nvm)

On the [Node.js download via package manager](https://nodejs.org/en/download/package-manager) page, select the highest `LTS` Node version, on `Linux` and using `fnm` to get a list of bash commands you'll enter in the terminal:

- Install `fnm`:

  ```sh
  curl -fsSL https://fnm.vercel.app/install | bash
  ```

- View your Shell profile file (`~/.zshrc` or `~/.bashrc`). It would've added the `fnm` installation location to your `PATH` as:

  ```sh
  FNM_PATH="/home/kumar/.local/share/fnm"
  if [ -d "$FNM_PATH" ]; then
    export PATH="/home/kumar/.local/share/fnm:$PATH"
    eval "`fnm env`"
  fi
  ```

- For Shell completions, refer their [Shell setup section](https://github.com/Schniz/fnm?tab=readme-ov-file#shell-setup). For ZSH, add these lines at end of the file:

  ```sh
  eval "$(fnm env --use-on-cd --shell zsh)"
  ```

- Reload your shell to load those changes and activate fnm:

  ```sh
  exec $(which $SHELL)
  ```

- Install latest LTS Node.js version:

  ```sh
  fnm install --lts
  ```

- Verify Node.js installation:

  ```sh
  node -v
  npm -v
  ```

### Common `fnm` commands

```sh
fnm -h # Commands Help
fnm -V # Get FNM version
fnm list # or "fnm ls" to list your installed node versions
fnm list-remote # list all available remote node versions
fnm install 22 # install a specific node version
fnm current # node version you're currently using
fnm use 22 # switch to a node version
fnm use --install-if-missing 20 # install and use specific node version
fnm uninstall 22
```

> We use `fnm` to install Node, and `pnpm` as the package manager for our projects

## Install `pnpm`

[`pnpm`](https://pnpm.io/) is a fast, space-efficient package manager for Node. It re-uses packages across the `node_modules/` folders of all your packages with the help of **symlinks**. It also has a robust lockfile management mechanism making dependency resolution much better, leading to faster downloads and builds

- As per the [pnpm Installation](https://pnpm.io/installation) page. to install `pnpm` on POSIX systems:

  ```sh
  wget -qO- https://get.pnpm.io/install.sh | sh -
  ```

- View your Shell profile file (`~/.zshrc` or `~/.bashrc`). It would've added the `pnpm` installation location to your `PATH` as:

  ```sh
  # pnpm
  export PNPM_HOME="/home/kumar/.local/share/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
  # pnpm end
  ```

- Reload shell and verify `pnpm` installed:

  ```sh
  exec $(which $SHELL)
  pnpm -v
  pnpm
  ```

### `npm` vs `pnpm` commands

| npm command                                       | pnpm equivalent                                 |
| ------------------------------------------------- | ----------------------------------------------- |
| `npm install` (all project packages)              | [`pnpm install`](https://pnpm.io/cli/install)   |
| `npm install <package>` (also `-g` or `-D` flags) | [`pnpm add <package>`](https://pnpm.io/cli/add) |
| `npm run <scriptname>`                            | [`pnpm <scriptname>`](https://pnpm.io/cli/run)  |
| `npx <package>`                                   | [`pnpm dlx <package>`](https://pnpm.io/cli/dlx) |
