# Java <img src='https://cdn-icons-png.flaticon.com/512/5968/5968282.png' width="34">

> Assuming Linux Machine for this guide

**Check Java version (if it exists)**: `java --version` or `java -version`

## Installing an OpenJDK

Note that Java installations might be exiting on your computer in the form of **JREs and not JDKs**. You can see this when `java` command is found but the `javac` command is NOT found. Refer [JDK vs JVM vs JRE](https://www.digitalocean.com/community/tutorials/difference-jdk-vs-jre-vs-jvm)

So you'll need to install required extra libraries such as the **development variants of existing JRE packages**.

For, example in my **Fedora 38** system (having `dnf` package manager):

- You can view which kind of jdk package is existing on your system through the package manager as:

  ```sh
  dnf list installed | grep jdk
  ```

  Mine came with `java-17-openjdk-headless.x86_64` package which is just the JRE of OpenJDK 17

- To install the full JDK with all the development tools:

  - Search which JDKs are available from your package manager:

    ```sh
    dnf search jdk
    ```

  - I found my suited OpenJDK dev-tools package entry in that list as:

    ```txt
    java-17-openjdk-devel.x86_64 : OpenJDK 17 Development Environment
    ```

  - So I'll install that package via my package manager:

    ```sh
    sudo dnf install java-17-openjdk-devel.x86_64
    ```

---

You can also install JDKs from inside **IntelliJ** itself. The JDK is installed in the `~/.jdks` folder (like `~/.jdks/openjdk-20.0.2`)

You can add the installed JDK folder locations like `/usr/lib/jvm/jdk-11-oracle-x64` under configured JDKs in `Project Structure`

---

## Installing an Oracle JDK

- Download latest `.deb` package (or `.rpm` for Fedora) from [Official Oracle SE Downloads Page](https://www.oracle.com/java/technologies/downloads/)

- Double click on the downloaded file (like `jdk-19_linux-x64_bin.deb`) file and select `Install`

- Now `jdk` is installed in `jvm` folder somewhere. You can search for `jvm` as:

  ```sh
  whereis jvm
  jvm: /usr/lib/jvm
  ```

## Add Java to PATH

- Set Environment Variables in `$SHELL` Config file (i.e. `~/.zshrc`, `~/.bashrc` etc.)

  ```sh
  # Set "JAVA_HOME" environment variable to the jdk folder path
  export JAVA_HOME=$PATH:/usr/lib/jvm/jdk-11-oracle-x64
  # Add "java" to PATH
  export PATH=$PATH:$JAVA_HOME/bin
  ```

- Restart SHELL:

  ```sh
  exec $(which $SHELL)
  ```

- Now, `java` should be installed successfully :thumbsup:

  ```sh
  [kumar@lenovo-s340 ~]$ java --version
  java 11.0.22 2024-01-16 LTS
  Java(TM) SE Runtime Environment 18.9 (build 11.0.22+9-LTS-219)
  Java HotSpot(TM) 64-Bit Server VM 18.9 (build 11.0.22+9-LTS-219, mixed mode)
  [kumar@lenovo-s340 ~]$ javac --version
  javac 11.0.22
  ```

---

## Working with multiple Java installations

[DEV.to article](https://dev.to/thegroo/install-and-manage-multiple-java-versions-on-linux-using-alternatives-5e93)

It is possible for several programs fulfilling the same or similar functions to be installed on a single system at the same time. The `alternatives` system is intended to be a drop in replacement for Debian's `update-dependencies` script. It **creates, removes, maintains and displays information about the symbolic links** comprising the alternatives system. Refer [Red Hat article on `alternatives`](https://www.redhat.com/sysadmin/alternatives-command), [Baeldung post](https://www.baeldung.com/linux/update-alternatives-command) , [other guide](https://www.studytonight.com/linux-guide/update-alternatives-command-in-linux)

> When you install the `.rpm` or `.deb` package from Oracle or when you install OpenJDK via your package manager, these alternatives should get updated too

### Adding a Java installation to alternatives

```sh
# sudo update-alternatives --install <link> <name> <path> <priority>
sudo update-alternatives --install "/usr/bin/java" java "/home/kumar/.jdks/openjdk-20.0.2/bin/java" 5
```

Similarly, add alternatives for `javac` , `jar` etc. commands as applicable

You can also add follower links as:

`--install link name path priority [--follower link name path]...  [--initscript service] [--family name]`

### View details of alternatives of a command

```sh
update-alternatives --display java
```

### Switching between Java versions

Refer [this StackOverflow post](https://askubuntu.com/questions/740757/switch-between-multiple-java-versions) and [this Fedora guide](https://docs.fedoraproject.org/en-US/quick-docs/installing-java/#_switching_between_java_versions)

Pick between Java installations present

```sh
sudo alternatives --config java
```

Output: (`*` denotes best version available and `+` denotes current selection)

```txt
There are 3 programs which provide 'java'.

  Selection    Command
-----------------------------------------------
*+ 1           /usr/lib/jvm/jdk-11-oracle-x64/bin/java
   2           java-17-openjdk.x86_64 (/usr/lib/jvm/java-17-openjdk-17.0.9.0.9-3.fc39.x86_64/bin/java)
   3           java-latest-openjdk.x86_64 (/usr/lib/jvm/java-22-openjdk-22.0.0.0.36-1.rolling.fc39.x86_64/bin/java)

Enter to keep the current selection[+], or type selection number:
```

Update `JAVA_HOME` environment variable. If `jrunscript` doesn't work, set the variable manually in your SHELL profile file (`~/.zshrc` or `~/.bashrc`)

```sh
export JAVA_HOME="$(jrunscript -e 'java.lang.System.out.println(java.lang.System.getProperty("java.home"));')"
```

---

## Uninstall Java

```sh
# See Installed location & version:
# dnf list installed | grep jdk   # for Fedora
dpkg --list | grep jdk
# ii    jdk-17    17.0.2-ga    amd64    Java Platform Standard Edition Development Kit

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
```

---

References:

[Fedora Docs: Installing Java](https://docs.fedoraproject.org/en-US/quick-docs/installing-java/)



[Installing Java on Fedora](https://phoenixnap.com/kb/fedora-install-java)

[How to Install Java on Fedora: OpenJDK and Oracle JDK](https://phoenixnap.com/kb/fedora-install-java)

For installing Oracle JDK 8, refer [this](https://docs.datastax.com/en/jdk-install/doc/jdk-install/installOracleJdkDeb.html) and installing Java 8 SE `8u371`
