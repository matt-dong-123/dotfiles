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
else
    echo -e "${red}You are not on MacOS, you cannot install these dotfiles automatically.${no_color}"
    exit 1
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

echo -e "${green}Using .config/brewfile/Brewfile for quick install${no_color}"
brew bundle install --file=~/.config/brew/Brewfile
echo -e "${blue}Installing SBarLua"
# installing sbarlua
if [ ! -d "$HOME/SBarLua" ]; then
    git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/
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

echo -e "${blue}This will enable sudo via Touch ID. (Y/n)"
read -p "" touchid
if [ "$touchid" != "n" ] && [ "$touchid" != "N" ]; then
    sed "s/^#auth/auth/" /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local
fi

echo -e "${red}Disable quarantine and gatekeeper? (y/N) ${no_color}"
read -p "" quarantine
if [ "$quarantine" = "Y" ] || [ "$quarantine" = "y" ]; then
    # Disable quarantine
    defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"
    sudo spctl --master-disable
fi

killall Finder
killall Dock

# Stow dotfiles packages
echo -e "${green}Stowing dotfiles...${no_color}"
stow -t ~ .

~/.config/omacase/install/theme.sh

echo -e "${green}Setup complete!${no_color}"

echo -e "${purple}Reboot for some settings to take effect? (Y/n) ${no_color}"
read -p "" reboot
if [ "$reboot" != "N" ] && [ "$reboot" != "n" ]; then
    echo -e "${red}Rebooting...${no_color}"
    sudo reboot
fi
