# Post-install steps

## Settings and De-bloating

### Personalize

- Display scaling: 125% or 100%
- Theme: Dark. Disable transparency effects. Set accent color
- Desktop Icon settings (which ones to show): Computer, User Folder, Recycle Bin
- Background etc
- Lock screen disable unnecessary content
- Go to `System` > `Rename PC` > Set name like `lenovo-win11`

### Settings

- Privacy > Disable everything
- Taskbar Settings: Hide or turn off all widgets

### Edge Browser

- Customize look (colors, layout etc)
- Disable new tab's sponsored content
- Make Google default search engine
- Search on new tab uses: Address Bar

### Add/Remove Programs

Uninstall unused applications like: Weather, Xbox, Mcafee, Cortana (maybe OneDrive too)

### File Explorer

- Click on `View` > `Show` > `Hidden Items`
- On left side tab, right click OneDrive. Go to Settings. Select `Unlink PC`

  If you had accidentally saved files there, login to OneDrive from Firefox. Download your files. Delete all files from there. And delete from it's Bin too

### Disable web results in Start-menu Search

As per [this](https://youtu.be/SW6rAv3WcvY?si=yA2ReUeLCh355MnS) video:

- Open **Registry Editor**
- Go to `Computer\HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows`
- Create new `Key` called `Explorer`
- Double click that Key folder. On the table-side, right click and create new `DWORD (32-bit)`. Name it `DisableSearchBoxSuggestions`
- Double click on the `DWORD` and set it to `1`
- Restart computer

---

## Install programs via `winget`

`winget` usage: `search`, `show`, `install`, `list`, `update`

Browse winget packages at: [winget.run](https://winget.run/), [winstall.app](https://winstall.app/)

My `winget` programs are installed as (run Terminal as Admin):

```sh
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Mozilla.Firefox
winget install -e --id Google.Chrome
winget install -e --id Git.Git
winget install -e --id VideoLAN.VLC
winget install -e --id Notepad++.Notepad++
winget install -e --id JGraph.Draw
winget install fastfetch
```

Updating packages: `winget upgrade --all`

---

## Windows Terminal setup

- Make **Git-bash** as default
- Change color scheme, font settings, default to Git Bash

If Git Bash profile not added within the terminal, refer [this article](https://www.timschaeps.be/post/adding-git-bash-to-windows-terminal/)

### Git Bash

- The home folder `~` is `/c/Users/kumar` which in Windows Powershell/CMD would translate to `C:\Users\kumar`
- The default existing git-bash global profile file is: `/etc/bash.bashrc`
- You can create an extra one in home folder as: `touch ~/.bash_profile`. Refer [this](https://superuser.com/questions/602872/how-do-i-modify-my-git-bash-profile-in-windows) answer. Paste below lines into that file, save it. Then restart terminal:

  ```sh
  alias cls=clear
  alias gedit=notepad
  alias refreshenv="exec $(which $SHELL)"
  ```
