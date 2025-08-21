local wezterm = require 'wezterm'

local M = {}

M.apply_to_config = function(config)
    config.color_scheme = 'tokyonight_moon'
    config.font = wezterm.font_with_fallback {
        'Maple Mono NF CN',
        'JetBrainsMono Nerd Font',
    }
    config.use_fancy_tab_bar = false
    config.window_background_opacity = 0.75
    config.macos_window_background_blur = 100
    config.font_size = 20
    config.line_height = 1.2
    config.window_padding = {
        left = 15,
        right = 15,
        top = 15,
        bottom = 0,
    }
    config.colors = {
        tab_bar = {
            active_tab = {
                bg_color = '#222436',
                fg_color = '#c099ff',
                intensity = 'Bold',
                underline = 'Single',
            },
            inactive_tab = {
                bg_color = '#222436',
                fg_color = '#c8d3f5',
            },
        },
    }
    config.force_reverse_video_cursor = true
end

return M
