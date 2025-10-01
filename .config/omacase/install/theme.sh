#!/bin/bash

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
