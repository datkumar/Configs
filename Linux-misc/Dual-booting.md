# Dual-boot Setup

Here's how you can set up **Linux alongside your existing Windows** installation

> Before proceeding, it is recommended to back up your important files elsewhere in case something unexpected goes wrong.

Note that, whenever possible, it is recommended to install Linux on a separate drive than the one on which your Windows is installed. This is done so that Windows won't be interfering with your Linux partitions (in some rare cases, Windows updates might overwrite your Linux partitions)

If that's not possible, create an empty unallocated partition of appropriate size (refer minimum and recommended size requirements of the Linux distro) from the Windows Disk Management tool.

## Step 1: Create a bootable Live USB

- Download your desired Linux distribution's **ISO** (`.iso` file) from their respective official website. Some popular options are: [Ubuntu](https://ubuntu.com/download), [Mint](https://linuxmint.com/download.php), [Fedora](https://www.fedoraproject.org/#editions), [Pop!\_OS](https://system76.com/pop/download/) or even [Arch](https://archlinux.org/download/) if you're adventurous
- Flash that ISO onto a pendrive to create a live bootable USB. [Rufus](https://rufus.ie/en/), [Balena Etcher](https://etcher.balena.io/) are popular tools used for this purpose. Use either of `UEFI + GPT` or `BIOS + MBR` options
  - [UEFI](https://en.wikipedia.org/wiki/UEFI) is used on most modern systems and Legacy [BIOS](https://en.wikipedia.org/wiki/BIOS) on older hardware as the firmware to handle system initialization during the boot process
  - Accordingly, [GPT](https://en.wikipedia.org/wiki/GUID_Partition_Table) is used for modern systems and MBR for older systems as the disk partitioning scheme

## Step 2: Install Linux from your Live USB

- After the flashing process has completed, shut down your computer. Start your computer and repeatedly press the BIOS key (it's usually either of `F12`, `F10`, `Del` but refer your motherboard manufacturer manual to know exactly which one) while it's booting which should take you into the BIOS menu
- There, within the `Boot` tab, change the order such that your flashed USB's option is at the top, above the Windows option. Sometimes, you might also have to disable the `Secure Boot` option under the `Security` tab. Finally `Save and Exit` from the boot menu
- Then, you would come into [GRUB](https://www.google.com/search?q=linux+grub&udm=2) bootloader menu. Select `Try and Install ____`
- You can get a basic idea of using that Linux distro and then you're ready to install it, select the `Install ___` option present on the Desktop itself. It opens the distro's Installation wizard. Select the disk drive partitions and formats carefully during this process as they would be formatted (wiped off) afterwards and your data would be lost if you selected any wrong disk partition
- Once the installation wizard is finished, shutdown/restart the system and unplug your USB when your computer turns off.
- On startup, you should come into the GRUB bootloader and your Linux distro as well as Windows should be present among the options

## Removing dual boot

- Open BIOS menu. Set Windows as the first option in the boot order, (so that GRUB menu won't come and you would directly boot into Windows). Save and exit
- Inside Windows, open the Disk Management tool. Delete your appropriate Linux partitions from there. It would allow you to delete all the Linux partitions except the `EFI` one
- To delete the EFI partition, open CMD as Admin and run `diskpart` and inside it run commands as below. However, choose the appropriate disk and partition number as per what is present in your own system:

  ```PowerShell
  list disk

  select disk 1

  list partition

  select partition 2

  delete partition override

  exit
  ```
