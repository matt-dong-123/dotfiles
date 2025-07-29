#!/bin/bash

# Colors!
green="\033[1;32m"
yellow="\033[1;33m"
red="\033[1;31m"
purple="\033[1;35m"
blue="\033[1;34m"
no_color="\033[0m"

# Install xCode cli tools
if [[ "$(uname)" == "Darwin" ]]; then
    echo -e "${yellow}macOS detected...${no_color}"

    if xcode-select -p &>/dev/null; then
        echo -e "${blue}Xcode already installed${no_color}"
    else
        echo -e "${green}Installing command line tools...${no_color}"
        xcode-select --install
    fi
fi

# Homebrew
## Install
if [ "$(which brew)" != "/usr/local/bin/brew" ] && [ "$(which brew)" != "/opt/homebrew/bin/brew" ]; then
    echo -e "${green}Installing Brew...${no_color}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew analytics off
fi

# Clone dotfiles repository
if [ ! -d "$HOME/dotfiles" ]; then
    echo -e "${green}Cloning dotfiles repository...${no_color}"
    git clone https://github.com/matt-dong-123/dotfiles.git "$HOME/dotfiles"
fi

# Navigate to dotfiles directory
cd "$HOME/dotfiles" || exit

echo -e "${red}Quick Install of everything? You may not want a lot of them for daily use. (y/N)${no_color}"
read -p "" use_brewfile
if [ "$use_brewfile" = "Y" ] || [ "$use_brewfile" = "y" ]; then
    echo -e "${green}Using .config/brewfile/Brewfile to quick install${no_color}"
    brew bundle install --file=./.config/brewfile/Brewfile
else
    ## Taps
    echo -e "${green}Tapping Brew...${no_color}"
    brew tap nikitabobko/tap
    brew tap FelixKratz/formulae

    ## Formulae
    echo -e "${green}Installing Brew Formulae... ${no_color}"
    ### Must Have things
    brew install stow
    brew install fzf
    brew install gh
    brew install fd
    brew install zoxide
    brew install make
    brew install ripgrep
    brew install ffmpeg
    brew install borders
    brew install sketchybar
    # installing sbarlua
    if [ ! -d "$HOME/SBarLua" ]; then
        (git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)
    fi
    brew install yazi
    brew install neovim
    brew install git
    brew install jesseduffield/lazygit/lazygit

    ### Terminal
    brew install tree
    brew install btop
    brew install fastfetch
    brew install cowsay
    brew install fortune
    brew install wifi-password
    brew install cmatrix
    brew install sl
    brew install yt-dlp
    brew install wtf
    brew install pipes-sh

    ### dev things
    brew install pnpm
    brew install node
    brew install nvm
    brew install sqlite
    brew install go
    brew install lua
    brew install luajit
    brew install luarocks

    ## Casks (you'll have to configure them yourselves)
    echo -e "${green}Installing Brew Casks... ${no_color}"
    brew install --cask aerospace
    brew install --cask karabiner-elements
    brew install --cask hammerspoon
    brew install --cask espanso
    brew install --cask wezterm@nightly
    brew install --cask leader-key
    brew install --cask alt-tab
    brew install --cask iina
    brew install --cask input-source-pro
    brew install --cask only-switch
    brew install --cask floorp

    echo -e "${purple}Do you want to install Tor? (y/N) ${no_color}"
    read -p "" install_mullvad
    if [ "$install_mullvad" = "Y" ] || [ "$install_mullvad" = "y" ]; then
        echo -e "${green}Installing Tor...${no_color}"
        brew install --cask tor-browser
    fi

    echo -e "${purple}Do you want to install additional fonts and symbols? (Used in my configuration) (Y/n) ${no_color}"
    read -p "" add_fonts
    if [ "$add_fonts" != "N" ] && [ "$add_fonts" != "n" ]; then
        echo -e "${green}Installing additional fonts... ${no_color}"
        brew install --cask font-jetbrains-mono-nerd-font
        brew install --cask font-sf-pro
        brew install --cask font-maple-mono
        brew install --cask font-maple-mono-nf
        brew install --cask font-maple-mono-nf-cn
        brew install --cask sf-symbols
        brew install --cask font-sketchybar-app-font
    fi

    echo -e "${purple}Do you have external displays? (y/N) ${no_color}"
    read -p "" has_external_displays
    if [ "$has_external_displays" = "Y" ] || [ "$has_external_displays" = "y" ]; then
        echo -e "${green}Installing BetterDisplay...${no_color}"
        brew install --cask betterdisplay
    fi

    echo -e "${purple}Do you have external mice? (y/N) ${no_color}"
    read -p "" has_external_mice
    if [ "$has_external_mice" = "Y" ] || [ "$has_external_mice" = "y" ]; then
        echo -e "${green}Installing LinearMouse...${no_color}"
        brew install --cask linearmouse
    fi

    echo -e "${red}The following apps are not at all necessary, and for myself only. Still install? (y/N) ${no_color}"
    read -p "" really
    if [ "$really" = "Y" ] || [ "$really" = "y" ]; then
        echo -e "${green}Installing... ${no_color}"
        brew install --cask dorico
        brew install --cask musescore
        brew install --cask qqmusic
        brew install --cask wechat
        brew install --cask zoom
    fi
fi

## MacOS system settings
echo -e "${yellow}Writing MacOS system settings...${no_color}"

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
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

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

echo -e "${red}Disable quarantine and gatekeeper? (y/N) ${no_color}"
read -p "" quarantine
if [ "$quarantine" = "Y" ] || [ "$quarantine" = "y" ]; then
    # Disable quarantine
    defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"
    echo -e "${red}Type in your password to disable Gatekeeper:${no_color}"
    sudo spctl --master-disable
fi

killall Finder
killall Dock

# Stow dotfiles packages
echo -e "${green}Stowing dotfiles...${no_color}"
stow --ignore .DS_Store --ignore .git \
    --ignore .gitignore --ignore .gitmodules --ignore README.md --ignore README.linkscape --ignore install.sh -t ~ .

# Set up hammerspoon config file
defaults write org.hammerspoon.Hammerspoon MJConfigFile "$HOME/.config/hammerspoon/init.lua"

# Set up one-thing config file
if [ ! -f "$HOME/one-thing/one-thing.txt" ]; then
    mkdir -p "$HOME/one-thing"
    touch "$HOME/one-thing/one-thing.txt"
    echo -e "${green}What do you want on your menu bar? "
    read -p "" thing
    echo "$thing" >>$HOME/one-thing/one-thing.txt
fi

echo -e "${green}Setup complete!${no_color}"

echo -e "${purple}Reboot for some settings to take effect? (Y/n) ${no_color}"
read -p "" reboot
if [ "$reboot" != "N" ] && [ "$reboot" != "n" ]; then
    echo -e "${red}Rebooting...${no_color}"
    sudo reboot
fi
