local wezterm = require 'wezterm'

local M = {}

M.apply_to_config = function(config)
    config.color_scheme = 'Gruvbox dark, medium (base16)'
    config.colors = {
        tab_bar = {
            active_tab = {
                bg_color = '#282828',
                fg_color = '#d3869b',
                intensity = 'Bold',
                underline = 'Single',
            },
            inactive_tab = {
                bg_color = '#282828',
                fg_color = '#ebdbb2',
            },
        },
    }
    wezterm.on('update-right-status', function(window, _)
        local prefix = '  ' .. wezterm.mux.get_active_workspace() .. ' '
        if window:leader_is_active() then
            prefix = ' 󰠠 ' .. wezterm.mux.get_active_workspace() .. ' '
            window:set_left_status(wezterm.format {
                { Foreground = { Color = '#cc241d' } },
                { Text = prefix },
            })
        else
            window:set_left_status(wezterm.format {
                { Foreground = { Color = '8ec07c' } },
                { Text = prefix },
            })
        end
    end)
end

return M
