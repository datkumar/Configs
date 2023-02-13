# Flutter & Android Studio :iphone: 

> Assuming Linux Machine with Java installed

## Install Android Studio:

- Install additional required Linux 64-bit binaries by running [these commands](https://developer.android.com/studio/install#64bit-libs)
- Download [zip file from here](https://developer.android.com/studio) and follow [these instructions](https://developer.android.com/studio/install#linux)
- Extract it to `/usr/local/` 
- Now, you can run Android Studio via 
  
  ```shell
  > sh /usr/local/android-studio/bin/studio.sh
  ```

- Create Desktop Entry via `Tools > Create Desktop Entry`
- Add Android SDK to `PATH` in `~/.zshrc` (or your respective shell profile file like `~/.bashrc`):

  ```shell
  export ANDROID_HOME=$HOME/Android/Sdk
  export PATH=$PATH:$ANDROID_HOME/platform-tools
  ```

---

## Install Flutter:

- Create folder `~/flutter_stable`
- Inside folder, clone latest `stable` branch of [official flutter repo](https://github.com/flutter/flutter):

  ```shell
  > git clone https://github.com/flutter/flutter.git -b stable
  ```

- Add `flutter` to `PATH` in `~/.zshrc` (or your respective shell profile file like `~/.bashrc`):

  ```shell
  export PATH=$PATH:/home/kumar/flutter_stable/flutter/bin`
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

- Install Android Command-line Tools from Android Studio: 

  `File > Settings > System Settings > SDK Tools > Android SDK Command-line Tools (latest)` 

- Link your installed Java version to Android Studio 

  ```shell
  > cd /usr/local/android-studio && ln -s jbr jre
  ```

- To accept licenses, run `flutter doctor --android-licenses`

---

**Now everything should work 👍🏻**

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
