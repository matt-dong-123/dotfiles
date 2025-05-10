# easyjump.yazi

A Yazi plugin which like hop.nvim in Neovim, allow use key char to precise selection.

> [!NOTE]
> The latest main branch of Yazi is required at the moment.

https://github.com/DreamMaoMao/easyjump/assets/30348075/6ba722ce-8b55-4c80-ac81-b6b7ade74491

## Install

### Linux

```bash
git clone https://github.com/DreamMaoMao/easyjump.yazi.git ~/.config/yazi/plugins/easyjump.yazi
```

### Windows

With `Powershell` :

```powershell
if (!(Test-Path $env:APPDATA\yazi\config\plugins\)) {mkdir $env:APPDATA\yazi\config\plugins\}
git clone https://github.com/DreamMaoMao/easyjump.yazi.git $env:APPDATA\yazi\config\plugins\easyjump.yazi
```

## Usage

set shortcut key to toggle easyjump mode in `~/.config/yazi/keymap.toml`. for example set `i` to toggle easyjump mode

```toml
[[manager.prepend_keymap]]
on   = [ "i" ]
run = "plugin easyjump"
desc = "easyjump"
```

When you see some character(singal character or double character) in left of the entry.
Press the key of the character will jump to the corresponding entry
