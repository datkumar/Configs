# Python <img alt="NeoVim" src="../assets/python.svg" height="28">

## Install `uv`

[`uv`](https://docs.astral.sh/uv/) is a fast Python package and project manager, written in Rust. A single tool to replace `pip`, `pip-tools`, `pipx`, `poetry`, `pyenv`, `twine`, `virtualenv`, and more

As per their [installation instructions](https://docs.astral.sh/uv/getting-started/installation/):

```sh
wget -qO- https://astral.sh/uv/install.sh | sh
```

## Dev `venv` setup

- Install latest python version. Default is `cpython`, refer [Python install](https://docs.astral.sh/uv/guides/install-python/) section for more

  ```sh
  uv python install
  ```

- Create virtual environment `dev-tools` inside `~/.venv-global/`

  ```sh
  # GO into desired directory
  mkdir -p ~/.venv-global
  cd ~/.venv-global

  # Create virtual environment
  uv venv dev-tools
  ```

- Activate that virtual environment:

  ```sh
  source ~/.venv-global/dev-tools/bin/activate
  ```

- Install desired packages in your:

  ```sh
  uv pip install ruff mypy debugpy pynvim
  deactivate
  ```

- List installed packages to verify:

  ```sh
  $ uv pip list
  Using Python 3.13.5 environment at: /home/kumar/.venv-global/dev-tools
  Package           Version
  ----------------- -------
  debugpy           1.8.15
  greenlet          3.2.3
  msgpack           1.1.1
  mypy              1.17.0
  mypy-extensions   1.1.0
  pathspec          0.12.1
  pynvim            0.5.2
  ruff              0.12.5
  typing-extensions 4.14.1
  ```

- Add these lines to shell config (`~/.bashrc` or `~/.zshrc`):

  ```sh
  # Ensures uv binary and ~/.local/bin are in PATH)
  [ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

  # Add 'dev-tools' virtual environment's bin directory to PATH.
  export PATH="$HOME/.venvs/dev-tools/bin:$PATH"
  ```

  You can also add an alias to activate the environment:

  ```sh
  alias start-dev-venv="source $HOME/.venv-global/dev-tools/bin/activate"
  ```

- Some packages like [`pyright`](https://microsoft.github.io/pyright) are available via `npm`, which you can install globally (assuming you have Node installed, refer [Node.js page](../NodeJs/README.md) to know more):

  ```sh
  # Via pnpm
  pnpm add -g pyright
  # Via npm
  npm i -g pyright
  ```
