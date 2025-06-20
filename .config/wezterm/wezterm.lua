local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local appearance = require 'appearance'
local behavior = require 'behavior'
local keys = require 'keys'
local mux = require 'mux'
local workspace_switcher =
    wezterm.plugin.require 'https://github.com/MLFlexer/smart_workspace_switcher.wezterm'
local smart_splits =
    wezterm.plugin.require 'https://github.com/mrjones2014/smart-splits.nvim'

appearance.apply_to_config(config)
behavior.apply_to_config(config)
keys.apply_to_config(config)
mux.apply_to_config(config)

-- workspace switcher config
workspace_switcher.apply_to_config(config)
table.insert(config.keys, {
    mods = 'LEADER',
    key = 'K',
    action = workspace_switcher.switch_workspace(),
})
config.default_workspace = 'Home'
workspace_switcher.zoxide_path = '/opt/homebrew/bin/zoxide'

-- smart splits config
smart_splits.apply_to_config(config, {
    direction_keys = { 'h', 'j', 'k', 'l' },
    modifiers = {
        move = 'CTRL',
        resize = 'ALT',
    },
})
return config
