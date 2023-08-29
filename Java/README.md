# Java <img src='https://cdn-icons-png.flaticon.com/512/5968/5968282.png' width="34">

> Assuming Linux Machine

> Also refer [JDK vs JVM vs JRE](https://www.digitalocean.com/community/tutorials/difference-jdk-vs-jre-vs-jvm) ,

> [Installing Java on Fedora](https://phoenixnap.com/kb/fedora-install-java)

---

**Check Java Installed version (if present)**: $`java --version`

---

## Install Java (Oracle JDK)

- Download latest `.deb` (or `.rpm`) package from [Official Oracle SE Downloads Page](https://www.oracle.com/java/technologies/downloads/)
- Double click on the downloaded `jdk-19_linux-x64_bin.deb` (or respective name) file and click `Install`
- Now `jdk` is installed in `jvm` folder somewhere
- You can search for `jvm` as:

  ```sh
  whereis jvm
  jvm: /usr/lib/jvm
  ```

- Set Environment Variables in `$SHELL` Config file (i.e. `~/.zshrc`, `~/.bashrc` etc.)

  ```sh
  # Set "JAVA_HOME" environment variable to the jdk folder path
  export JAVA_HOME=/usr/lib/jvm/jdk-19
  # Add "java" to PATH
  export PATH=$PATH:$JAVA_HOME/bin
  ```

- Restart SHELL:

  ```sh
  exec $(which $SHELL)
  ```

- Now, `java` should be installed successfully :thumbsup:

  ```sh
  java --version
  java 19.0.2 2023-01-17
  Java(TM) SE Runtime Environment (build 19.0.2+7-44)
  Java HotSpot(TM) 64-Bit Server VM (build 19.0.2+7-44, mixed mode, sharing)
  ```

---

# Switch Java Version

Refer [this StackOverflow post](https://askubuntu.com/questions/740757/switch-between-multiple-java-versions) and [this Fedora guide](https://docs.fedoraproject.org/en-US/quick-docs/installing-java/#_switching_between_java_versions)

```sh
# Pick between Java installations present
sudo update-alternatives --config java

# Update JAVA_HOME
export JAVA_HOME="$(jrunscript -e 'java.lang.System.out.println(java.lang.System.getProperty("java.home"));')"
```

---

## Uninstall Java

```sh
# See Installed location & version
dpkg --list | grep jdk
# ii    jdk-17    17.0.2-ga    amd64    Java Platform Standard Edition Development Kit
ls /usr/lib/jvm
jdk-17
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

## Java 8 Installation:

- Install the Java 8 SE `8u371` version x86 Compressed Archive from [the Oracle Downloads Page](https://www.oracle.com/in/java/technologies/downloads/#java8)
- Follow instructions on [this article](https://docs.datastax.com/en/jdk-install/doc/jdk-install/installOracleJdkDeb.html)
- Set the `JAVA_HOME` and add `java` to `PATH` in the SHELL config file (`~/.zshrc` or `~/.bashrc`)
- Reload SHELL: `exec $(which $SHELL)`
