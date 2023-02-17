# Java Setup: 🍵

> Assuming Linux Machine

---

**Check Java Installed version (if present)**: $`java --version`

---

## Install Java

- Download  latest `.deb` package from [Official Oracele SE Downloads Page](https://www.oracle.com/java/technologies/downloads/)
- Double click on the downloaded `jdk-19_linux-x64_bin.deb` (or respective name) file and click `Install`
- Now `jdk` is installed in `jvm` folder somewhere
- You can search for `jvm` as:

  ```shell
  > whereis jvm
  jvm: /usr/lib/jvm
  ```

- Set Environment Variables in  `$SHELL`  Config file (i.e. `~/.zshrc`, `~/.bashrc` etc.)

  ```shell
  # Set "JAVA_HOME" environment variable to the jdk folder path
  export JAVA_HOME=/usr/lib/jvm/jdk-19
  # Add "java" to PATH
  export PATH=$PATH:$JAVA_HOME/bin
  ```

- Reload environment & restart `SHELL` :

  ```shell
  source ~/.zshrc  # or ~/.bashrc
  exec $SHELL
  ````

- Now, `java` should be installed successfully :thumbsup:

  ```shell
  > java --version
  java 19.0.2 2023-01-17
  Java(TM) SE Runtime Environment (build 19.0.2+7-44)
  Java HotSpot(TM) 64-Bit Server VM (build 19.0.2+7-44, mixed mode, sharing)
  ```

---

## Uninstall Java

```shell
# See Installed location & version
> dpkg --list | grep jdk
ii    jdk-17    17.0.2-ga    amd64    Java Platform Standard Edition Development Kit
> ls /usr/lib/jvm                                                              
jdk-17
> sudo update-alternatives --remove "java" "/usr/lib/jvm/jdk-17/bin/java"
> sudo update-alternatives --remove "javac" "/usr/lib/jvm/jdk-17/bin/javac"
> sudo update-alternatives --remove "javaws" "/usr/lib/jvm/jdk-17/bin/javaws"
> sudo rm -r /usr/lib/jvm/jdk-17
> gedit ~/.zshrc
# Remove "JAVA_HOME" variable and "java" PATH from Shell Config file i.e. ~/.zshrc, ~/.bashrc etc.
> sudo rm -rf /usr/lib/jvm  # Optionally, (if no other Java versions present)
> exec $SHELL
```
