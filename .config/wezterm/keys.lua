---@type Wezterm
local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

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
                    else
                        return
                    end
                end),
            },
        },
        {
            mods = 'LEADER',
            key = 'w',
            action = wezterm.action_callback(function(window, pane)
                local active_workspace = mux.get_active_workspace()
                local workspaces = mux.get_workspace_names()
                local num_tabs_by_workspace = {}

                for _, mux_window in ipairs(mux.all_windows()) do
                    local workspace = mux_window:get_workspace()
                    local num_tabs = #mux_window:tabs()

                    if num_tabs_by_workspace[workspace] then
                        num_tabs_by_workspace[workspace] = num_tabs_by_workspace[workspace]
                            + num_tabs
                    else
                        num_tabs_by_workspace[workspace] = num_tabs
                    end
                end

                local choices = {
                    {
                        id = active_workspace,
                        label = active_workspace
                            .. ': '
                            .. num_tabs_by_workspace[active_workspace]
                            .. ' tabs (active)',
                    },
                }

                for _, workspace in ipairs(workspaces) do
                    if workspace ~= active_workspace then
                        table.insert(choices, {
                            id = workspace,
                            label = workspace
                                .. ': '
                                .. num_tabs_by_workspace[workspace]
                                .. ' tabs',
                        })
                    end
                end

                window:perform_action(
                    act.InputSelector {
                        title = 'Select Workspace',
                        choices = choices,
                        action = wezterm.action_callback(function(_, _, id, _)
                            if not id then
                                return
                            end

                            mux.set_active_workspace(id)
                        end),
                    },
                    pane
                )
            end),
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
