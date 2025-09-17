local wezterm = require 'wezterm'

local M = {}

M.apply_to_config = function(config)
    config.color_scheme = 'rose-pine-moon'
    config.colors = {
        tab_bar = {
            background = '#232136',
            active_tab = {
                bg_color = '#232136',
                fg_color = '#c4a7e7',
                intensity = 'Bold',
                underline = 'Single',
            },
            inactive_tab = {
                bg_color = '#232136',
                fg_color = '#e0d3f4',
            },
        },
    }
    wezterm.on('update-right-status', function(window, _)
        local prefix = '  ' .. wezterm.mux.get_active_workspace() .. ' '
        if window:leader_is_active() then
            prefix = ' 󰠠 ' .. wezterm.mux.get_active_workspace() .. ' '
            window:set_left_status(wezterm.format {
                { Foreground = { Color = '#eb6f92' } },
                { Text = prefix },
            })
        else
            window:set_left_status(wezterm.format {
                { Foreground = { Color = '#9ccfd8' } },
                { Text = prefix },
            })
        end
    end)
end

return M
