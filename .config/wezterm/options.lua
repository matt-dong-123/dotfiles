local wezterm = require 'wezterm'

local M = {}

M.apply_to_config = function(config)
    config.font = wezterm.font 'Maple Mono NF CN'
    config.use_fancy_tab_bar = false
    config.font_size = 20
    config.line_height = 1.2
    config.window_background_opacity = 0.75
    config.macos_window_background_blur = 100
    config.window_padding = {
        left = 15,
        right = 15,
        top = 15,
        bottom = 0,
    }
    config.force_reverse_video_cursor = true
    config.max_fps = 120
    config.prefer_egl = true
    config.window_close_confirmation = 'NeverPrompt'
    config.window_decorations = 'RESIZE | MACOS_FORCE_ENABLE_SHADOW'
    config.tab_max_width = 100
    config.show_new_tab_button_in_tab_bar = false
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
