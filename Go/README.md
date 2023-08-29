# Go <img src='https://cdn.icon-icons.com/icons2/2107/PNG/512/file_type_go_gopher_icon_130571.png' width="28">

## Install:

- Download tarball from [their releases page](https://go.dev/dl/)

- Follow [their installation instructions](https://go.dev/doc/install)

- Open Terminal in your download location

- Remove old Go installation (if exists):

  ```sh
  sudo rm -rf /usr/local/go
  ```

- Unzip the tarball & copy that `go` folder to `/usr/local/` :

  ```sh
  sudo tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz
  ```

- Add `go` to `PATH` in the SHELL profile file (`~/.bashrc` or `~/.zshrc`)

  ```sh
  export PATH=$PATH:/usr/local/go/bin
  ```

- Reload SHELL

  ```sh
  exec $(which $SHELL)
  ```
