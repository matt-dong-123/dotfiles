#!/usr/bin/env bash
set -e

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
brew bundle cleanup --force --file=~/.config/brew/Brewfile
if [ ! -d "$HOME/.local/share/sketchybar_lua/" ]; then
    echo -e "${blue}Installing SBarLua${no_color}"
    git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/
fi

## MacOS system settings
if gum confirm "Write Settings?"; then
    defaults write NSGlobalDomain _HIHideMenuBar -bool true                                       # Hide menu bar
    defaults write com.apple.dock "autohide" -bool "true"                                         # Hide dock
    defaults write com.apple.dock "autohide-time-modifier" -float "0.2"                           # Set dock hide speed
    defaults write com.apple.dock "autohide-delay" -float "0"                                     # Set autohide delay
    defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}' # Add small spacer tile
    defaults write com.apple.finder "QuitMenuItem" -bool "true"                                   # Show quit menu
    defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"                           # show all file extensions
    defaults write com.apple.finder "AppleShowAllFiles" -bool "true"                              # show hidden
    defaults write com.apple.finder "ShowPathbar" -bool "true"                                    # Show pathbar
    defaults write com.apple.finder "CreateDesktop" -bool "false"                                 # Don't show desktop files
    defaults write NSGlobalDomain AppleKeyboardUIMode -int "2"                                    # Keyboard Navigation
    defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false                  # Disable Window Animations
    killall Finder
    killall Dock
fi

gum confirm "Enable sudo via Touch ID?" &&
    sed "s/^#auth/auth/" /etc/pam.d/sudo_local.template | sudo tee /etc/pam.d/sudo_local

if gum confirm "Disable quarantine and gatekeeper?"; then
    defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"
    sudo spctl --master-disable
fi

# Stow dotfiles packages
echo -e "${green}Stowing dotfiles...${no_color}"
cd ~/dotfiles
stow .

~/.config/omacase/install/theme.sh

echo -e "${green}Setup complete!${no_color}"

if gum confirm "Reboot for some settings to take effect?"; then
    echo -e "${red}Rebooting...${no_color}"
    sudo reboot
fi
