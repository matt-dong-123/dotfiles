# my dotfiles

## Dotfiles include

- aerospace
- bat
- btop
- borders
- espanso
- fastfetch
- hammerspoon
- karabiner
- lazygit
- leaderkey
- nvim
- sketchybar
- wezterm
- yazi
- .zshrc

## Manual setup

- mtab
- vimium-c
- Zen

## How to apply settings

> [!important]
>
> This is only for macOS users!
>
> Also, make sure to backup your old dotfiles before applying my settings, as otherwise the install script might fail!

Run:

```sh
curl -fsSL https://raw.githubusercontent.com/matt-dong-123/dotfiles/refs/heads/main/install.sh
./install.sh
```

## Post-Install

<details><summary><b>Enabling the Vimium-C browser extension</b></summary>

1. Install the vimium-c browser extension
   - For Chromium-based browsers, go [here](https://chromewebstore.google.com/detail/vimium-c-%E5%85%A8%E9%94%AE%E7%9B%98%E6%93%8D%E4%BD%9C%E6%B5%8F%E8%A7%88%E5%99%A8/hfjbmagddngcpeloejdejnfgbamkjaeg)
   - For Firefox-based browsers, go [here](https://addons.mozilla.org/en-US/firefox/addon/vimium-c/)
2. In the preferences for the extension, click "Import Settings"
3. Choose the file from the path "~/.config/vimium-c/config.json"

</details>

<details><summary><b>Enabling stylus config</b></summary>

1. Install the stylus browser extension
   - For Chromium-based browsers, go [here](https://chromewebstore.google.com/detail/mtab/clngdbkpkpeebahjckkjfobafhncgmne)
   - For Firefox-based browsers, go [here](https://addons.mozilla.org/en-US/firefox/addon/styl-us)
2. In the preferences for the extension, click "Import" you can see on the side
3. Choose the file from the path "~/.config/stylus/config.json"
    - If you want to use only a set of rules, copy the rules you want to the stylus editor.

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

> [!note]
>
> Don't actually use this shortcut! Tap the right command key instead.

</details>

You can raise issues if you run into any problems and bugs. I'll try as hard as I can!

**Remember, my dotfiles are for myself, so it might not work for you.**
