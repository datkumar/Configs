# [Go](./Go/README.md) <img alt="Go" src="../assets/go.svg" height="28">

## Installation

### Manual installation (recommended)

It provides the latest Go version's installation

First, download the binary release tarball for Linux from [their downloads page](https://go.dev/dl/). Then follow their [installation instructions](https://go.dev/doc/install):

- Open Terminal in your download location

- Remove old Go installation (if exists):

  ```sh
  sudo rm -rf /usr/local/go
  ```

- Unzip the tarball & copy that `go` folder to `/usr/local/` :

  ```sh
  sudo tar -C /usr/local -xzf go*linux-amd64.tar.gz
  ```

- Add `go` to `PATH` in your SHELL profile file (`~/.bashrc` or `~/.zshrc`)

  ```sh
  export PATH=$PATH:/usr/local/go/bin
  ```

- Reload SHELL

  ```sh
  exec $(which $SHELL)
  ```

- Verify Go is installed by checking it's version:

  ```sh
  go version
  ```

### Installation via package manager

> **Not recommended** if you wish to have the latest version of Go on your system

Most likely, there exists a some package of the Go language within the repositories of your package manager for your Linux distro. These may not be the latest Go version but are recent enough and tested to work well on your distro. For my Fedora distro, I referred the [Fedora Developer portal page](https://developer.fedoraproject.org/tech/languages/go/go-installation.html) for installing Go via Fedora's package manager `dnf`:

```sh
# Fedora (dnf):
sudo dnf install golang
# Ubuntu (apt):
sudo apt install golang
```
