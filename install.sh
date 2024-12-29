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
brew install --cask ghostty # you can delete one of the terminal emulators using brew uninstall
brew install --cask aerospace
brew install --cask keycastr
brew install --cask betterdisplay # for people with multiple displays
brew install --cask linearmouse   # for people with mice
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-sf-pro

## If you want some macos system settings, you can add them here!

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
