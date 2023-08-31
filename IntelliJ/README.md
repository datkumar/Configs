# [IntelliJ](./IntelliJ/README.md)&ensp;<img src='https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/IntelliJ_IDEA_Icon.svg/1200px-IntelliJ_IDEA_Icon.svg.png' width="25">

> [Article for IntelliJ on Ubuntu](https://medium.com/geekculture/install-intellij-idea-android-sdk-flutter-sdk-on-ubuntu-20-04-108a14068668)

Download IntelliJ IDEA **_Community Edition_** `tar.gz` from [their download page](https://www.jetbrains.com/idea/download/?section=linux)

Extract the tarball to `/opt/` (Delete previous installations before this step)

```sh
sudo tar -xzf ~/Downloads/ideaIC-*.tar.gz -C /opt/
```

Next, you can follow the installation instructions as given in `Install-Linux-tar.txt` file in that extracted folder:

---

- Unpack the IntelliJ IDEA distribution archive that you downloaded where you wish to install the program. We will refer to this location as your `{installation home}`

  To start the application, open a console, cd into `{installation home}/bin` and type: `./idea.sh`

  ```sh
  /opt/idea-IC-232.9559.62/bin/idea.sh
  ```

  This will initialize various configuration files in the configuration directory:
  `~/.config/JetBrains/IdeaIC2023.2`

- _[OPTIONAL]_ To adjust the value of the JVM heap size, create a file `idea.vmoptions` (or `idea64.vmoptions` if using a 64-bit JDK) in the configuration directory and set the `-Xms` and `-Xmx` parameters. To see how to do this, you can reference the vmoptions file under `{installation home}/bin` as a model but do not modify it, add your options to the new file.

- _[OPTIONAL]_ Change the location of the "config" and "system" directories:

  By default, IntelliJ IDEA stores all your settings in the
  `~/.config/JetBrains/IdeaIC2023.2` directory
  and uses `~/.local/share/JetBrains/IdeaIC2023.2` as a data cache.
  To change the location of these directories:

  - Open a console and `cd` into `~/.config/JetBrains/IdeaIC2023.2`

  - Create a file `idea.properties` and set the `idea.system.path` and `idea.config.path` variables, for example:

    ```sh
    idea.system.path=~/custom/system
    idea.config.path=~/custom/config
    ```

  - Store the data cache (`system` directory) on a disk with at least **1GB** of free space.

- On Welcome Menu screen, click on Settings (⚙️ icon) and select
  **Create a Desktop Entry** and create entry for all users

> Directories used by the IDE: (referred from [here](https://intellij-support.jetbrains.com/hc/en-us/articles/206544519))

```sh
~/.config/JetBrains/IntelliJIdea2022.2      # idea.config.path
~/.local/share/JetBrains/IntelliJIdea2022.2 # idea.plugins.path
~/.cache/JetBrains/IntelliJIdea2022.2       # idea.system.path
~/.cache/JetBrains/IntelliJIdea2022.2/log   # idea.log.path
```

---

## Java

Select `New Project` or `Start Tour`

If JDK is not detected by IntelliJ, you'll need to install it or provide it's path if installed.

> Note that your Java folders might be JREs and not JDKs so you'll need to install required extra libraries such as the **_development_** variants.

> For example, Fedora 38 comes with just the **JRE** of OpenJDK as the package `java-17-openjdk-headless.x86_64` . To install the full JDK with all the development tools, run `sudo dnf install -y java-devel`. (Referred from [their developer docs](https://developer.fedoraproject.org/tech/languages/java/java-installation.html))

Another option is to Install **`OpenJDK from Oracle`** through **IntelliJ** itself. The JDK is installed in the `~/.jdks` folder (like `~/.jdks/openjdk-20.0.2`)

## Android

Install the **`Android SDK`** and the **`Android` plugin** via **IntelliJ** itself. You'll need to accept the licenses during that wizard.

The Android SDK is installed in the `~/Android/Sdk` folder

## Flutter

- Download the Flutter SDK from [their install instructions page](https://docs.flutter.dev/get-started/install/linux#install-flutter-manually)

- Extract the downloaded Flutter SDK archive into a folder:

  ```sh
  # Create folder and cd into it
  mkdir -p ~/FlutterSdks && cd $_
  # Extract tarball in this location
  tar xf ~/Downloads/flutter_linux_3.13.1-stable.tar.xz
  ```

- Now Flutter SDK installed inside `~/FlutterSdks/flutter` . When creating a New Flutter Project in IntelliJ, select this as the Flutter SDK location.

- Add the `bin` folder inside's location to PATH in the SHELL config file (`~/.zshrc` or `~/.bashrc`)

  ```sh
  export PATH=$PATH:$HOME/FlutterSdks/flutter/bin
  ```

- Check `flutter` & `dart` commands

  ```sh
  which flutter dart
  ```

- Verify by running `flutter doctor -v`. The output should contain something like:

  ```sh
  [✓] Flutter (Channel stable, 3.13.1, on Fedora Linux 38 (Workstation Edition) 6.2.9-300.fc38.x86_64, locale en_US.UTF-8)
    • Flutter version 3.13.1 on channel stable at /home/kumar/FlutterSdks/flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision e1e47221e8 (6 days ago), 2023-08-22 21:43:18 -0700
    • Engine revision b20183e040
    • Dart version 3.1.0
    • DevTools version 2.25.0
  ```

- Disabling Analytics & Telemetry

  ```sh
  flutter config --no-analytics --disable-telemetry
  ```

- Accepting Android licenses & Installing Android SDK Tools:

  When `flutter doctor -v` output contains:

  ```sh
  [!] Android toolchain - develop for Android devices (Android SDK version 33.0.2)
      ✗ cmdline-tools component is missing
        Run `path/to/sdkmanager --install "cmdline-tools;latest"`
        See https://developer.android.com/studio/command-line for more details.
      ✗ Android license status unknown.
        Run `flutter doctor --android-licenses` to accept the SDK licenses.
        See https://flutter.dev/docs/get-started/install/linux#android-setup for more details.
  ```

  Run this:

  ```sh
  # Accept Android Licenses
  flutter doctor --android-licenses

  # Install latest Android Command-line tools (can also do this via IDE)
  ~/Android/Sdk/cmdline-tools/latest/bin/sdkmanager --install "cmdline-tools;latest"
  ```

  > Alternatively, go to `Settings` > `Languages and Frameworks` > `Android SDK` > `SDK Tools`

  > Tick `Android SDK Command-Line Tools (latest)` and click **Apply** to install it

- Installing libraries for Flutter Linux toolchain:

  When `flutter doctor -v` output contains:

  ```sh
  [✗] Linux toolchain - develop for Linux desktop
      ✗ clang++ is required for Linux development.
        It is likely available from your distribution (e.g.: apt install clang), or can be downloaded from https://releases.llvm.org/
      ✗ CMake is required for Linux development.
        It is likely available from your distribution (e.g.: apt install cmake), or can be downloaded from https://cmake.org/download/
      ✗ ninja is required for Linux development.
        It is likely available from your distribution (e.g.: apt install ninja-build), or can be downloaded from https://github.com/ninja-build/ninja/releases
      • pkg-config version 1.8.0
      ✗ GTK 3.0 development libraries are required for Linux development.
        They are likely available from your distribution (e.g.: apt install libgtk-3-dev)
  ```

  Run this: (Refer [Linux prerequisites](https://docs.flutter.dev/get-started/install/linux#linux-prerequisites))

  > Note: The **gtk3** development package is `libgtk-3-dev` for **Debian-based** & `gtk3-devel` for **RedHat-based** distributions

  ```sh
  sudo dnf install -y clang cmake ninja-build gtk3-devel
  ```

- Flutter apps can run on most browsers but Flutter only supports `Chrome` & `Edge` browsers for debugging. Refer [their Web FAQ](https://docs.flutter.dev/platform-integration/web/faq#which-web-browsers-are-supported-by-flutter)

  When `flutter doctor -v` output contains:

  ```sh
  [✗] Chrome - develop for the web (Cannot find Chrome executable at .\Google\Chrome\Application\chrome.exe)
      ! Cannot find Chrome. Try setting CHROME_EXECUTABLE to a Chrome executable.
  ```

  Put this line inside your SHELL config file (`~/.zshrc` or `~/.bashrc`)

  ```sh
  # Set this variable to location of your browser binary executable
  export CHROME_EXECUTABLE=$(which firefox)
  ```

---
