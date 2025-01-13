# This is no longer just a dotfiles repo

## Things you'll see in here

- aerospace
- btop
- cava
- fastfetch
- karabiner
- nvim (with lazyvim)
- sketchybar (with sbarlua)
- thefuck
- vimium-c (_Browser Extension!_)
- wezterm
- yazi
- zellij
- zshrc

## Things in the install script but not in the repo

- AirBattery
- AppDimmer
- Background Music
- DockDoor
- f.lux
- IINA
- Ice
- KeyCastr
- KeyClu
- KeyboardHolder
- Latest
- MiddleClick
- Obsidian
- Raycast
- Self Control
- SlimHUD
- Tencent Lemon
- VSCode
- YellowDot
- _Optional:_
  - Arc or Zen
  - Tor
  - JB Mono Nerd Font
  - SF Pro
  - SF Symbols
  - BetterDisplay
  - LinearMouse
  - Clash Verge
  - MuseScore
  - QQMusic
  - WeChat
  - WPS Office
  - Zoom

## Things NOT in here that I have

- [Batfi](https://github.com/rurza/BatFi) (No homebrew package)
- [BoringNotch](https://github.com/TheBoredTeam/boring.notch) (No homebrew package)

## How to apply settings

<details><summary>The easy way (with extra <i>FREE</i> apps!)</summary>

Run:

```sh
cd
curl -fsSL https://raw.githubusercontent.com/matt-dong-123/dotfiles/refs/heads/main/install.sh
chmod +x ~/install.sh
/bin/bash ~/dotfiles/install.sh
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

Thanks to @[Sin-cy](https://www.github.com/Sin-cy/) for providing the install.sh template in his own dotfiles!

You can raise issues if you run into any problems. I'll try as hard as I can!

**Remember, my dotfiles are for myself, so it might not work for you.**
