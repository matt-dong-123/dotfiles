local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

local M = {}

M.apply_to_config = function(config)
    config.leader = { key = 'a', mods = 'CTRL' }
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
            key = 'p',
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
                action = wezterm.action_callback(function(_, _, line)
                    if line then
                        mux.rename_workspace(mux.get_active_workspace(), line)
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
        -- Passthrough
        {
            mods = 'LEADER|CTRL',
            key = 'k',
            action = act.SendKey {
                mods = 'CTRL',
                key = 'k',
            },
        },
        {
            mods = 'LEADER|CTRL',
            key = 'l',
            action = act.SendKey {
                mods = 'CTRL',
                key = 'l',
            },
        },
        {
            mods = 'LEADER|CTRL',
            key = 'a',
            action = act.SendKey {
                mods = 'CTRL',
                key = 'a',
            },
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
