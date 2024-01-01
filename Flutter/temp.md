# Install specific Flutter version

- Download Flutter SDK tarball (or zip file) of that version from [Flutter SDK Archive](https://docs.flutter.dev/release/archive?tab=linux)
- Create folder and extract the Flutter SDK there

  ```sh
  mkdir ~/flutter_3_3_10
  cd ~/flutter_3_3_10
  tar xf ~/Downloads/flutter_linux_3.3.10-stable.tar.xz
  ```

- Add `flutter` binary location to `PATH` variable inside your shell profile file (`~/.zshrc` , `~/.bashrc`)

  ```sh
  export PATH=$PATH:$HOME/flutter_3_3_10/flutter/bin
  ```

- Reload SHELL

  ```sh
  exec $(which $SHELL)
  ```

  Now, you run android studio from terminal via `studio.sh`

- Follow next steps similar as previous method.

---
