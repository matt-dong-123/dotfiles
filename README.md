# dots

> [!note]
> Only use this with Sequoia. (maybe Ventura or Sonoma?)
> I have no idea what abominations would occur on Tahoe.

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

<details><summary><b>Setting up floorp</b></summary>

Work in progress...

</details>

<details><summary><b>Enabling leaderkey config</b></summary>

1. Go to the LeaderKey settings and go to the "Advanced" tab
2. Set the config directory to your ~/.config/leaderkey directory
3. Go back to "General" and set the shortcut to be "f13" by tapping the right command key

</details>

<details><summary>(OPTIONAL): Emacs</summary>

1. brew tap d12frosted/emacs-plus
2. brew install --cask emacs-plus
3. brew install --cask font-symbols-only-nerd-font
4. brew install cmake
5. Install doom emacs
6. Set font to "Maple Mono NF CN", variable font to "SF Pro", size to 20
7. Enable ligatures, eshell, vterm

</details>
