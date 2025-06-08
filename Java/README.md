# Java <img alt="Java" src='https://www.svgrepo.com/show/452234/java.svg' height="25">

## Check existing Java installation

On some Linux distros, Java comes installed by default; however it is **just the JRE and not the JDK**. You can verify this as `java` command is found but the `javac` command is NOT found.

```sh
java --version  # OR "java -version" for older java
javac --version
```

Refer these articles to know the differences between JDK, JRE and JVM:

- [Java Programming Environment and the Java Runtime Environment (JRE)](https://docs.oracle.com/cd/E19455-01/806-3461/6jck06gqd/index.html)
- [What are JDK, JRE, JVM and JIT in Java?](https://medium.com/@techietutor/what-are-jdk-jre-jvm-and-jit-in-java-a483ea4526a8)

In Fedora, the JREs/JDKs are stored within `/usr/lib/jvm`. So you can look into it's contents or query them as:

```sh
find /usr/lib/jvm -name java
find /usr/lib/jvm -name javac
```

## Installing an OpenJDK

I'm on Fedora where the package manager is `dnf`. You would be installing your desired OpenJDK via your respective Linux distro's package manager (like `apt` for Ubuntu/Debian):

- Search available OpenJDK packages to install:

  ```sh
  # Search available packages:
  dnf search openjdk

  # To know more about a specific package:
  dnf info java-latest-openjdk-devel-fastdebug
  ```

  <details>
  <summary>
  Here's my list of packages output for <code>dnf search openjdk</code> (as of Jun 2025):
  </summary>

  ```sh
  Matched fields: name, summary
  ant-openjdk21.noarch: ant binding for openjdk21
  java-21-openjdk.x86_64: OpenJDK 21 Runtime Environment
  java-21-openjdk-demo.x86_64: OpenJDK 21 Demos
  java-21-openjdk-demo-fastdebug.x86_64: OpenJDK 21 Demos optimised with full debugging on
  java-21-openjdk-demo-slowdebug.x86_64: OpenJDK 21 Demos unoptimised with full debugging on
  java-21-openjdk-devel.x86_64: OpenJDK 21 Development Environment
  java-21-openjdk-devel-fastdebug.x86_64: OpenJDK 21 Development Environment optimised with full debugging on
  java-21-openjdk-devel-slowdebug.x86_64: OpenJDK 21 Development Environment unoptimised with full debugging on
  java-21-openjdk-fastdebug.x86_64: OpenJDK 21 Runtime Environment optimised with full debugging on
  java-21-openjdk-headless.x86_64: OpenJDK 21 Headless Runtime Environment
  java-21-openjdk-headless-fastdebug.x86_64: OpenJDK 21 Runtime Environment optimised with full debugging on
  java-21-openjdk-headless-slowdebug.x86_64: OpenJDK 21 Runtime Environment unoptimised with full debugging on
  java-21-openjdk-javadoc.x86_64: OpenJDK 21 API documentation
  java-21-openjdk-javadoc-zip.x86_64: OpenJDK 21 API documentation compressed in a single archive
  java-21-openjdk-jmods.x86_64: JMods for OpenJDK 21
  java-21-openjdk-jmods-fastdebug.x86_64: JMods for OpenJDK 21 optimised with full debugging on
  java-21-openjdk-jmods-slowdebug.x86_64: JMods for OpenJDK 21 unoptimised with full debugging on
  java-21-openjdk-portable.x86_64: OpenJDK 21 Runtime Environment portable edition
  java-21-openjdk-portable-devel.x86_64: OpenJDK 21 Development Environment portable edition
  java-21-openjdk-portable-devel-fastdebug.x86_64: OpenJDK 21 Runtime and Development Environment portable edition optimised with full debugging on
  java-21-openjdk-portable-devel-slowdebug.x86_64: OpenJDK 21 Runtime and Development Environment portable edition unoptimised with full debugging on
  java-21-openjdk-portable-docs.x86_64: OpenJDK 21 API documentation
  java-21-openjdk-portable-fastdebug.x86_64: OpenJDK 21 Runtime Environment portable edition optimised with full debugging on
  java-21-openjdk-portable-misc.x86_64: OpenJDK 21 miscellany
  java-21-openjdk-portable-slowdebug.x86_64: OpenJDK 21 Runtime Environment portable edition unoptimised with full debugging on
  java-21-openjdk-portable-sources.x86_64: OpenJDK 21 full patched sources of portable JDK
  java-21-openjdk-portable-static-libs.x86_64: OpenJDK 21 libraries for static linking - portable edition
  java-21-openjdk-portable-static-libs-fastdebug.x86_64: OpenJDK 21 libraries for static linking - portable edition optimised with full debugging on
  java-21-openjdk-portable-static-libs-slowdebug.x86_64: OpenJDK 21 libraries for static linking - portable edition unoptimised with full debugging on
  java-21-openjdk-portable-unstripped.x86_64: The OpenJDK 21 runtime environment.
  java-21-openjdk-slowdebug.x86_64: OpenJDK 21 Runtime Environment unoptimised with full debugging on
  java-21-openjdk-src.x86_64: OpenJDK 21 Source Bundle
  java-21-openjdk-src-fastdebug.x86_64: OpenJDK 21 Source Bundle for packages with debugging on and optimisation
  java-21-openjdk-src-slowdebug.x86_64: OpenJDK 21 Source Bundle for packages with debugging on and no optimisation
  java-21-openjdk-static-libs.x86_64: OpenJDK 21 libraries for static linking
  java-21-openjdk-static-libs-fastdebug.x86_64: OpenJDK 21 libraries for static linking optimised with full debugging on
  java-21-openjdk-static-libs-slowdebug.x86_64: OpenJDK 21 libraries for static linking unoptimised with full debugging on
  java-latest-openjdk.x86_64: OpenJDK 24 Runtime Environment
  java-latest-openjdk-demo.x86_64: OpenJDK 24 Demos
  java-latest-openjdk-demo-fastdebug.x86_64: OpenJDK 24 Demos optimised with full debugging on
  java-latest-openjdk-demo-slowdebug.x86_64: OpenJDK 24 Demos unoptimised with full debugging on
  java-latest-openjdk-devel.x86_64: OpenJDK 24 Development Environment
  java-latest-openjdk-devel-fastdebug.x86_64: OpenJDK 24 Development Environment optimised with full debugging on
  java-latest-openjdk-devel-slowdebug.x86_64: OpenJDK 24 Development Environment unoptimised with full debugging on
  java-latest-openjdk-fastdebug.x86_64: OpenJDK 24 Runtime Environment optimised with full debugging on
  java-latest-openjdk-headless.x86_64: OpenJDK 24 Headless Runtime Environment
  java-latest-openjdk-headless-fastdebug.x86_64: OpenJDK 24 Runtime Environment optimised with full debugging on
  java-latest-openjdk-headless-slowdebug.x86_64: OpenJDK 24 Runtime Environment unoptimised with full debugging on
  java-latest-openjdk-javadoc.x86_64: OpenJDK 24 API documentation
  java-latest-openjdk-javadoc-zip.x86_64: OpenJDK 24 API documentation compressed in a single archive
  java-latest-openjdk-jmods.x86_64: JMods for OpenJDK 24
  java-latest-openjdk-jmods-fastdebug.x86_64: JMods for OpenJDK 24 optimised with full debugging on
  java-latest-openjdk-jmods-slowdebug.x86_64: JMods for OpenJDK 24 unoptimised with full debugging on
  java-latest-openjdk-portable.x86_64: OpenJDK 24 Runtime Environment portable edition
  java-latest-openjdk-portable-devel.x86_64: OpenJDK 24 Development Environment portable edition
  java-latest-openjdk-portable-devel-fastdebug.x86_64: OpenJDK 24 Runtime and Development Environment portable edition optimised with full debugging on
  java-latest-openjdk-portable-devel-slowdebug.x86_64: OpenJDK 24 Runtime and Development Environment portable edition unoptimised with full debugging on
  java-latest-openjdk-portable-docs.x86_64: OpenJDK 24 API documentation
  java-latest-openjdk-portable-fastdebug.x86_64: OpenJDK 24 Runtime Environment portable edition optimised with full debugging on
  java-latest-openjdk-portable-misc.x86_64: OpenJDK 24 miscellany
  java-latest-openjdk-portable-slowdebug.x86_64: OpenJDK 24 Runtime Environment portable edition unoptimised with full debugging on
  java-latest-openjdk-portable-sources.x86_64: OpenJDK 24 full patched sources of portable JDK
  java-latest-openjdk-portable-static-libs.x86_64: OpenJDK 24 libraries for static linking - portable edition
  java-latest-openjdk-portable-static-libs-fastdebug.x86_64: OpenJDK 24 libraries for static linking - portable edition optimised with full debugging on
  java-latest-openjdk-portable-static-libs-slowdebug.x86_64: OpenJDK 24 libraries for static linking - portable edition unoptimised with full debugging on
  java-latest-openjdk-portable-unstripped.x86_64: The OpenJDK 24 runtime environment.
  java-latest-openjdk-slowdebug.x86_64: OpenJDK 24 Runtime Environment unoptimised with full debugging on
  java-latest-openjdk-src.x86_64: OpenJDK 24 Source Bundle
  java-latest-openjdk-src-fastdebug.x86_64: OpenJDK 24 Source Bundle for packages with debugging on and optimisation
  java-latest-openjdk-src-slowdebug.x86_64: OpenJDK 24 Source Bundle for packages with debugging on and no optimisation
  java-latest-openjdk-static-libs.x86_64: OpenJDK 24 libraries for static linking
  java-latest-openjdk-static-libs-fastdebug.x86_64: OpenJDK 24 libraries for static linking optimised with full debugging on
  java-latest-openjdk-static-libs-slowdebug.x86_64: OpenJDK 24 libraries for static linking unoptimised with full debugging on
  maven-openjdk21.noarch: maven binding for openjdk21
  openjdk-asmtools-javadoc.noarch: Javadoc for openjdk-asmtools
  openjdk-asmtools7-javadoc.noarch: Javadoc for openjdk-asmtools7
  xmvn-toolchain-openjdk21.noarch: xmvn-minimal binding for openjdk21
  Matched fields: name
  javapackages-local-openjdk21.noarch: Non-essential macros and scripts for Java packaging support
  maven-local-openjdk21.noarch: Macros and scripts for Maven packaging support
  openjdk-asmtools.noarch: Set of tools used to assemble / disassemble proper and improper Java .class files
  openjdk-asmtools7.noarch: Set of tools used to assemble / disassemble proper and improper Java .class files for JDK version 11 and lesser
  ```

  </details>

  - On Ubuntu, there are lesser packages and the one you want to install is typically named like `openjdk-17-jdk` for the whole JDK toolset

  - You would get a list of packages available to install having various Java versions as well as the variant suffix in the package. The `headless` variants usually just include the **JRE**. To install the full JDK with all the necessary tools for Java development, we need the development variant of the package, usually containing the `-devel` term suffix in the name for `dnf`.

- Install your desired OpenJDK package from the packages list:

  ```sh
  # Installing the latest OpenJDK with optimized debugging
  sudo dnf install java-latest-openjdk-devel-fastdebug

  # Installing a specific version like OpenJDK 17
  # BEFORE Fedora 42:
  sudo dnf install java-17-openjdk-devel
  # AFTER Fedora 42:
  sudo dnf install temurin-17-jdk
  ```

- Verify installation by checking `java` and `javac` commands are found

> Since **Fedora 42**, the [`Adoptium`](https://adoptium.net) repository has been added to replace the older OpenJDK packages. Those JDKs are now available within the Eclipse `temurin` repository. Follow their [Fedora Instructions](https://adoptium.net/installation/linux/#_centosrhelfedora_instructions) to add `temurin` repo and install it's older JDKs:

- Add the `temurin` repo:

  ```sh
  sudo tee /etc/yum.repos.d/adoptium.repo > /dev/null <<'EOF'
  [Adoptium]
  name=Adoptium
  baseurl=https://packages.adoptium.net/artifactory/rpm/fedora/\$releasever/\$basearch
  enabled=1
  gpgcheck=1
  gpgkey=https://packages.adoptium.net/artifactory/api/gpg/key/public
  EOF
  ```

- Verify the `temurin-*` packages are now available via `dnf search temurin`:

  ```txt
  Matched fields: name, summary
  temurin-11-jdk.x86_64: Eclipse Temurin 11 JDK
  temurin-11-jre.x86_64: Eclipse Temurin 11 JRE
  temurin-17-jdk.x86_64: Eclipse Temurin 17 JDK
  temurin-17-jre.x86_64: Eclipse Temurin 17 JRE
  temurin-21-jdk.x86_64: Eclipse Temurin 21 JDK
  temurin-21-jre.x86_64: Eclipse Temurin 21 JRE
  temurin-23-jdk.x86_64: Eclipse Temurin 23 JDK
  temurin-23-jre.x86_64: Eclipse Temurin 23 JRE
  temurin-24-jdk.x86_64: Eclipse Temurin 24 JDK
  temurin-24-jre.x86_64: Eclipse Temurin 24 JRE
  temurin-8-jdk.x86_64: Eclipse Temurin 8 JDK
  temurin-8-jre.x86_64: Eclipse Temurin 8 JRE
  Matched fields: name
  adoptium-temurin-java-repository.noarch: Fedora package repository files for yum and dnf along with gpg public keys
  ```

## Installing an Oracle JDK

- Visit the [Official Oracle SE Downloads Page](https://www.oracle.com/java/technologies/downloads/). Locate your required Java version's downloads section

- Download the appropriate package for your platform. For RedHat based Linux distros like Fedora, download the `.rpm` package (and `.deb` for Ubuntu/Debian). Before downloading, you'll have to sign-in to Oracle and agree to the terms

- Double click on the downloaded file (like `jdk-11.0.24_linux-x64_bin.rpm`) and select `Install`. It will install and configure the Oracle JDK.

- Now that OracleJDK is installed, verify the `java` and `javac` commands being detected

## Installing JDKs via IntelliJ

You can also install JDKs from within IntelliJ itself:

- Click on the Gear icon ⚙️ and then go into `Project Structure`. Select `SDKs`, click `+` plus icon. Then select the JDK you wish to be downloaded and installed
- The JDK is installed in the `~/.jdks` folder, for example: `~/.jdks/openjdk-20.0.2/`

IntelliJ auto-detects your available JDK locations on your system. You can also add your existing JDK folder locations like `/usr/lib/jvm/jdk-11-oracle-x64` under configured JDKs in `Project Structure`

---

## Working with multiple Java installations

<!-- [DEV.to article](https://dev.to/thegroo/install-and-manage-multiple-java-versions-on-linux-using-alternatives-5e93) -->

The `update-alternatives` command in Linux (also called just `alternatives` in Fedora) **creates, removes, maintains and displays** information about the **symbolic links** comprising the alternatives system.

It is possible for several programs fulfilling the same or similar functions to be installed on a single system at the same time. A generic name in the filesystem is shared by all files providing interchangeable functionality. The alternatives system helps determine which actual file is referenced by this generic name.

Useful references:

- [`update-alternatives` - Linux manpage](https://man7.org/linux/man-pages/man1/update-alternatives.1.html)
- [Introduction to the alternatives command in Linux - RedHat](https://www.redhat.com/en/blog/alternatives-command)

> When you install OpenJDK via your package manager or Oracle-JDK from the downloaded file, the alternatives should automatically get updated during that process

### View available options for a command

```sh
update-alternatives --display java
```

The output would look like:

```txt
java - status is manual.
 link currently points to /usr/lib/jvm/java-21-openjdk-21.0.4.0.7-2.fc40.x86_64/bin/java
/usr/lib/jvm/java-21-openjdk-21.0.4.0.7-2.fc40.x86_64/bin/java - family java-21-openjdk.x86_64 priority 21000407
 ... follower links ...
/usr/lib/jvm/jdk-11.0.24-oracle-x64/bin/java - priority 184745984
 ... follower links ...
/usr/lib/jvm/java-22-openjdk-22.0.2.0.9-1.rolling.fc40.x86_64-fastdebug/bin/java - family java-latest-openjdk.x86_64 priority 1
 ... follower links ...
Current `best' version is /usr/lib/jvm/jdk-11.0.24-oracle-x64/bin/java.
```

Similarly, see alternative options list for `javac`

### Adding an alternatives entry for a command

If any alternative for your commands is NOT registered in the list, you can manually add them as:

```sh
sudo update-alternatives --install <link> <name> <path> <priority>
```

For example, I downloaded the JetBrains Runtime (JCEF) JDK from within IntelliJ, which was downloaded at `~/.jdks/jbrsdk_jcef-17.0.12/` folder; but it was not showing up in the alternatives list. So, I'll add the alternatives for `java` and `javac` as:

```sh
sudo update-alternatives --install /usr/bin/java java ~/.jdks/jbrsdk_jcef-17.0.12/bin/java 138
sudo update-alternatives --install /usr/bin/javac javac ~/.jdks/jbrsdk_jcef-17.0.12/bin/javac 138
```

Similarly, add alternatives for more commands like `jar`, `javadoc` etc. as required

You can also add follower links as:

`--install link name path priority [--follower link name path]...  [--initscript service] [--family name]`

### Switching between available alternatives of a command

<!-- Refer [this StackOverflow post](https://askubuntu.com/questions/740757/switch-between-multiple-java-versions) and [this Fedora guide](https://docs.fedoraproject.org/en-US/quick-docs/installing-java/#_switching_between_java_versions) -->

Pick between Java installations present

```sh
sudo update-alternatives --config java
```

The output would look like below. Note that `*` denotes best available version and `+` denotes your current selection:

```txt
There are 4 programs which provide 'java'.

  Selection    Command
-----------------------------------------------
 + 1           java-latest-openjdk.x86_64 (/usr/lib/jvm/java-23-openjdk-23.0.0.0.37-1.rolling.fc40.x86_64-fastdebug/bin/java)
*  2           /usr/lib/jvm/jdk-11.0.24-oracle-x64/bin/java
   3           java-21-openjdk.x86_64 (/usr/lib/jvm/java-21-openjdk-21.0.5.0.11-1.fc40.x86_64/bin/java)
   4           /home/kumar/.jdks/jbrsdk_jcef-17.0.12/bin/java

Enter to keep the current selection[+], or type selection number:
```

Similarly, choose among the alternative options for `javac`

> When you uninstall/remove your JDK packages, remember to delete the respective alternatives entries

### Removing an alternatives entry

For example, to remove the JCEF JDK's `java` command alternative entry:

```sh
sudo update-alternatives --remove java ~/.jdks/jbrsdk_jcef-17.0.12/bin/java
```

<!-- Update `JAVA_HOME` environment variable. If `jrunscript` doesn't work, set the variable manually in your SHELL profile file (`~/.zshrc` or `~/.bashrc`)

```sh
export JAVA_HOME="$(jrunscript -e 'java.lang.System.out.println(java.lang.System.getProperty("java.home"));')"
``` -->

---

## Add Java to PATH

> This should not be necessary if you are following the `update-alternatives` method to manage between Java installations and all entries are complete

However, to manually set the configuration in your shell profile, you can do as below:

- Set Environment Variables in your Shell config file (i.e. `~/.zshrc`, `~/.bashrc` etc.)

  ```sh
  # Set "JAVA_HOME" environment variable to the jdk folder path
  export JAVA_HOME=/usr/lib/jvm/jdk-11-oracle-x64
  # Add the binaries within JAVA_HOME like 'java', 'javac' to PATH
  export PATH=$PATH:$JAVA_HOME/bin
  ```

- Restart SHELL:

  ```sh
  exec $(which $SHELL)
  ```

- Now, `java` should be detected successfully

  ```sh
  [kumar@lenovo-s340 ~]$ java --version
  java 11.0.22 2024-01-16 LTS
  Java(TM) SE Runtime Environment 18.9 (build 11.0.22+9-LTS-219)
  Java HotSpot(TM) 64-Bit Server VM 18.9 (build 11.0.22+9-LTS-219, mixed mode)
  [kumar@lenovo-s340 ~]$ javac --version
  javac 11.0.22
  ```

<!-- --- -->

<!-- ## Uninstall Java -->

<!-- ```sh
# See Installed location & version:
dnf list installed | grep jdk

ls /usr/lib/jvm
# jdk-17

sudo update-alternatives --remove "java" "/usr/lib/jvm/jdk-17/bin/java"
sudo update-alternatives --remove "javac" "/usr/lib/jvm/jdk-17/bin/javac"
sudo update-alternatives --remove "javaws" "/usr/lib/jvm/jdk-17/bin/javaws"
sudo rm -r /usr/lib/jvm/jdk-17
gedit ~/.zshrc
# Remove "JAVA_HOME" variable and "java" PATH from Shell Config file i.e. ~/.zshrc, ~/.bashrc etc.
sudo rm -rf /usr/lib/jvm  # Optionally, (if no other Java versions present)
exec $(which $SHELL)
``` -->

<!-- --- -->

<!-- References:

[Fedora Docs: Installing Java](https://docs.fedoraproject.org/en-US/quick-docs/installing-java/)

[Installing Java on Fedora](https://phoenixnap.com/kb/fedora-install-java)

[How to Install Java on Fedora: OpenJDK and Oracle JDK](https://phoenixnap.com/kb/fedora-install-java)

For installing Oracle JDK 8, refer [this](https://docs.datastax.com/en/jdk-install/doc/jdk-install/installOracleJdkDeb.html) and installing Java 8 SE `8u371` -->
