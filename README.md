# my dotfiles

## Things you'll see in here

- aerospace
- btop
- cava
- fastfetch
- ghostty
- karabiner
- lazygit
- lazyvim
- hammerspoon
- My Wallpaper (_Optional_)
- nvchad
- nvim
- sketchybar (with sbarlua)
- textfox (_LibreWolf Only!_)
- vimium-c (_Browser Extension!_)
- wezterm
- yazi
- zellij
- zshrc

## Things in the install script but not in the repo

- AirBattery
- AppDimmer
- Background Music
- Battery Toolkit
- DockDoor
- f.lux
- IINA
- Ice
- KeyCastr
- KeyboardHolder
- Latest
- Obsidian
- Raycast
- Self Control
- SlimHUD
- Tencent Lemon
- VSCodium
- YellowDot
- _Optional:_
  - Vivaldi/Zen/LibreWolf
  - Tor
  - JB Mono Nerd Font
  - SF Pro
  - SF Symbols
  - Maple Mono (NF CN)
  - sketchybar-app-font
  - BetterDisplay
  - LinearMouse
  - Clash Verge
  - MuseScore
  - QQMusic
  - WeChat
  - WPS Office
  - Zoom
- - A lot of useful CLI tools!

## Things NOT in here that I have

- [BoringNotch](https://github.com/TheBoredTeam/boring.notch) (No homebrew package)

## How to apply settings

> **IMPORTANT**
>
> This is only for macOS users!
>
> Also, make sure to backup your old dotfiles before applying my settings, as otherwise the install script might fail!

<details><summary>The easy way (with extra apps!)</summary>

Run:

```sh
cd
curl -fsSL https://raw.githubusercontent.com/matt-dong-123/dotfiles/refs/heads/main/install.sh | bash
```

</details>

<details><summary>The hard way (with no extras)</summary>

1. Install [brew](https://brew.sh)
2. Install gnu stow (`brew install stow`)
3. Install git (`brew install git`)
4. Clone this repo (`git clone https://github.com/matt-dong-123/dotfiles.git`)
5. Run `stow .` in the dotfiles directory

</details>

## Post-Install

<details><summary><b>Enabling the Vimium-C browser extension</b></summary>

1. Install the vimium-c browser extension
   - For Chromium-based browsers, go [here](https://chromewebstore.google.com/detail/vimium-c-%E5%85%A8%E9%94%AE%E7%9B%98%E6%93%8D%E4%BD%9C%E6%B5%8F%E8%A7%88%E5%99%A8/hfjbmagddngcpeloejdejnfgbamkjaeg)
   - For Firefox-based browsers, go [here](https://addons.mozilla.org/en-US/firefox/addon/vimium-c/)
2. In the preferences for the extension, click "Import Settings"
3. Choose the file "vimium_c.json" you just installed.
4. That's it!

</details>

<details><summary><b>Enabling librewolf_config (only necessary for manual install)</b></summary>

> **Important**
> This is only for Firefox/LibreWolf users!

1. Go to about:profiles in the url bar, and copy the "Root Directory" path of the profile you want to use
2. Run `install.sh` in ~/dotfiles/librewolf_config/
3. Paste the path you copied in step 1 into the script
4. You should be good to go!

> **Note**
> Installing the sidebery extension is recommended, but not required.
> There is also a default config that goes along textfox nicely.

</details>

<details><summary><b>Enabling zen_config (only for Zen Browser)</b></summary>

1. Go to about:profiles in the url bar, and copy the "Root Directory" path of the profile you want to use
2. Paste the zen_config directory into the profile directory/chrome.
3. You may have to find the zen themes and reinstall them through the website.
4. You should be good to go!

</details>

<details><summary><b>Enabling vivaldi config (only for Vivaldi)</b></summary>

1. Go to vivaldi:experiments, and enable "Allow CSS Modifications"
2. Search "Custom UI Modifications" and paste your .config/vivaldi directory into the text field

</details>

<details><summary><b>Enabling leaderkey config (only for Vivaldi)</b></summary>

1. Go to the LeaderKey settings and go to the "Advanced" tab
2. Set the config directory to your .config/leaderkey directory
3. Go back to "General" and set the shortcut to be "shift-command-space"

</details>

Thanks to @[Sin-cy](https://www.github.com/Sin-cy/) for providing the install.sh template in his own dotfiles!

You can raise issues if you run into any problems and bugs in the install script. I'll try as hard as I can!

**Remember, my dotfiles are for myself, so it might not work for you.**
