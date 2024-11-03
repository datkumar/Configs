# Flutter, Android Studio&ensp;<img alt="Flutter" src='https://static-00.iconduck.com/assets.00/flutter-icon-1651x2048-ojswpayr.png' height="25">

> **Assuming you have Java set up**. If you haven't, you can refer the [Java setup](../Java/README.md) page

## Installing Android Studio

The most convenient way to install and manage JetBrains IDEs like Android Studio, IntelliJ is via their [**JetBrains Toolbox**](https://www.jetbrains.com/toolbox-app/) app. It makes it easier to update/downgrade versions of your various JetBrains IDEs as well as see all your projects for those IDEs in one place

- Download the Toolbox tarball (`.tar.gz`) for Linux from their downloads. It contains the `jetbrains-toolbox` AppImage file. Extract contents of the tarball into `~/Applications` folder:

  ```sh
  # Create the Applications folder if it doesn't exist
  mkdir -p ~/Applications
  # Extract contents (AppImage) from tarball and copy to that folder
  tar xf ~/Downloads/jetbrains-toolbox*.tar.gz -C ~/Applications
  ```

- Go to the `~/Applications` folder from File Explorer. Double click on the `jetbrains-toolbox` AppImage file. Accept terms and select `Android Studio` to install. It should automatically download, install, configure Android Studio IDE as well as create a Desktop entry. The JetBrains Toolbox app installs IDEs in the `~/.local/share/JetBrains/Toolbox/apps/` folder

- The wizard will install: **Android SDK**, **Android Platform**, Android Virtual Device (**AVD**)

  - The Android SDK is installed within `~/Android/Sdk/` folder
  - By default, Android Studio stores all user settings in `~/.config/Google/AndroidStudio2023.3/` and uses `~/.local/share/Google/AndroidStudio2023.3/` for cache data

- Install the `Dart` and `Flutter` plugins available for Android Studio and restart the IDE

- If you wish to be able to launch Android Studio from terminal via `studio` as well as the platform tools like `adb`, `fastboot` etc., add them to your `PATH` in the Shell profile file (`~/.zshrc` or `~/.bashrc`):

  ```sh
  export PATH=$PATH:$HOME/.local/share/JetBrains/Toolbox/apps/android-studio/bin
  export PATH=$PATH:$HOME/Android/Sdk/platform-tools
  ```

  After saving, restart your Shell to load changes: `exec $(which $SHELL)`

## Installing Flutter

Following the official [Flutter Linux installation docs](https://docs.flutter.dev/get-started/install/linux/android):

- Install the [`Flutter`](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) extension in VSCode. It will prompt you to locate the Flutter SDK. Since you don't have an existing Flutter SDK, select `Download SDK`. You can set the install location to something like `~/FlutterSdk`

- Now, the latest Flutter SDK will be downloaded into `~/FlutterSdk/flutter/` folder.

  - If you want a specific Flutter SDK version, you'll have to download it from their [SDK Archive](https://docs.flutter.dev/release/archive) and extract it into desired location via `tar -cJf ~/Downloads/flutter_linux*.tar.xz YOUR_LOCATION`

- Add the location of **Flutter SDK's binaries** (like `flutter`, `dart`) to your `PATH` by adding these lines in your Shell config file (`~/.zshrc` or `~/.bashrc`):

  ```sh
  export PATH=$PATH:$HOME/FlutterSdk/flutter/bin
  ```

  Now restart your shell: `exec $(which $SHELL)`

- Install the **Linux toolchain** packages:

  ```sh
  # For Ubuntu/Debian (apt):
  sudo apt-get update -y && sudo apt-get upgrade -y;
  sudo apt-get install -y curl git zip unzip xz-utils \
    clang cmake ninja-build pkg-config libgtk-3-dev libglu1-mesa \
    libc6:amd64 libstdc++6:amd64 libbz2-1.0:amd64 libncurses5:amd64


  # Equivalent packages for Fedora (dnf):
  sudo dnf up -y
  sudo dnf install -y curl git zip unzip xz-devel \
    clang cmake ninja-build pkgconf-pkg-config gtk3-devel mesa-libGLU \
    glibc libstdc++ bzip2-libs ncurses-libs
  ```

- Install the **latest Android `cmdline-tools`**:

  - Open Android Studio
  - In the `New Project` startup, select `More Actions` > `SDK Manager` > `Android SDK` > `SDK Tools` > `Android SDK Command-line Tools (latest)`
  - Hit `Apply`

- Accept **Android licenses**:

  ```sh
  # Enter `y` to agree for each prompt
  flutter doctor --android-licenses
  ```

- Disable analytics (optional):

  ```sh
  flutter config --disable-analytics
  dart --disable-analytics
  ```

- Finally, check the `flutter doctor -v` output. It should contain all tickmarks and look like:

  ```txt
  [✓] Flutter (Channel stable, 3.24.4, on Fedora Linux 40 (Workstation Edition) 6.11.5-200.fc40.x86_64, locale en_US.UTF-8)
      • Flutter version 3.24.4 on channel stable at /home/kumar/FlutterSdk/flutter
      • Upstream repository https://github.com/flutter/flutter.git
      • Framework revision 603104015d (7 days ago), 2024-10-24 08:01:25 -0700
      • Engine revision db49896cf2
      • Dart version 3.5.4
      • DevTools version 2.37.3

  [✓] Android toolchain - develop for Android devices (Android SDK version 35.0.0)
      • Android SDK at /home/kumar/Android/Sdk
      • Platform android-35, build-tools 35.0.0
      • Java binary at: /home/kumar/.local/share/JetBrains/Toolbox/apps/android-studio/jbr/bin/java
      • Java version OpenJDK Runtime Environment (build 21.0.3+-12282718-b509.11)
      • All Android licenses accepted.

  [✓] Chrome - develop for the web
      • Chrome at google-chrome

  [✓] Linux toolchain - develop for Linux desktop
      • clang version 18.1.8 (Fedora 18.1.8-1.fc40)
      • cmake version 3.28.2
      • ninja version 1.12.1
      • pkg-config version 2.1.1

  [✓] Android Studio (version 2024.2)
      • Android Studio at /home/kumar/.local/share/JetBrains/Toolbox/apps/android-studio
      • Flutter plugin version 82.0.3
      • Dart plugin can be installed from:
        🔨 https://plugins.jetbrains.com/plugin/6351-dart
      • Java version OpenJDK Runtime Environment (build 21.0.3+-12282718-b509.11)

  [✓] VS Code (version 1.94.2)
      • VS Code at /usr/share/code
      • Flutter extension version 3.98.0

  [✓] Connected device (2 available)
      • Linux (desktop) • linux  • linux-x64      • Fedora Linux 40 (Workstation Edition) 6.11.5-200.fc40.x86_64
      • Chrome (web)    • chrome • web-javascript • Google Chrome 130.0.6723.69

  [✓] Network resources
      • All expected network resources are available.

  • No issues found!
  ```

- When you create new Flutter project in Android Studio, select the Flutter SDK path as `~/FlutterSdk/flutter`

---

## Enable VM acceleration (optional but recommended)

Linux-based systems support virtual machine acceleration via **KVM** (Kernel-based VM) package. Referring the official Android Developer docs to [Configure hardware acceleration for the Android Emulator](https://developer.android.com/studio/run/emulator-acceleration?utm_source=android-studio)

The [Configure VM acceleration on Linux](https://developer.android.com/studio/run/emulator-acceleration?utm_source=android-studio#vm-linux) section on the only mentions how to do it for Ubuntu/Debian based distros. You can also refer Ubuntu's [KVM installation docs](https://help.ubuntu.com/community/KVM/Installation)

However, for **Fedora** in my case, I'm referring the [Fedora Quick Docs page for Virtualization](https://docs.fedoraproject.org/en-US/quick-docs/virtualization-getting-started/):

- Check that your CPU supports virtualization:

  ```sh
  # Check "Virtualization" section of output. Mine said "AMD-V"
  lscpu
  # It should print a bunch of flags
  grep -E '^flags.*(vmx|svm)' /proc/cpuinfo
  ```

- View available packages in the `virtualization` package group:

  ```sh
  dnf groupinfo virtualization
  ```

  It's output would contain:

  ```txt
  Group: Virtualization
  Description: These packages provide a graphical virtualization environment.
  Mandatory Packages:
    virt-install
  Default Packages:
    libvirt-daemon-config-network
    libvirt-daemon-kvm
    qemu-kvm
    virt-manager
    virt-viewer
  Optional Packages:
    guestfs-tools
    python3-libguestfs
    virt-top
  ```

- To install the mandatory, default, and optional packages:

  ```sh
  sudo dnf group install --with-optional virtualization
  ```

- Start and enable the `libvirtd` service to load on boot:

  ```sh
  sudo systemctl start libvirtd
  sudo systemctl enable libvirtd
  ```

- Verify that the KVM kernel modules are properly loaded:

  ```sh
  lsmod | grep kvm
  ```

---

## Upgrading Flutter

Referring the [Flutter docs](https://docs.flutter.dev/release/upgrade):

```sh
# Upgrading Flutter SDK
flutter upgrade

# Identify out-of-date package dependencies and get advice on updating them
flutter pub outdated

# Update to the latest compatible versions of all the dependencies in pubspec.yaml
flutter pub upgrade
```
