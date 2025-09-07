#!/bin/bash

# Set initial theme
mkdir -p ~/.config/omacase/current
ln -snf ~/.config/omacase/themes/tokyo-night ~/.config/omacase/current/theme

# Set specific app links for current theme
ln -snf ~/.config/omacase/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
ln -snf ~/.config/omacase/current/theme/wezterm.lua ~/.config/wezterm/theme.lua
ln -snf ~/.config/omacase/current/theme/sketchybar.lua ~/.config/sketchybar/colors.lua

mkdir -p ~/.config/btop/themes
ln -snf ~/.config/omacase/current/theme/btop.theme ~/.config/btop/themes/current.theme
