# NeoVim <img alt="NeoVim" src="../assets/neovim.svg" height="28">

## Install NeoVim

From the [Linux section of their Installation](https://github.com/neovim/neovim/blob/master/INSTALL.md#linux):

To install NeoVim on Fedora:

```sh
# Fedora (dnf)
sudo dnf install -y neovim python3-neovim

# Ubuntu (apt)
sudo apt install -y neovim
```

---

## Lua setup <img alt="Lua" src="../assets/lua.svg"  height="25">

For LazyVim, we need to set up `lua` and `luarocks` (the package manager for Lua modules)

### Install `lua` and it's development headers

- Check if `lua` and the development variant of that package is installed:

  ```sh
  # Check installed lua version (if any)
  lua -v

  # Check if development headers are available
  plocate lua.h
  # The output should mention header files like: "/usr/include/lua.h", "/usr/include/lua.hpp"
  ```

- If not installed, install it as below. Ubuntu command referred from [this site](https://innovativeinnovation.github.io/ubuntu-setup/lua/)

  ```sh
  # For Ubuntu/Debian (apt):
  sudo apt install -y lua5.4 liblua5.4-dev

  # For Fedora (dnf):
  sudo dnf install -y lua lua-devel
  sudo updatedb
  ```

  Now verify they are installed via the previous commands

### Set up `luarocks`

Following the [LuaRocks install guide](https://luarocks.org/#quick-start):

- Download the tarball. Extract it's contents and `cd` into that folder:

  ```sh
  # Download the zip in
  cd ~/Downloads
  wget https://luarocks.org/releases/luarocks-3.12.0.tar.gz

  # Extract into your desired home location
  tar -zxpf luarocks-*.tar.gz -C ~/

  # Go into the extracted folder location
  cd ~/luarocks-3.12.0
  ```

- Run the configuration script:

  ```sh
  # To view optional arguments
  ./configure --help

  # Running the script
  ./configure

  # If above run fails, specify the lua version and header file directory as arguments
  ./configure --lua-version=5.4 --with-lua-include=/usr/include
  ```

  It's output would look something like:

  ```txt
  Configuring LuaRocks version 3.11.1...

  Lua interpreter found: /usr/bin/lua
  Checking if /usr/bin/lua is Lua version 5.4... yes
  lua.h found: /usr/include/lua.h
  unzip found in PATH: /usr/bin

  Done configuring.

  LuaRocks will be installed at......: /usr/local
  LuaRocks will install rocks at.....: /usr/local
  LuaRocks configuration directory...: /usr/local/etc/luarocks
  Using Lua from.....................: /usr
  Lua include directory..............: /usr/include

  * Type make and make install:
    to install to /usr/local as usual.
  * Type make bootstrap:
    to install LuaRocks into /usr/local as a rock.
  ```

- Build from the source code and install:

  ```sh
  make && sudo make install
  ```

- Install a `luarocks` module to test it out:

  ```sh
  sudo luarocks install luasocket
  ```

- Check if the module gets detected and imported properly:

  ```sh
  lua
  Lua 5.3.5 Copyright (C) 1994-2018 Lua.org, PUC-Rio
  > require "socket"
  ```

  The output should look something like: `table: 0x5584a1343f70 /usr/local/share/lua/5.4/socket.lua`. Press `Ctrl d` to exit the `lua` interpreter

  - If you get error like `module 'socket' not found`, you need to add various paths to your Shell. Note down the output of `luarocks path`. Or for a better output:

    ```sh
    echo "$PATH"
    echo "$LUA_PATH"
    echo "$LUA_CPATH"
    ```

  - Only append the `luarocks` specific entries to existing `PATH`. Copy `LUA_PATH`, `LUA_CPATH` as-it-is. So finally, the lines to add in your shell profile file (`~/.zshrc` or `~/.bashrc`) would be like:

    ```sh
    export PATH=$PATH:"$HOME/.luarocks/bin:/usr/local/bin"
    export LUA_PATH=$LUA_PATH:"/home/kumar/.luarocks/share/lua/5.4/?.lua;/home/kumar/.luarocks/share/lua/5.4/?/init.lua;/usr/local/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?/init.lua"
    export LUA_CPATH=$LUA_CPATH:"$HOME/.luarocks/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/?.so"
    ```

---

## LazyVim setup <img alt="LazyVim" src="../assets/lazyvim.svg"  height="25">

As per the [LazyVim Installation docs](http://www.lazyvim.org/installation):

- Back-up your current NeoVim config files:

  ```sh
  # required
  mv ~/.config/nvim{,.bak}

  # optional but recommended
  mv ~/.local/share/nvim{,.bak}
  mv ~/.local/state/nvim{,.bak}
  mv ~/.cache/nvim{,.bak}
  ```

- Clone their start-kit repo:

  ```sh
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  ```

- Remove the `.git/` folder, so you can add it to your own repo later:

  ```sh
  rm -rf ~/.config/nvim/.git
  ```

- Start NeoVim. LazyVim will initialize and lazy-load all your plugins

  ```sh
  nvim
  ```

- Enter `:checkhealth` to see status of plugins installed
