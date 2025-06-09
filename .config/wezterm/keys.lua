local wezterm = require 'wezterm'
local act = wezterm.action

local M = {}

M.apply_to_config = function(config)
    config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }
    config.keys = {
        {
            mods = 'LEADER',
            key = 'c',
            action = act.SpawnTab 'CurrentPaneDomain',
        },
        {
            mods = 'LEADER',
            key = 'x',
            action = act.CloseCurrentPane { confirm = false },
        },
        {
            mods = 'LEADER',
            key = 'b',
            action = act.ActivateTabRelative(-1),
        },
        {
            mods = 'LEADER',
            key = 'n',
            action = act.ActivateTabRelative(1),
        },
        {
            mods = 'LEADER',
            key = '%',
            action = act.SplitHorizontal {
                domain = 'CurrentPaneDomain',
            },
        },
        {
            mods = 'LEADER',
            key = '"',
            action = act.SplitVertical {
                domain = 'CurrentPaneDomain',
            },
        },
        {
            mods = 'LEADER',
            key = 'r',
            action = act.PromptInputLine {
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
            action = act.QuickSelect,
        },
        {
            mods = 'LEADER',
            key = 'y',
            action = act.ActivateCopyMode,
        },
        {
            mods = 'LEADER',
            key = 'Enter',
            action = act.TogglePaneZoomState,
        },
        {
            mods = 'CTRL',
            key = 'h',
            action = act.ActivatePaneDirection 'Left',
        },
        {
            mods = 'CTRL',
            key = 'j',
            action = act.ActivatePaneDirection 'Down',
        },
        {
            mods = 'CTRL',
            key = 'k',
            action = act.ActivatePaneDirection 'Up',
        },
        {
            mods = 'CTRL',
            key = 'l',
            action = act.ActivatePaneDirection 'Right',
        },
        {
            mods = 'LEADER',
            key = 'h',
            action = act.AdjustPaneSize { 'Left', 5 },
        },
        {
            mods = 'LEADER',
            key = 'j',
            action = act.AdjustPaneSize { 'Down', 5 },
        },
        {
            mods = 'LEADER',
            key = 'k',
            action = act.AdjustPaneSize { 'Up', 5 },
        },
        {
            mods = 'LEADER',
            key = 'l',
            action = act.AdjustPaneSize { 'Right', 5 },
        },
    }

    for i = 0, 9 do
        -- leader + number to activate that tab
        table.insert(config.keys, {
            key = tostring(i),
            mods = 'LEADER',
            action = act.ActivateTab(i - 1),
        })
    end
end

return M
