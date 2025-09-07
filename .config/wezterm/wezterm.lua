local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local options = require 'options'
local keys = require 'keys'
local theme = require 'theme'
local workspace_switcher =
    wezterm.plugin.require 'https://github.com/MLFlexer/smart_workspace_switcher.wezterm'
local smart_splits =
    wezterm.plugin.require 'https://github.com/mrjones2014/smart-splits.nvim'

workspace_switcher.apply_to_config(config)
options.apply_to_config(config)
keys.apply_to_config(config)
theme.apply_to_config(config)

-- workspace switcher config
table.insert(config.keys, {
    mods = 'LEADER',
    key = 'K',
    action = workspace_switcher.switch_workspace(),
})
config.default_workspace = 'Home'

-- smart splits config
smart_splits.apply_to_config(config, {
    direction_keys = { 'h', 'j', 'k', 'l' },
    modifiers = {
        move = 'CTRL',
    },
})
return config
