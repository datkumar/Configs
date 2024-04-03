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

## Automatic updates

Change owner of your `idea` installation directory to allow automatic updates. Refer [this answer](https://askubuntu.com/questions/346936/can-not-update-intellij-because-of-error-permission-denied)

```sh
sudo chown -R $(whoami) /opt/idea-IC-232.9559.62
```

---

## Java

Select `New Project` or `Start Tour`

If JDK is not detected by IntelliJ, you'll need to install it or provide it's path if installed.

> Note that your Java folders might be JREs and not JDKs so you'll need to install required extra libraries such as the **_development_** variants.

> For example, Fedora 38 comes with just the **JRE** of OpenJDK as the package `java-17-openjdk-headless.x86_64` . To install the full JDK with all the development tools, run `sudo dnf install -y java-devel`. (Referred from [their developer docs](https://developer.fedoraproject.org/tech/languages/java/java-installation.html))

Another option is to Install **`OpenJDK from Oracle`** through **IntelliJ** itself. The JDK is installed in the `~/.jdks` folder (like `~/.jdks/openjdk-20.0.2`)

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
