# Linux misc. <img alt="Linux" src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Tux.svg/506px-Tux.svg.png" height="25">

## Time-sync

In a **dual-boot** system, if your Windows and Linux systems show different times where only one of them is correct, run the below command to sync them. Refer [this article](https://itsfoss.com/wrong-time-dual-boot/) and [this post](https://askubuntu.com/questions/169376/clock-time-is-off-on-dual-boot) for more info

```sh
timedatectl set-local-rtc 1 --adjust-system-clock
```

## Static IP reservation

Here's how to reserve an IP address on your home router for your computer's wired i.e. ethernet interface connection on your home network. (Similar steps would work for WiFi interface too)

- Log into the **Admin panel** of your router (usually by visiting `192.168.0.1`) **from another** interface or device . For example, when reserving ethernet ip address, log into router admin via wifi internet access or from another computer

- Check the output of `ifconfig` in terminal. The one after `ether` is your **MAC address**. Add an entry of this MAC address under the `Address Reservation` section under **DHCP** in your router's Admin panel (the exact section name might differ based on your router). After adding the entry, enable it too
- Now back in the `ifconfig` output, note the value after `netmask` which is your **subnet mask**. Typically it is `255.255.255.0` meaning `/24`
- Last value we need is the **gateway**. Go to the `Network` section in your Settings. Look into the details of your existing wired connection (which automatically assigned by DHCP) by clicking on the ⚙️ icon. The value mentioned for `Default Route` is your gateway (mine was `192.168.0.1`)
- Turn off your wired connection, or disconnect the ethernet wire from computer. Open wired settings under Network section of Settings. Set the IPv4 method to **Manual**
- Go to the `IPv4` tab. Set the method as `Manual` from the earlier DHCP one. Set the various parameters for your new reserved IP in there like:

  ```txt
  Address: 192.168.0.111
  Netmask: 255.255.255.0
  Gateway: 192.168.0.1
  ```

## DNS

I use Cloudflare DNS. Their IP addresses for their DNS as per [their page](https://developers.cloudflare.com/1.1.1.1/ip-addresses/) are:

| IPv4      | IP6                    |
| --------- | ---------------------- |
| `1.1.1.1` | `2606:4700:4700::1111` |
| `1.0.0.1` | `2606:4700:4700::1001` |

You can set these on your computer and or on your router

View your set DNS settings: `resolvectl status`

---

## Mounting Drive Partitions

- The mounted drives/partitions for your Linux system are maintained in a **File System Table** file stored as `/etc/fstab`
- The first few entries are for your base system partitions, created during your installation of your distro. You can add more entries below it to indicate which partitions are present in your system so they will be automatically mounted on system startup

- To know the various drives/partitions available in your system, use the `lsblk` command:

  ```sh
  # List available partitions along with the filesystem type
  lsblk -f
  # View available columns
  lsblk --list-columns
  # List specified columns information about the partitions available
  lsblk -o NAME,TYPE,FSTYPE,FSVER,SIZE,FSUSED,LABEL,UUID,MOUNTPOINT
  ```

- The format for each entry as below. You can refer [my fstab file](https://github.com/datkumar/Configs/blob/main/config-files/fstab) too

  ```txt
  HardwareID  MountPointDirectory  FileSystem  MountOptions  dump  fsck
  ```

  So an example entry would be:

  ```sh
  UUID=B6E61AD6E61A96A9  /mnt/old-pc-hdd  ntfs  defaults  0  0
  ```

- Make sure the mountpoint folders (like `/mnt/old-pc-hdd`) exist before writing the entries in the `fstab` file. If not existing, create them via `mkdir`
- After you're done editing the `fstab` file, run `sudo systemctl daemon-reload` to load those changes

---

## Symbolic links

Note that the `TARGET` can be a file or even a directory

```sh
# Creating a symbolic link (fails if symlink exists already)
ln -s TARGET LINKNAME

# Create/update a symbolic link
ln -sf TARGET LINKNAME
```

---

## Brightness of External Monitor

Laptop has buttons to increase/decrease brightness but no such option for monitors. For that, we make use of the `ddcutil` command. It provides a set of VCP (Virtual Control Panel) codes to adjust values of various settings such as brightness contrast, display-mode etc

```sh
# See how your monitor details
ddcutil detect

# See available VCP control codes
ddcutil capabilities

# Get Brightness details (my VCP code for it was 10)
# It shows current value and range of valuees allowed too
ddcutil getvcp 10

# Set brightness to a certain value
ddcutil setvcp 10 33

# Relatively increment/decrement brightness
ddcutil setvcp 10 + 5
ddcutil setvcp 10 - 5
```

For convenience, you can add your brightness setup within your shell config file itself (`~/.zshrc` or `~/.bashrc`)

```sh
alias get-brightness="ddcutil getvcp 10"
alias set-brightness="ddcutil setvcp 10"
alias bright++="ddcutil setvcp 10 + 5"
alias bright--="ddcutil setvcp 10 - 5"

# Set brightness to zero after 7PM
if [[ $(date +"%H") -ge 19 ]] then
  set-brightness 0
fi
```
