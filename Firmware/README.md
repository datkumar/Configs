# Updating Firmware:-

## Ubuntu (tested on Dell Laptop)

Linux Vendor Firmware Service (LVFS) has been put together by device vendors & OEMs as a means for users to easily update their devices firmware using Linux. Dell and Lenovo in particular have been widely using the LVFS.

> Reference: [article](https://dellwindowsreinstallationguide.com/linux-vendor-firmware-service-uefi-bios-update-ubuntu/), [YT video](https://www.youtube.com/watch?v=BHNG_ls68s0)

- We'll use the `fwupdmgr` command.
- Useful argument options:
  - `get-devices` : show devices connected to the system can have their firmware updated
  - `get-updates` : searches for available firmware updates for devices connected to the system
  - `update` : to update the firmware of all devices
  - `update [DEVICE-ID|GUID]` : to update the firmware of a specific device
