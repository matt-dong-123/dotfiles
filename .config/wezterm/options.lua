local wezterm = require 'wezterm'

local M = {}

M.apply_to_config = function(config)
    config.font = wezterm.font 'Maple Mono NF CN'
    config.enable_tab_bar = false
    config.font_size = 20
    config.line_height = 1.2
    config.force_reverse_video_cursor = true
    config.max_fps = 120
    config.prefer_egl = true
    config.window_close_confirmation = 'NeverPrompt'
    config.window_decorations =
        'RESIZE | MACOS_FORCE_ENABLE_SHADOW | MACOS_FORCE_SQUARE_CORNERS'
    config.window_padding = {
        left = 15,
        right = 15,
        top = 5,
        bottom = 5,
    }
    config.tab_max_width = 100
    config.show_new_tab_button_in_tab_bar = false
    config.default_prog = { '/opt/homebrew/bin/sesh', 'connect', 'Home' }
end

return M
