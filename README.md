# matt-dong-123's AWESOME dotfiles for MacOS

## Things you'll see

- aerospace
- btop
- cava
- fastfetch
- fish
- karabiner
- nvim (with lazyvim)
- sketchybar (with sbarlua)
- thefuck
- vimium-c (_Browser Extension!_)
- wezterm
- yazi
- zshrc

## How to apply settings

### Install through script (with many bonus applications)

Run:

```
cd
curl -fsSL https://raw.githubusercontent.com/matt-dong-123/dotfiles/refs/heads/main/install.sh
chmod +x ~/install.sh
/bin/bash ~/dotfiles/install.sh
```

### Manual Install (bare, no extras)

1. Install [brew](https://brew.sh)
2. Install gnu stow (`brew install stow`)
3. Install git (`brew install git`)
4. Clone this repo (`git clone https://github.com/matt-dong-123/dotfiles.git`)
5. Run `stow .` in the dotfiles directory

### Post-Install

#### Vimium-c

1. Install the vimium-c browser extension
   - For Chromium-based browsers, go [here](https://chromewebstore.google.com/detail/vimium-c-%E5%85%A8%E9%94%AE%E7%9B%98%E6%93%8D%E4%BD%9C%E6%B5%8F%E8%A7%88%E5%99%A8/hfjbmagddngcpeloejdejnfgbamkjaeg)
   - For Firefox-based browsers, go [here](https://addons.mozilla.org/en-US/firefox/addon/vimium-c/)
2. In the preferences for the extension, click "Import Settings"
3. Choose the file "vimium_c.json" you just installed.
4. That's it!

Thanks to [Sin-cy]("https://www.github.com/Sin-cy/") for providing the install.sh template in his own dotfiles!

You can raise issues if you run into any problems. I'll try as hard as I can!

**Remember, my dotfiles are for myself, so it might not work for you.**
