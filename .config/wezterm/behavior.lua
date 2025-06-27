local M = {}

M.apply_to_config = function(config)
    config.max_fps = 120
    config.window_close_confirmation = 'NeverPrompt'
    config.window_decorations = 'RESIZE | MACOS_FORCE_ENABLE_SHADOW'
    config.tab_max_width = 100
    config.show_new_tab_button_in_tab_bar = false
end

return M
