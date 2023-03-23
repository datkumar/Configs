# Go 🦫

## Install: 
- Download tarball from [Official Install Page](https://go.dev/doc/install). Open Terminal in your download location & follow their instructions
- Remove old Go installation (if exists):
    ```bash
    sudo rm -rf /usr/local/go
    ```
- Unzip the tarball & copy that `go` folder to `/usr/local/` :
    ```bash
    sudo tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz
    ```
- Add  `go`  to  `PATH`  in the  `SHELL`  profile file  (`~/.bashrc` or `~/.zshrc`) 
    ```bash
    export PATH=$PATH:/usr/local/go/bin
    ```
- Source that  `SHELL`  profile file and restart `SHELL`
    ```bash
    source ~/.bashrc
    exec $SHELL
    ```
