# Flutter, Android Studio&ensp;<img src='https://static-00.iconduck.com/assets.00/flutter-icon-1651x2048-ojswpayr.png' width="25">

## Sections

1. [Installing Android Studio](./README.md#installing-android-studio)
2. [Installing Flutter](./README.md#installing-flutter)

> **More**:

- [Updating Android Studio](./README.md#updating-android-studio)
- [Upgrading Flutter version](./README.md#upgrading-flutter-version)
- [Uninstalling Android Studio](./README.md#uninstalling-android-studio)
- [Uninstalling Flutter](./README.md#uninstalling-flutter)

---

> **For other Code Editors**:

[VSCode Flutter Setup](https://docs.flutter.dev/tools/vs-code)

[Android Studio & IntelliJ Setup](https://docs.flutter.dev/tools/android-studio)

---

> Assuming Linux Machine with Java installed.<br>
> Refer [here](../Java/README.md) for Java Setup or Install JDK via the IDE itself
> <br>Also, `git` , `curl` must be installed.

**Dell** Laptops can give `curl: symbol lookup error`. Refer [this question](https://askubuntu.com/questions/1358184/ubuntu-20-04-curl-symbol-lookup-error).

So, run `sudo apt-get purge --autoremove dca-enabler-packages dca-enabler`

---

## Installing Android Studio

- Install additional required **Linux 64-bit binaries** by running [these commands](https://developer.android.com/studio/install#64bit-libs):

  ```sh
  # For Ubuntu
  sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

  # For Fedora
  sudo yum install zlib.i686 ncurses-libs.i686 bzip2-libs.i686
  ```

- Download **Android Studio** zip file [from their page](https://developer.android.com/studio) and then follow [their instructions](https://developer.android.com/studio/install#linux) as given below:

- Extract it & move the extracted `android-studio` folder to `/opt/` for all users (**OR** to `/usr/local/` for only the current user):

  ```sh
  cd ~/Downloads
  # Replace with your respective tarball name
  tar xvf ./android-studio-2023.1.1.26-linux.tar.gz
  sudo mv ./android-studio /opt/
  ```

- In the extracted folder, browse through the the installation instructions in `android-studio/Install-Linux-tar.txt` as well as the installation script `android-studio/bin/studio.sh`

- To run Android Studio first time,

  ```sh
  sh /opt/android-studio/bin/studio.sh
  ```

  - If installating first-time, select `Do not import settings`

  - If your system supports VM acceleration, check the hardware accelaration docs: [Ubuntu](https://developer.android.com/studio/run/emulator-acceleration#vm-linux), [Fedora](https://docs.fedoraproject.org/en-US/quick-docs/virtualization-getting-started/#_enabling_hardware_virtualization_support)

- After the installation wizard completes, a Welcome window will open. Click the bottom left settings icon `⚙️` > `Create Desktop Entry`

- Add `android-studio` and **Android SDK** to `PATH` in your shell profile file (`~/.zshrc` , `~/.bashrc` etc.)

  ```sh
  export ANDROID_HOME=$HOME/Android/Sdk
  export PATH=$PATH:/opt/android-studio/bin
  ```

- Reload SHELL

  ```sh
  exec $(which $SHELL)
  ```

---

## Installing Flutter

Following the [official flutter installation docs](https://docs.flutter.dev/get-started/install/linux):

- The recommended method is via `snapd` . Ubuntu `>=18.04` comes with `snapd`, but for other distros, follow [instructions on their page for your distro](https://snapcraft.io/docs/installing-snapd) to install `snapd`

- Install Flutter via `snapd`:

  ```sh
  sudo snap install flutter --classic
  ```

- See your Flutter SDK path via:

  ```sh
  flutter sdk-path
  ```

- Disabling analytics (Optional):

  ```sh
  flutter config --no-analytics
  dart --disable-analytics
  ```

- Verify your installation (can use `-v` flag for verbose output):

  ```sh
  flutter doctor
  ```

- For installing Android's latest command-line tools, open Andoid Studio Settings from the Welcome Screen via:
  `Customize` > `All Settings` > `Languages & Frameworks` > `Android SDK` > `SDK Tools` > select `Android SDK Command-line Tools (latest)` & hit **Apply**

- To accept licenses, run: `flutter doctor --android-licenses` and enter `y` for each

- Final expected ideal output of `flutter doctor` is:

  ```txt
  Doctor summary (to see all details, run flutter doctor -v):
  [✓] Flutter (Channel stable, 3.16.5, on Fedora Linux 39 (Workstation Edition) 6.2.9-300.fc38.x86_64, locale en_US.UTF-8)
  [✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
  [✓] Chrome - develop for the web
  [✓] Linux toolchain - develop for Linux desktop
  [✓] Android Studio (version 2023.1)
  [✓] IntelliJ IDEA Community Edition (version 2023.2)
  [✓] VS Code (version 1.85.1)
  [✓] Connected device (2 available)
  [✓] Network resources

  • No issues found!
  ```

- Install `Flutter` & `Dart` plugins in Android Studio

- Add `flutter` and it's bundled `dart` to `PATH` in your shell profile file (`~/.zshrc` , `~/.bashrc` etc.)

  The Flutter SDK path is `$HOME/snap/flutter/common/flutter/` which can be seen as the output of running: `flutter sdk-path`

  ```sh
  export PATH=$PATH:$HOME/snap/flutter/common/flutter/bin
  ```

- Trouble-shooting the `flutter doctor` output:

  - Java installed but not detected:

    ```txt
    [!] Android Studio (version 2022.1)
      ✗ Unable to find bundled Java version.
    ```

    The bundled `jre` directory in the Android Studio installation location (`/opt/android-studio`) has been named to `jbr`. Refer [this answer](https://stackoverflow.com/a/75119315)

    To resolve this, just create a **symbolic link**: `jre` -> `jbr`

    ```sh
    ln -s /opt/android-studio/jbr /opt/android-studio/jre
    ```

  - Linux toolchain not installed:

    ```txt
    [✗] Linux toolchain - develop for Linux desktop
        ✗ clang++ is required for Linux development.
          It is likely available from your distribution (e.g.: apt install clang), or can be downloaded from https://releases.llvm.org/
        ✗ CMake is required for Linux development.
          It is likely available from your distribution (e.g.: apt install cmake), or can be downloaded from https://cmake.org/download/
        ✗ ninja is required for Linux development.
          It is likely available from your distribution (e.g.: apt install ninja-build), or can be downloaded from https://github.com/ninja-build/ninja/releases
        ✗ GTK 3.0 development libraries are required for Linux development.
          They are likely available from your distribution (e.g.: apt install libgtk-3-dev)
    ```

    Refer [Linux prerequisites](https://docs.flutter.dev/get-started/install/linux#linux-prerequisites)

    ```sh
    # For Ubuntu
    sudo apt-get install clang cmake ninja-build libgtk-3-dev pkg-config liblzma-dev libstdc++-12-dev

    # For Fedora
    sudo dnf install -y clang cmake ninja-build gtk3-devel
    ```

  - Google Chrome not installed

    ```sh
    [✗] Chrome - develop for the web (Cannot find Chrome executable at .\Google\Chrome\Application\chrome.exe)
        ! Cannot find Chrome. Try setting CHROME_EXECUTABLE to a Chrome executable.
    ```

    Flutter apps can run on most browsers but Flutter only supports **Chrome** & **Edge** browsers for debugging. Refer [their Web FAQ](https://docs.flutter.dev/platform-integration/web/faq#which-web-browsers-are-supported-by-flutter).

    IF you intend on developing Flutter Web Apps, it's better to install Google Chrome. Else, set `CHROME_EXECUTABLE` inside your SHELL config file (`~/.zshrc` or `~/.bashrc`) to your web browser's path

    ```sh
    export CHROME_EXECUTABLE=$(which firefox)
    ```

---

## Updating Android Studio

- Open `Settings` > `Appearance & Behavior` > `System Settings` > `Updates` and click on **Check for Updates** button
- If new Android Studio version available, it will redirect you to their page. Download tarball file from that page and follow these steps:

  Extract the downloaded tarball

  ```sh
  tar xvf ~/Downloads/android-studio-2022.3.1.19-linux.tar.gz
  ```

  Run the installation script from the extracted folder

  ```sh
  ~/Downloads/android-studio/bin/studio.sh
  ```

  If your old installation's settings aren't imported by the install script, go to `File` > `Manage IDE Settings` > `Import Setttings` and select old config folder, for example: `~/.config/Google/AndroidStudio2022.3`

  Delete old installation folder and move the new installation folder into that location

  ```sh
  # Delete old installation folder
  sudo rm -rf /opt/android-studio

  # Move current installation folder to that location
  sudo mv ~/Downloads/android-studio /opt/
  ```

  Open Android Studio from the new location

  `/opt/android-studio/bin/studio.sh`

  Create a replacement Desktop Entry via `Tools` > `Create Desktop Entry`

---

## Upgrading Flutter version

Refer [their docs](https://docs.flutter.dev/release/upgrade)

---

## Uninstalling Android Studio

Refer [these instructions](https://askubuntu.com/questions/546723/uninstall-android-studio-completely)

```sh
# Remove the Android SDK and other folders
sudo rm -rf ~/Android ~/.android

# Remove your 'android-studio' installation folder (wherever you installed from)
sudo rm -rf /opt/android-studio

# Remove cache
rm -rf ~/.cache/Google/AndroidStudio2022.1
rm -rf ~/.cache/Android\ Open\ Source\ Project

# Remove Android Studio settings from your SHELL profile
gedit ~/.bashrc

# Remove your settings (optional)
sudo rm -rf ~/.config/Google/AndroidStudio2022.1
sudo rm -rf ~/.config/Android\ Open\ Source\ Project

# Remove your Projects (optional)
sudo rm -rf ~/StudioProjects
```

---

## Uninstalling Flutter

- Delete the `flutter` SDK folder
- Delete caches: `rm -rf ~/.pub-cache ~/.dartServer`
- Delete flutter configs from `~/.config`
- Remove flutter PATH settings from SHELL config file (`~/.zshrc` or `~/.bashrc`)

---
