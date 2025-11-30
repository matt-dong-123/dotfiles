local wezterm = require 'wezterm'

local M = {}

M.apply_to_config = function(config)
    config.keys = {
        {
            key = 'Backspace',
            mods = 'CMD',
            action = wezterm.action.SendKey { key = 'u', mods = 'CTRL' },
        },
        {
            key = 'Backspace',
            mods = 'OPT',
            action = wezterm.action.SendKey { key = 'w', mods = 'CTRL' },
        },
    }
end

return M
