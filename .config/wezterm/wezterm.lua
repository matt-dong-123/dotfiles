local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local appearance = require 'appearance'
local behavior = require 'behavior'
local keys = require 'keys'
local mux = require 'mux'
local workspace_switcher =
    wezterm.plugin.require 'https://github.com/MLFlexer/smart_workspace_switcher.wezterm'
local resurrect =
    wezterm.plugin.require 'https://github.com/MLFlexer/resurrect.wezterm'
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

-- resurrect plugin config
resurrect.state_manager.periodic_save {
    interval_seconds = 15 * 60,
    save_workspaces = true,
    save_windows = true,
    save_tabs = true,
}

wezterm.on('resurrect.error', function(err)
    wezterm.log_error 'ERROR!'
    wezterm.gui.gui_windows()[1]:toast_notification('resurrect', err, nil, 3000)
end)

-- smart splits config
smart_splits.apply_to_config(config, {
    direction_keys = { 'h', 'j', 'k', 'l' },
    modifiers = {
        move = 'CTRL',
        resize = 'ALT',
    },
})
return config
