# Firefox <img alt="Firefox" src='https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Firefox_logo%2C_2019.svg/1200px-Firefox_logo%2C_2019.svg.png' height="25">

## Firefox browser settings

### General Settings

- Startup: Open previous windows and tabs
- Tabs:
  - Confirm before closing multiple tabs
  - Confirm before quitting with Ctrl+Q
  - Show an image preview when you hover on a tab
- Language and Appearance: Automatic
- Downloads: Always ask you where to save files
- Play DRM-controlled content
- Browsing:
  - Use autoscrolling
  - Use smooth scrolling
  - Enable Picture-in-Picture video controls

### Privacy & Security Settings

- Enhanced Tracking Protection: Standard
- Website Privacy Preferences:
  - Tell websites not to sell or share my data
  - Send websites a “Do Not Track” request
- Cookies and Site Data: Delete cookies and site data when Firefox is closed (Add Exceptions)
- History (Custom settings)
  - Remember browsing and download history
  - Remember search and form history
- Permissions:
  - Block pop-up windows
  - Warn you when websites try to install add-ons
- Firefox Data Collection and Use: Uncheck all
- Website Advertising Preferences: false

### More Configuration

Your firefox settings are stored in your **Profile folder**. To know location of your profile folder, enter `about:support` in your search bar. Under the `Application Basics` table search for the `Profile Directory` entry

Refer [this post](https://support.mozilla.org/en-US/kb/profiles-where-firefox-stores-user-data) to know which files store what data. The main ones to consider are:

| File                                         | Purpose                                                                                                                                                     |
| -------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `places.sqlite`                              | All your Firefox bookmarks and lists of all the files you've downloaded and websites you’ve visited                                                         |
| `bookmarkbackups/`                           | Folder that stores bookmark backup files, which can be used to restore your bookmarks                                                                       |
| `extensions/`                                | This folder (if exists), stores files for any extensions you have installed                                                                                 |
| `permissions.sqlite`, `content-prefs.sqlite` | Site-specific preferences and permissions (like allowing popups, zoom levels etc.) on a site-by-site basis                                                  |
| `prefs.js`                                   | Stores customized user preference settings, such as changes you make in Firefox Settings dialogs and in customizing toolbars                                |
| `key4.db`, `logins.json`                     | Your passwords are stored in these two files. Refer [here](https://support.mozilla.org/en-US/kb/password-manager-remember-delete-edit-logins) for more info |

#### Extensions

I've stored my list of Firefox extensions in `extensions.txt` file that you can download from the [add-ons page](https://addons.mozilla.org/en-US/firefox/extensions/)

#### Bookmarks

I've exported my list of bookmarks in `bookmarks.html` as an HTML file. To enable bookmarks being saved as HTML file, visit `about:config` in search bar and set the `browser.bookmarks.autoExportHTML` property to `true`

#### Tabs

I use the [Simple Tab Groups](https://addons.mozilla.org/en-US/firefox/addon/simple-tab-groups/) extension to manage browser tabs in Firefox. It backs up your tabs periodically into within `Downloads` folder under folder names start with `STG-backups-`

### Cookie exceptions

I've stored my list of cookie-exceptions in `cookie-exceptions.txt` file stating site whose cookies aren't being deleted when browser closes

#### Manual exports

Some settings have to be manually export such as you can see:

- UBlock Origin filtersare in the `ublock-filters.txt` file
- Tabliss settings settings in the `tabliss.json` file

#### Shortcuts

It's handy to know a few of the Firefox [Keyboard shortcuts](https://support.mozilla.org/en-US/kb/keyboard-shortcuts-perform-firefox-tasks-quickly)

---

## Firefox Developer Edition <img alt="Firefox Developer Edition" src='https://upload.wikimedia.org/wikipedia/commons/3/30/Firefox_Developer_Edition_logo%2C_2019.svg' width="22">

- Download Tarball from [their site](https://www.mozilla.org/en-US/firefox/developer/)

- Extract contents into `/opt/` and rename folder to `firefox-dev`

  ```sh
  sudo tar xjf ~/Downloads/firefox-*.tar.bz2 -C /opt
  sudo mv /opt/firefox /opt/firefox-dev
  ```

- Create Desktop entry `nano ~/.local/share/applications/firefox-dev.desktop`. Paste below contents and save it.

  ```txt
  [Desktop Entry]
  Name=Firefox Developer
  GenericName=Firefox Developer Edition
  Comment=Firefox Developer Edition Web Browser.
  Exec=/opt/firefox-dev/firefox %u
  Type=Application
  Terminal=false
  Icon=/opt/firefox-dev/browser/chrome/icons/default/default128.png
  Categories=Application;Network;X-Developer;
  StartupWMClass=firefox-aurora
  ```

- Allow the desktop application to execute

  ```sh
  chmod +x ~/.local/share/applications/firefox-dev.desktop
  ```

- Enable automatic updates for Firefox Developer Edition

  ```sh
  # Check previous owner
  ls -al /opt

  # Change owner to current user
  sudo chown $USER:$USER /opt/firefox-dev

  # Check current owner
  ls -al /opt
  ```

  In the `General` tab of Settings, in the `Firefox Developer Edition Updates` section, select the `Automatically install updates (recommended)` option

---

## Tor Browser <img  alt="Tor browser" src='https://styleguide.torproject.org/static/images/tor-browser/stable/stable.svg' height="25">

- Download tarball from [their site](https://www.torproject.org/download/)

- Extract it's contents into your home folder

  ```sh
  tar -xf ~/Downloads/tor-browser-linux*.tar.xz -C ~
  ```

- See it's contents. It would contain `Browser` folder and `start-tor-browser.desktop` file

  ```sh
  cd ~/tor-browser
  ls
  ```

- Make the start-tor-browser.desktop script executable

  ```sh
  chmod +x start-tor-browser.desktop
  ```

- Register and start the application

  ```sh
  # Register as desktop app
  ./start-tor-browser.desktop --register-app
  # Start Tor browser with verbose output
  ./start-tor-browser.desktop --verbose
  ```
