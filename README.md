# dots

> [!note]
> Only use this with Sequoia. (maybe Ventura or Sonoma?)
> Don't fuck with this repo if you use Tahoe.

Instead of listing everything in it like a bozo, let me show you why:
- nvim => the greatest editor of all time, lua and plugins
- aerospace => since it's not an interface, i don't need it to be fancy (for that use yabai)
- zen browser => the most customizable browser out there, eye candy
- wezterm => fast af, has a ton of features, extremely customizable

You may think that the following are superior, but here's why they're not:
- vscode => slow af, not very customizable unless you just love the mess that is javascript
- helix => deez nuts, has like 1.5x the number of keystrokes. Wtf are you doing man? Plugins?
- kakoune => i'm not going to develop the editor itself when i use it!
- yabai => i don't like disabling SIP, thank you, next
- arc browser => a piece of unmaintained garbage
- vivaldi => still too conservative for me!
- tmux => the config for tmux is like reading the language of an alien
- kitty => i don't trust @kovidgoyal to make good decisions, also it's made in python, slow
- alacritty => tabs, please
- ghostty => second best, but still no copy and quick select yet

## Install Instructions
```sh
curl -fsSL https://raw.githubusercontent.com/matt-dong-123/dotfiles/refs/heads/main/install.sh
chmod +x install.sh
./install.sh
```

## Post-Install

<details><summary><b>Enabling the Vimium-C browser extension</b></summary>

1. Install the [vimium-c](https://addons.mozilla.org/en-US/firefox/addon/vimium-c/) browser extension
2. In the preferences for the extension, click "Import Settings"
3. Choose the file from the path "~/.config/vimium-c/config.json"

</details>

<details><summary><b>Enabling zen config</b></summary>

1. Go to about:profiles in the URL bar, and copy the "Root Directory" path of the profile you want to use
2. Paste the ~/.config/zen directory into the profile directory/chrome.
3. Go to settings, click "Import mods", and choose the file from the path "~/.config/zen/zen-mods.json"
4. Download the "Zen Internet" extension from [here](https://addons.mozilla.org/en-US/firefox/addon/zen-internet/)

</details>

<details><summary><b>Enabling leaderkey config</b></summary>

1. Go to the LeaderKey settings and go to the "Advanced" tab
2. Set the config directory to your ~/.config/leaderkey directory
3. Go back to "General" and set the shortcut to be "shift-command-space"

> **NOTE**
>
> Don't actually use this shortcut! Tap the right command key instead.

</details>
