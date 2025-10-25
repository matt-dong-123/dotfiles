#!/usr/bin/env bash

log() { echo -e "✔︎ $*"; }
die() {
    echo -e "✘ $*" >&2
    exit 1
}

red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
blue="$(tput setaf 4)"
no_color="$(tput sgr0)"

if [[ "$(uname)" == "Darwin" ]]; then
    log "${yellow}macOS detected...${no_color}"

    if xcode-select -p &>/dev/null; then
        log "${blue}XCode CLI tools already installed${no_color}"
    else
        log "${green}Installing XCode CLI tools...${no_color}"
        xcode-select --install
    fi
else
    die "${red}You are not on MacOS, you cannot install these dotfiles automatically.${no_color}"
fi

if ! command -v brew >/dev/null; then
    log "${green}Installing Brew...${no_color}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew analytics off
    log "${yellow}Don't run the aforementioned commands, those exist already.${no_color}"
fi

log "${blue}Brew installed${no_color}"

if [ ! -d "$HOME/dotfiles" ]; then
    log "${green}Cloning dotfiles repository...${no_color}"
    git clone https://github.com/matt-dong-123/dotfiles.git "$HOME/dotfiles" --depth 1 ||
        die "${red}Failed to clone dots${no_color}"
else
    log "${blue}Dotfiles exist${no_color}"
fi

cd "$HOME/dotfiles" || exit

log "${green}Using .config/brewfile/Brewfile for quick install${no_color}"
brew bundle install --file=~/.config/brew/Brewfile
brew bundle cleanup --force --file=~/.config/brew/Brewfile

SPYWARE=$(
    cat <<-EOM
    baidunetdisk
    steinberg-activation-manager
    steinberg-download-assistant
    steinberg-library-manager
    steinberg-mediabay
    tencent-meeting
    wechat
    wpsoffice-cn
    zoom
EOM
)

gum confirm "$(printf "The following casks are spyware and are unconsequential. Remove them?\n%s" "$SPYWARE")"
remove_spyware=$?
if ((remove_spyware == 0)); then
    brew uninstall "$SPYWARE"
fi

if gum confirm "Install a Chinese input method? (Don't worry, nothing to do with spyware)"; then
    git clone https://github.com/idvel/rime-ice ~/Library/Rime --depth 1
else
    brew uninstall --cask squirrel-app input-source-pro
fi

PROWARE=$(
    cat <<-EOM
    font-sf-pro
    sf-symbols
    raycast
EOM
)

gum confirm "$(printf "⚠️These casks are proprietary, but they might break something. Remove?\n%s" "$PROWARE")"
remove_spyware=$?
if ((remove_spyware == 0)); then
    brew uninstall "$SPYWARE"
fi
log "${green}Configuring git...${no_color}"
git_name=$(gum input --placeholder "Enter your full name (used for git only)")
git_email=$(gum input --placeholder "Enter your git email")
git config --global user.name "$git_name"
git config --global user.email "$git_email"

if [ ! -d "$HOME/.local/share/sketchybar_lua/" ]; then
    log "${blue}Installing SBarLua${no_color}"
    (git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua &&
        cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/) ||
        die "${red}Failed to install SBarLua${no_color}"
fi

gum confirm "Write MacOS System Settings?"
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

if ! gum confirm "Do you use multiple input sources?"; then
    brew uninstall --cask input-source-pro
fi

if gum confirm "⚠️WARNING Disable quarantine and gatekeeper?"; then
    defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"
    sudo spctl --master-disable
fi

log "${green}Stowing dotfiles...${no_color}"
cd ~/dotfiles && stow .

ya pkg install

# Set initial theme
mkdir -p ~/.config/omacase/current
ln -snf ~/.config/omacase/themes/everforest/ ~/.config/omacase/current/theme
osascript -e "tell application \"System Events\" to set picture of every desktop to POSIX file \"$HOME/.config/omacase/themes/everforest/backgrounds/default.png\""

mkdir -p ~/.config/btop/themes

# Set specific app symlinks for current theme
ln -snf ~/.config/omacase/current/theme/neovim.lua ~/.config/nvim/lua/config/colorscheme.lua
ln -snf ~/.config/omacase/current/theme/wezterm.lua ~/.config/wezterm/theme.lua
ln -snf ~/.config/omacase/current/theme/sketchybar.lua ~/.config/sketchybar/colors.lua
ln -snf ~/.config/omacase/current/theme/btop.theme ~/.config/btop/themes/current.theme
ln -snf ~/.config/omacase/current/theme/bat ~/.config/bat/config
ln -snf ~/.config/omacase/current/theme/yazi.toml ~/.config/yazi/theme.toml

# Merge opencode and lazygit
jq -s '.[0] * .[1]' ~/.config/opencode/options.json \
    ~/.config/omacase/current/theme/opencode.json \
    >~/.config/opencode/opencode.json

yq ". *= load(\"$HOME/.config/lazygit/options.yml\")" ~/.config/omacase/current/theme/lazygit.yml \
    >~/.config/lazygit/config.yml

brew services restart borders sketchybar

log "${green}Setup complete!${no_color}"
