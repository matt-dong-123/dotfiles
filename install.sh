#!/bin/bash

# Install xCode cli tools
if [[ "$(uname)" == "Darwin" ]]; then
    echo "macOS deteted..."

    if xcode-select -p &>/dev/null; then
        echo "Xcode already installed"
    else
        echo "Installing commandline tools..."
        xcode-select --install
    fi
fi

# Install oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
## install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
## install fzf-tab
git clone https://github.com/Aloxaf/fzf-tab.git ~/.oh-my-zsh/custom/plugins/fzf-tab
## install powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap homebrew/services
brew tap nikitabobko/tap
brew tap dimentium/autoraise
brew tap FelixKratz/formulae
brew tap lihaoyun6/tap
brew tap mhaeuser/mhaeuser

## Formulae
echo "Installing Brew Formulae... (Press C-c to cancel installing any of the formulae you don't want)"
### Must Have things
brew install stow
brew install fzf
brew install bat
brew install fd
brew install zoxide
brew install lua
brew install luajit
brew install luarocks
brew install make
brew install ripgrep
brew install ffmpeg
brew install sketchybar
# installing sbarlua
if [ ! -d "$HOME/SBarLua" ]; then
    (git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)
fi
brew install yazi
brew install neovim
brew install tmux
brew install git
brew install lazygit

### Terminal
brew install tree-sitter
brew install tree
brew install borders
brew install btop
brew install cava
brew install fastfetch
brew install fish
brew install cowsay
brew install eza
brew install fortune
brew install wifi-password
brew install autoraise
brew install cmatrix
brew install sl
brew install yt-dlp
brew install wtf
brew install pipes-sh
brew install neovide
brew install pnpm

### dev things
brew install node
brew install nvm
brew install sqlite

## Casks (you'll have to configure them yourselves)
# wait till i learn nix :)
echo "Installing Brew Casks... (Press C-c to cancel installing any of the casks you don't want)"
brew install --cask aerospace
brew install --cask karabiner-elements
brew install --cask hammerspoon
brew install --cask espanso
brew install --cask battery-toolkit
read -p "Choose a terminal emulator to install: (BOTH/wezterm/ghostty/none) " terminal
if [ "$terminal" = "wezterm" ]; then
    echo "Installing wezterm..."
    brew install --cask wezterm
elif [ "$terminal" = "ghostty" ]; then
    echo "Installing ghostty..."
    brew install --cask ghostty
elif [ "$terminal" = "none" ]; then
    echo "No terminal emulator will be installed"
else
    echo "Installing both..."
    brew install --cask wezterm
    brew install --cask ghostty
fi

# Ask the user whether they want to install extra casks
read -p "Do you want to install extras? (Y/n) " answer
if [ "$answer" != "N" ] && [ "$answer" != "n" ]; then
    echo "Installing Extras... (Press C-c to cancel installing any of the extras you don't want)"
    brew install --cask airbattery
    brew install --cask appdimmer
    brew install --cask dockdoor
    brew install --cask flux
    brew install --cask iina
    brew install --cask jordanbaird-ice
    brew install --cask keycastr
    brew install --cask keyboardholder
    brew install --cask obsidian
    brew install --cask raycast
    brew install --cask slimhud
    brew install --cask tencent-lemon
    brew install --cask vscodium
    brew install --cask yellowdot
fi

read -p "Choose a browser to install: (NONE/brave/zen/librewolf) " browser
if [ "$browser" = "arc" ]; then
    echo "Installing Brave..."
    brew install --cask brave-browser
elif [ "$browser" = "zen" ]; then
    echo "Installing Zen..."
    brew install --cask zen-browser
elif [ "$browser" = "librewolf" ]; then
    echo "Installing librewolf..."
    brew install --cask librewolf --no-quarantine
fi

read -p "Do you want to install Tor? (y/N) " install_tor
if [ "$install_tor" = "Y" ] || [ "$install_tor" = "y" ]; then
    echo "Installing Tor..."
    brew install --cask tor-browser
fi

read -p "Do you want to install additional fonts and symbols? (Used in my configuration) (Y/n) " add_fonts
if [ "$add_fonts" != "N" ] && [ "$add_fonts" != "n" ]; then
    echo "Installing additional fonts... (Press C-c to cancel installing any of the fonts you don't want)"
    brew install --cask font-jetbrains-mono-nerd-font
    brew install --cask font-sf-pro
    brew install --cask font-maple-mono-nf-cn
    brew install --cask sf-symbols
    brew install --cask font-sketchybar-app-font
fi

read -p "Do you have external displays? (y/N) " has_external_displays
if [ "$has_external_displays" = "Y" ] || [ "$has_external_displays" = "y" ]; then
    echo "Installing BetterDisplay..."
    brew install --cask betterdisplay
fi

read -p "Do you have external mice? (y/N) " has_external_mice
if [ "$has_external_mice" = "Y" ] || [ "$has_external_mice" = "y" ]; then
    echo "Installing LinearMouse..."
    brew install --cask linearmouse
fi

read -p "The following apps are not at all necessary, and for myself only. Still install? (y/N) " really
if [ "$really" = "Y" ] || [ "$really" = "y" ]; then
    echo "Installing... (Press C-c to cancel installing any of those apps)"
    brew install --cask dorico
    brew install --cask musescore
    brew install --cask qqmusic
    brew install --cask wechat
    brew install --cask wpsoffice
    brew install --cask zoom
fi

## MacOS system settings
echo "Writing MacOS system settings..."

# Hide menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Set dock size
defaults write com.apple.dock "tilesize" -int "55"

# Autohide dock
defaults write com.apple.dock "autohide" -bool "true"

# Set autohide speed
defaults write com.apple.dock "autohide-time-modifier" -float "0.2"

# Set autohide delay
defaults write com.apple.dock "autohide-delay" -float "0"

# Don't show recents
defaults write com.apple.dock "show-recents" -bool "false"

# Add small spacer tile
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'

# Set `scale` effect when minimizing windows
defaults write com.apple.dock "mineffect" -string "scale"

# Show the `Quit` menu item in Finder
defaults write com.apple.finder "QuitMenuItem" -bool "true"

# Show all file extensions
defaults writedefaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Show hidden files
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"

# Show pathbar in Finder
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Don't show files in desktop
defaults write com.apple.finder "CreateDesktop" -bool "false"

# Firm click weight
defaults write com.apple.AppleMultitouchTrackpad "FirstClickThreshold" -int "2"

# Use fn key to switch keyboard input methods
defaults write com.apple.HIToolbox AppleFnUsageType -int "1"

# Enable keyboard navigation
defaults write NSGlobalDomain AppleKeyboardUIMode -int "2"

# Disable confirmation when closing unsaved windows (will autosave)
defaults write NSGlobalDomain "NSCloseAlwaysConfirmsChanges" -bool "true"

read -p "Disable quarantine and gatekeeper? (y/N) " quarantine
if [ "$quarantine" = "Y" ] || [ "$quarantine" = "y" ]; then
    # Disable quarantine
    defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"
    echo "Type in your password to disable Gatekeeper:"
    sudo spctl --master-disable
fi

killall Finder
killall Dock

# Clone dotfiles repository
if [ ! -d "$HOME/dotfiles" ]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/matt-dong-123/dotfiles.git "$HOME/dotfiles"
fi

# Navigate to dotfiles directory
cd "$HOME/dotfiles" || exit

# Stow dotfiles packages
echo "Stowing dotfiles..."
stow --ignore .DS_Store
stow --ignore .git
stow --ignore .gitignore
stow --ignore .gitmodules
stow --ignore README.md
stow --ignore README.linkscape
stow --ignore install.sh
stow -t ~ .

# Set up hammerspoon config file
defaults write org.hammerspoon.Hammerspoon MJConfigFile "$HOME/.config/hammerspoon/init.lua"

read -p "Set my wallpaper? (Y/n) " set_wallpaper
if [ "$set_wallpaper" != "N" ] && [ "$set_wallpaper" != "n" ]; then
    osascript -e 'tell application "Finder" to set desktop picture to POSIX file "~/wallpapers/wallpaper.png"'
fi

if [ "$browser" == "librewolf" ]; then
    read -p "Use my librewolf config? (Y/n) " textfox
    if [ "$textfox" != "N" ] && [ "$textfox" != "n" ]; then
        cd librewolf_config || exit
        chmod +x install.sh
        ./install.sh
    fi
fi

# Set up one-thing config file
if [ ! -f "$HOME/one-thing/one-thing.txt" ]; then
    mkdir -p "$HOME/one-thing"
    touch "$HOME/one-thing/one-thing.txt"
fi

echo "Setup complete!"

read -p "Reboot for some settings to take effect? (Y/n) " reboot
if [ "$reboot" != "N" ] && [ "$reboot" != "n" ]; then
    echo "Rebooting..."
    sudo reboot
fi
