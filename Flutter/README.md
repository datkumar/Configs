# Flutter, Android Studio&ensp;<img src='https://static-00.iconduck.com/assets.00/flutter-icon-1651x2048-ojswpayr.png' width="25">

---

> Assuming Linux Machine with Java installed.

> Refer [here](../Java/README.md) for Java Setup or Install JDK via the IDE itself

> Also, `git` , `curl` must be installed.

---

**Dell** Laptops can give `curl: symbol lookup error`. Refer [this question](https://askubuntu.com/questions/1358184/ubuntu-20-04-curl-symbol-lookup-error).

So, run `sudo apt-get purge --autoremove dca-enabler-packages dca-enabler`

---

[VSCode Flutter Setup](https://docs.flutter.dev/tools/vs-code)

[Android Studio & IntelliJ Setup](https://docs.flutter.dev/tools/android-studio)

---

## Install Android Studio

- Install additional required **Linux 64-bit binaries** by running [these commands](https://developer.android.com/studio/install#64bit-libs)
- Download **Android Studio** zip file [from their page](https://developer.android.com/studio) and follow [these instructions](https://developer.android.com/studio/install#linux)
- Extract it & move the extracted `android-studio` folder to `/opt/` for all users (or `/usr/local/` for only the current user)

    ```sh
    cd ~/Downloads
    # Replace with your tarball name
    tar xvf android-studio-2022.1.1.20-linux.tar.gz
    sudo mv ./android-studio /opt/
    ```

- You should go through the installation script `android-studio/bin/studio.sh` as well as read the Installation instructions in `android-studio/Install-Linux-tar.txt`

- To run Android Studio first time,

    ```sh
    sh /opt/android-studio/bin/studio.sh
    ```

- Create Desktop Entry via `Tools` > `Create Desktop Entry`

- Add Android Studio and Android SDK to `PATH` in  your shell profile file (`~/.zshrc` , `~/.bashrc` etc.)

    ```sh
    export PATH=$PATH:/opt/android-studio/bin
    export ANDROID_HOME=$HOME/Android/Sdk
    export PATH=$PATH:$ANDROID_HOME/platform-tools
    ```

- Reload SHELL

    ```sh
    exec $(which $SHELL)
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

> [Upgrading Flutter version](https://docs.flutter.dev/release/upgrade)

## Install Flutter (latest stable version via `git`)

- Create folder `~/flutter_stable`
- Inside folder, clone latest `stable` branch of [official flutter repo](https://github.com/flutter/flutter):

    ```sh
    git clone https://github.com/flutter/flutter.git -b stable
    ```

- Add `flutter` to `PATH` in `~/.zshrc` (or your respective shell profile file like `~/.bashrc`):

    ```sh
    export PATH=$PATH:$HOME/flutter_stable/flutter/bin
    ```

- Reload SHELL

    ```sh
    exec $(which $SHELL)
    ```

- Now, `flutter` command will be recognised:

    ```sh
    flutter --version
    ```

    Output:

    ```txt
    Flutter 3.7.2 • channel stable • https://github.com/flutter/flutter.git
    Framework • revision 32fb2f948e (10 days ago) • 2023-02-08 07:30:10 -0800
    Engine • revision f40b73f8a4
    Tools • Dart 2.19.2 • DevTools 2.20.1
    ```

- Check if everything required for Flutter is installed:

    ```sh
    flutter doctor
    ```

    Output:

    ```txt
    [✓] Flutter (Channel stable, 3.7.3, on Ubuntu 20.04.5 LTS 5.14.0-1057-oem, locale en_IN)
    [!] Android toolchain - develop for Android devices (Android SDK version 33.0.2)
        ✗ cmdline-tools component is missing
          Run `path/to/sdkmanager --install "cmdline-tools;latest"`
          See https://developer.android.com/studio/command-line for more details.
        ✗ Android license status unknown.
          Run `flutter doctor --android-licenses` to accept the SDK licenses.
          See https://flutter.dev/docs/get-started/install/linux#android-setup for more details.
    [✓] Chrome - develop for the web
    [✗] Linux toolchain - develop for Linux desktop
        ✗ clang++ is required for Linux development.
          It is likely available from your distribution (e.g.: apt install clang), or can be downloaded from https://releases.llvm.org/
        ✗ CMake is required for Linux development.
          It is likely available from your distribution (e.g.: apt install cmake), or can be downloaded from https://cmake.org/download/
        ✗ ninja is required for Linux development.
          It is likely available from your distribution (e.g.: apt install ninja-build), or can be downloaded from https://github.com/ninja-build/ninja/releases
        ✗ GTK 3.0 development libraries are required for Linux development.
          They are likely available from your distribution (e.g.: apt install libgtk-3-dev)
    [!] Android Studio (version 2022.1)
        ✗ Unable to find bundled Java version.
    [✓] Connected device (2 available)
    [✓] HTTP Host Availability

    ! Doctor found issues in 2 categories.
    ```

- Install the programs mentioned for Linux toolchain

    ```sh
    sudo apt install clang cmake ninja-build libgtk-3-dev -y
    ```

- Flutter isn't completely set up yet

    ```sh
    flutter doctor
    ```

    Output:

    ```txt
    Doctor summary (to see all details, run flutter doctor -v):
    [✓] Flutter (Channel stable, 3.7.2, on Pop!_OS 22.04 LTS 6.0.12-76060006-generic, locale
        en_US.UTF-8)
    [!] Android toolchain - develop for Android devices (Android SDK version 33.0.2)
        ✗ cmdline-tools component is missing
          Run `path/to/sdkmanager --install "cmdline-tools;latest"`
          See https://developer.android.com/studio/command-line for more details.
        ✗ Android license status unknown.
          Run `flutter doctor --android-licenses` to accept the SDK licenses.
          See https://flutter.dev/docs/get-started/install/linux#android-setup for more details.
    [✓] Chrome - develop for the web
    [✓] Linux toolchain - develop for Linux desktop
    [!] Android Studio (version 2022.1)
        ✗ Unable to find bundled Java version.
    [✓] VS Code (version 1.67.2)
    [✓] Connected device (2 available)
    [✓] HTTP Host Availability

    ! Doctor found issues in 2 categories.
    ```

- Install Android **Command-line Tools** from Android Studio: `File > Settings > Appearance & Behaviour > System Settings > SDK Tools > Android SDK Command-line Tools (latest)`

- The bundled `jre` directory in the Android Studio installation folder has been named to `jbr` . To resolve this, just create a **symbolic link** `jre` -> `jbr` . Refer [this answer](https://stackoverflow.com/a/75119315)

    ```sh
    ln -s /opt/android-studio/jbr /opt/android-studio/jre
    ```

- To add your **`JDK`**  (assuming Java installed properly) to Android Studio, go to `File` > `Project Structure` > `SDKs`. Click on `+` icon and select `Add JDK`
  
- Accept licenses:

    ```sh
    flutter doctor --android-licenses
    ```

- **Now everything should work 👍🏻**

    ```sh
    flutter doctor
    ```

    Output:

    ```txt
    Doctor summary (to see all details, run flutter doctor -v):
    [✓] Flutter (Channel stable, 3.7.2, on Pop!_OS 22.04 LTS 6.0.12-76060006-generic, locale
        en_US.UTF-8)
    [✓] Android toolchain - develop for Android devices (Android SDK version 33.0.2)
    [✓] Chrome - develop for the web
    [✓] Linux toolchain - develop for Linux desktop
    [✓] Android Studio (version 2022.1)
    [✓] VS Code (version 1.67.2)
    [✓] Connected device (2 available)
    [✓] HTTP Host Availability

    • No issues found!
    ```

- Open Android Studio. Install **Flutter** & **Dart** plugins in Android Studio
- When creating `New Flutter Project` in Android Studio, you need to specify path to Flutter SDK. To locate it, check first few lines in output of:

    ```dart
    flutter doctor -v
    ```

    Output:

    ```txt
    [✓] Flutter (Channel stable, 3.7.3, on Ubuntu 20.04.5 LTS 5.14.0-1057-oem, locale en_IN)
        • Flutter version 3.7.3 on channel stable at /home/kumar/flutter_stable/flutter
    ```

    So, Flutter SDK path is: `/home/kumar/flutter_stable/flutter`

---

## Install specific Flutter version

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

- Follow next steps similar as previous method.

---

## Uninstall Android Studio

- Refer [these instructions](https://askubuntu.com/questions/546723/uninstall-android-studio-completely)

```sh
# Remove the Android SDK and other folders
sudo rm -rf ~/Android ~/.android

# Remove your 'android-studio' installation folder (wherever you installed from)
sudo rm -rf /opt/android-studio

# Remove cache
sudo rm -rf ~/.cache/Google/AndroidStudio2022.1
sudo rm -rf ~/.cache/Android\ Open\ Source\ Project

# Remove Android Studio settings from your SHELL profile 
gedit ~/.bashrc

# Remove your settings (optional)
sudo rm -rf ~/.config/Google/AndroidStudio2022.1
sudo rm -rf ~/.config/Android\ Open\ Source\ Project

# Remove your Projects (optional)
sudo rm -rf ~/StudioProjects
```

---

## Uninstall Flutter

- Delete the `flutter` SDK folder
- Delete flutter configs from `~/.config`
- Remove flutter PATH settings from SHELL config file (`~/.zshrc` or `~/.bashrc`)

---
