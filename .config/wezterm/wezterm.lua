local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local workspace_switcher =
    wezterm.plugin.require 'https://github.com/MLFlexer/smart_workspace_switcher.wezterm'
local smart_splits =
    wezterm.plugin.require 'https://github.com/mrjones2014/smart-splits.nvim'
workspace_switcher.apply_to_config(config)

-- APPEARANCE
config.color_scheme = 'tokyonight_moon'
config.font = wezterm.font_with_fallback {
    'Maple Mono NF CN',
    'JetBrainsMono Nerd Font',
    'Consolas',
}
config.use_fancy_tab_bar = false
config.font_size = 20
config.line_height = 1.2
config.window_background_opacity = 0.75
config.macos_window_background_blur = 100
config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
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

-- BEHAVIOR
config.max_fps = 120
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = 'RESIZE | MACOS_FORCE_ENABLE_SHADOW'
config.tab_max_width = 100
config.show_new_tab_button_in_tab_bar = false

-- MUX (tmux keys)
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }
config.keys = {
    {
        mods = 'LEADER',
        key = 'c',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
    {
        mods = 'LEADER',
        key = 'x',
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    {
        mods = 'LEADER',
        key = 'b',
        action = wezterm.action.ActivateTabRelative(-1),
    },
    {
        mods = 'LEADER',
        key = 'n',
        action = wezterm.action.ActivateTabRelative(1),
    },
    {
        mods = 'LEADER',
        key = '%',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        mods = 'LEADER',
        key = '"',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        mods = 'LEADER',
        key = 'r',
        action = wezterm.action.PromptInputLine {
            description = 'Rename workspace to:',
            ---@diagnostic disable-next-line: unused-local
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    wezterm.mux.rename_workspace(
                        wezterm.mux.get_active_workspace(),
                        line
                    )
                end
            end),
        },
    },
    {
        mods = 'LEADER',
        key = 's',
        action = wezterm.action.QuickSelect,
    },
    {
        mods = 'LEADER',
        key = 'y',
        action = wezterm.action.ActivateCopyMode,
    },
    {
        mods = 'LEADER',
        key = 'Enter',
        action = wezterm.action.TogglePaneZoomState,
    },
}

for i = 0, 9 do
    -- leader + number to activate that tab
    table.insert(config.keys, {
        key = tostring(i),
        mods = 'LEADER',
        action = wezterm.action.ActivateTab(i - 1),
    })
end

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

-- Sesh like plugin
table.insert(config.keys, {
    mods = 'LEADER',
    key = 'K',
    action = workspace_switcher.switch_workspace(),
})
config.default_workspace = 'Home'
workspace_switcher.zoxide_path = '/opt/homebrew/bin/zoxide'

-- Smart Splits
smart_splits.apply_to_config(config, {
    direction_keys = { 'h', 'j', 'k', 'l' },
    modifiers = {
        move = 'CTRL',
        resize = 'META',
    },
})

return config
