local wezterm = require 'wezterm'

local M = {}

---@diagnostic disable-next-line: unused-local
M.apply_to_config = function(config)
    wezterm.on('update-right-status', function(window, _)
        local prefix = '  ' .. wezterm.mux.get_active_workspace() .. ' '
        if window:leader_is_active() then
            prefix = ' 󰠠 ' .. wezterm.mux.get_active_workspace() .. ' '
            window:set_left_status(wezterm.format {
                { Foreground = { Color = '#ff757f' } },
                { Text = prefix },
            })
        else
            window:set_left_status(wezterm.format {
                { Foreground = { Color = '#4fd6be' } },
                { Text = prefix },
            })
        end
    end)
end

return M
