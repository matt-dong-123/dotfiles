#!/usr/bin/env bash

log() { echo -e "→ $*"; }
die() {
    echo -e "✖ $*" >&2
    exit 1
}

# Colors!
red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
blue="$(tput setaf 4)"
no_color="$(tput sgr0)"

# Install xCode cli tools
if [[ "$(uname)" == "Darwin" ]]; then
    log "${yellow}macOS detected...${no_color}"

    if xcode-select -p &>/dev/null; then
        log "${blue}Xcode CLI tools already installed${no_color}"
    else
        log "${green}Installing command line tools...${no_color}"
        xcode-select --install
    fi
else
    die "${red}You are not on MacOS, you cannot install these dotfiles automatically.${no_color}"
fi

# Homebrew
## Install
if ! command -v brew >/dev/null; then
    log "${green}Installing Brew...${no_color}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew analytics off
else
    log "${blue}Brew installed${no_color}"
fi

# Clone dotfiles repository
if [ ! -d "$HOME/dotfiles" ]; then
    log "${green}Cloning dotfiles repository...${no_color}"
    git clone https://github.com/matt-dong-123/dotfiles.git "$HOME/dotfiles" ||
        die "${red}Failed to clone dots, check your internet connection${no_color}"
else
    log "${blue}Dotfiles exist${no_color}"
fi

# Navigate to dotfiles directory
cd "$HOME/dotfiles" || exit

log "${green}Using .config/brewfile/Brewfile for quick install${no_color}"
brew bundle install --file=~/.config/brew/Brewfile ||
    die "${red}\`brew bundle\` failed, check your internet connection${no_color}"
brew bundle cleanup --force --file=~/.config/brew/Brewfile
if [ ! -d "$HOME/.local/share/sketchybar_lua/" ]; then
    log "${blue}Installing SBarLua${no_color}"
    git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua &&
        cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/ ||
        die "${red}Failed to install SBarLua, check your internet connection${no_color}"
fi

## MacOS system settings
gum confirm "Write Settings?"
settings=$?
if ((settings == 0)); then
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

if gum confirm "⚠️WARNING Disable quarantine and gatekeeper?"; then
    defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"
    sudo spctl --master-disable
fi

# Stow dotfiles packages
log "${green}Stowing dotfiles...${no_color}"
cd ~/dotfiles && stow .

# Set initial theme
mkdir -p ~/.config/omacase/current
ln -snf ~/.config/omacase/themes/tokyo-night-moon ~/.config/omacase/current/theme
osascript -e 'tell application "System Events" to set picture of every desktop to "~/.config/omacase/themes/tokyo-night/backgrounds/default.png"'

mkdir -p ~/.config/btop/themes ~/.config/lazygit

# Set specific app links for current theme
ln -snf ~/.config/omacase/current/theme/neovim.lua ~/.config/nvim/lua/config/colorscheme.lua
ln -snf ~/.config/omacase/current/theme/wezterm.lua ~/.config/wezterm/theme.lua
ln -snf ~/.config/omacase/current/theme/sketchybar.lua ~/.config/sketchybar/colors.lua
ln -snf ~/.config/omacase/current/theme/btop.theme ~/.config/btop/themes/current.theme
ln -snf ~/.config/omacase/current/theme/bat ~/.config/bat/config
ln -snf ~/.config/omacase/current/theme/yazi.toml ~/.config/yazi/theme.toml

brew services restart borders sketchybar

log "${green}Setup complete!${no_color}"
