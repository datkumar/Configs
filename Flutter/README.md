# Flutter & Android Studio :iphone: 

---

> Assuming Linux Machine with Java installed. Refer [here](../Java/README.md) for Java Setup 

> Also, `git` , `curl` must be installed. 

Dell Laptops can give `curl: symbol lookup error`. Refer [this question](https://askubuntu.com/questions/1358184/ubuntu-20-04-curl-symbol-lookup-error). 

So, run `sudo apt-get purge --autoremove dca-enabler-packages dca-enabler`

> Whenever you edit your `SHELL` 's profile (like `~/.zshrc` , `~/.bashrc`),  Import i.e. source those changes and reload your `$SHELL` via:

  ```shell
  source ~/.zshrc  # or ~/.bashrc
  exec $SHELL
  ```

---

## Install Android Studio:

- Install additional required **Linux 64-bit binaries** by running [these commands](https://developer.android.com/studio/install#64bit-libs)
- Download [**zip file** from here](https://developer.android.com/studio) and follow [these instructions](https://developer.android.com/studio/install#linux)
- Extract it & move the extracted `android-studio` folder to `/opt/`
  ```shell
  > cd ~/Downloads
    # Replace with your respective downloaded tarball name
  > tar xvf android-studio-2022.1.1.20-linux.tar.gz
  > sudo mv ./android-studio /opt/
  ```
- Now, you can run Android Studio via 
  
  ```shell
  > sh /opt/android-studio/bin/studio.sh
  ```
- Create Desktop Entry via `Tools > Create Desktop Entry`
- Add Android SDK to `PATH` in `~/.zshrc` (or your respective shell profile file like `~/.bashrc`)
  ```shell
  export ANDROID_HOME=$HOME/Android/Sdk
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  # Optionally,
  # export PATH=$PATH:$ANDROID_HOME/build-tools/33.0.2
  ```
- Source `SHELL` profile file & Reload `SHELL`

---

## Install Flutter (latest stable version):

- Create folder `~/flutter_stable`
- Inside folder, clone latest `stable` branch of [official flutter repo](https://github.com/flutter/flutter):
  ```shell
  > git clone https://github.com/flutter/flutter.git -b stable
  ```
- Add `flutter` to `PATH` in `~/.zshrc` (or your respective shell profile file like `~/.bashrc`):
  ```shell
  export PATH=$PATH:/home/kumar/flutter_stable/flutter/bin
  ```
- Source `SHELL` profile file & Reload `SHELL`
- Now, `flutter` command will be recognised:
  ```shell
  > flutter --version
  Flutter 3.7.2 • channel stable • https://github.com/flutter/flutter.git
  Framework • revision 32fb2f948e (10 days ago) • 2023-02-08 07:30:10 -0800
  Engine • revision f40b73f8a4
  Tools • Dart 2.19.2 • DevTools 2.20.1
  ```
- Check if everything required for Flutter is installed:
  ```shell
  > flutter doctor
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
  ```shell
  > sudo apt install clang cmake ninja-build libgtk-3-dev -y
  ```
- Flutter isn't completely set up yet
  ```shell
  > flutter doctor
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
- Install Android **Command-line Tools** from Android Studio: ` File > Settings > Appearance & Behaviour > System Settings > SDK Tools > Android SDK Command-line Tools (latest)` 
- **Link** your installed Java version to Android Studio 
  ```shell
  > cd /opt/android-studio && ln -s jbr jre
  ```
- Accept licenses: 
  ```shell
  > flutter doctor --android-licenses
  ```
- **Now everything should work 👍🏻**
  ```shell
  > flutter doctor
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
  ```shell
  > flutter doctor -v
  [✓] Flutter (Channel stable, 3.7.3, on Ubuntu 20.04.5 LTS 5.14.0-1057-oem, locale en_IN)
      • Flutter version 3.7.3 on channel stable at /home/kumar/flutter_stable/flutter
  ```
  So, Flutter SDK path is: `/home/kumar/flutter_stable/flutter`
  
--- 
  
## Install Flutter (specific version):

- Download Flutter SDK tarball (or zip file) of that version from [here](https://docs.flutter.dev/release/archive?tab=linux)
- Create folder and extract the Flutter SDK there
  ```shell
  > mkdir ~/flutter_3_3_10
  > cd ~/flutter_3_3_10
  > tar xvf ~/Downloads/flutter_linux_3.3.10-stable.tar.xz
  ```
 
- Add `flutter` binary location to `PATH` variable inside your shell profile file (`~/.zshrc` , `~/.bashrc`)
  
  ```shell
  export PATH=$PATH:$HOME/flutter_3_3_10/flutter/bin
  ```

- Source `SHELL` profile file & Reload `SHELL`
 
