# Java Setup: 🍵

> Assuming Linux Machine

## Check Java Installed version (if present)

```shell
> java --version
```

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
# Remove `JAVA_HOME` and java `PATH` from Shell Config file i.e. `~/.zshrc`, `~/.bashrc` etc.
> sudo rm -rf /usr/lib/jvm  # Optionally, (if no other Java versions present)
> exec $SHELL
```
