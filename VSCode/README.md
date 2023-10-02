# VSCode <img src='https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/2048px-Visual_Studio_Code_1.35_icon.svg.png' height="27">

## Install VSCode on Linux

https://code.visualstudio.com/docs/setup/linux

---

## Add `Open in Code` right-click option

Execute the bash script from [this repo](https://github.com/harry-cpp/code-nautilus)

```bash
wget -qO- https://raw.githubusercontent.com/harry-cpp/code-nautilus/master/install.sh | bash
```

---

## Settings

My Settings: [`settings.json`](./settings.json)

```json
{
  "workbench.startupEditor": "none",
  "window.titleBarStyle": "custom",
  "workbench.colorTheme": "Community Material Theme Palenight High Contrast",
  "editor.mouseWheelZoom": true,
  "git.autofetch": true,
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "editor.formatOnSave": true,
  "[markdown]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "database-client.telemetry.usesOnlineServices": false,
  "workbench.iconTheme": "material-icon-theme",
  "window.zoomLevel": 1,
  "editor.fontFamily": "'FiraCode Nerd Font', 'Droid Sans Mono', 'Noto Color Emoji', 'monospace', monospace",
  "editor.fontLigatures": true,
  "terminal.integrated.fontFamily": "'CodeNewRoman Nerd Font Mono', 'Noto Color Emoji'",
  "markdownlint.config": {
    "no-inline-html": false
  }
}
```

Set `window.titleBarStyle` option to `custom` in settings

VSCode Settings are stored in `~/.config/Code/User/settings.json` . Refer [this post](https://stackoverflow.com/questions/53840644/location-of-vs-code-preferences)

## Extensions

List VSCode Extensions: `code --list-extensions`

### My Extensions

> **Utils:**

- Path Intellisense
- Prettier
- ESLint
- Auto Close Tag
- Auto Rename Tag
- :emojisense:

> **Git & Markdown:**

- Git Extension Pack
- GitHub Markdown Preview
- Markdownlint

> **Dev:**

- ES7+ React/Redux/React-Native snippets
- C/C++
- MySQL (Weijan Chen)
- Tailwind CSS IntelliSense
- Astro
- Pretty TypeScript Errors
- pgFormatter
- node-snippets
- Go

> **Themes:**

- Community Material Theme
- Material Icon Theme
- Atom One Dark Theme

Export & Install Extensions: [Check this post](https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list)

---

## Snippets:

- [C++](cpp.json)
- [JavaScript](./javascript.json)

---
