#!/bin/bash

if [[ -z "$1" ]]; then
  echo "No theme specified." >&2
  exit 1
fi

THEMES_DIR="$HOME/.config/omacase/themes"
CURRENT_THEME_DIR="$HOME/.config/omacase/current/theme"

THEME_NAME=$(echo "$1" | perl -pe 's/ /-/g; $_ = lc $_')
THEME_PATH="$THEMES_DIR/$THEME_NAME"

# Check if the theme entered exists
if [[ ! -d "$THEME_PATH" ]]; then
  echo "Theme '$THEME_NAME' does not exist in $THEMES_DIR" >&2
  exit 2
fi

# Update theme symlinks
ln -nsf "$THEME_PATH" "$CURRENT_THEME_DIR"

# Make sure wezterm updates
touch ~/.config/wezterm/wezterm.lua

wallpaper=$(realpath ~/.config/omacase/current/theme/backgrounds/default.png)
osascript -e "tell application \"System Events\" to set picture of every desktop to \"$wallpaper\""

brew services restart sketchybar
