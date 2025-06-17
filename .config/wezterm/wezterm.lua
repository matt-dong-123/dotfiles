local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local appearance = require 'appearance'
local behavior = require 'behavior'
local keys = require 'keys'
local mux = require 'mux'
local workspace_switcher =
    wezterm.plugin.require 'https://github.com/MLFlexer/smart_workspace_switcher.wezterm'

-- workspace switcher config
workspace_switcher.apply_to_config(config)

appearance.apply_to_config(config)
behavior.apply_to_config(config)
keys.apply_to_config(config)
mux.apply_to_config(config)

table.insert(config.keys, {
    mods = 'LEADER',
    key = 'K',
    action = workspace_switcher.switch_workspace(),
})
config.default_workspace = 'Home'
workspace_switcher.zoxide_path = '/opt/homebrew/bin/zoxide'

return config
