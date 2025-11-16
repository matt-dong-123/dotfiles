local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local options = require 'options'
local keys = require 'keys'
local theme = require 'theme'

options.apply_to_config(config)
keys.apply_to_config(config)
theme.apply_to_config(config)

return config
