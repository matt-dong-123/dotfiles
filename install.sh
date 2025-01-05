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
# git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
## install zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

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

## Formulae
echo "Installing Brew Formulae..."
### Must Have things
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
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
brew install thefuck
brew install yazi
brew install neovim

### Terminal
brew install git
brew install lazygit
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

### dev things
brew install node
brew install nvm
brew install sqlite

## Casks (you'll have to configure them yourselves)
# wait till i learn nix :)
echo "Installing Brew Casks..."
brew install --cask raycast
brew install --cask karabiner-elements
brew install --cask wezterm
brew install --cask aerospace
brew install --cask keycastr
brew install --cask betterdisplay # for people with multiple displays
brew install --cask linearmouse   # for people with mice
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-sf-pro
brew install --cask zen-browser
brew install --cask qqmusic
brew install --cask background-music
brew install --cask appdimmer
brew install --cask keyboardholder
brew install --cask tencent-lemon
brew install --cask dockdoor
brew install --cask obsidian
brew install --cask visual-studio-code
brew install --cask latest
brew install --cask iina
brew install --cask airbattery
brew install --cask wechat
brew install --cask keycastr
brew install --cask flux
brew install --cask wpsoffice
brew install --cask jordanbaird-ice
brew install --cask tor-browser
brew install --cask arc
brew install --cask musescore
## MacOS system settings
defaults write NSGlobalDomain _HIHideMenuBar -bool true

echo "Installation complete..."

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
stow --ignore README.*
stow -t ~ .

echo "Dotfiles setup complete!"
