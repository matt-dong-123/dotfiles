local colors = require("colors")
local icons = require("icons")

local function parse_cmd_to_table(s)
	local file = io.popen(s)
	local contents = ""
	contents = file:read("*a")
	file:close()
	local result = {}
	for line in contents:gmatch("([^\n]+)") do
		table.insert(result, line)
	end
	return result
end

local spaceConfigs = {
	["browser"] = { icon = icons.browser, name = "Browser", color = colors.yellow },
	["coding"] = { icon = icons.terminal, name = "Coding", color = colors.orange },
	["music"] = { icon = icons.music, name = "Music", color = colors.magenta },
	["social"] = { icon = icons.social, name = "Social", color = colors.green },
	["work"] = { icon = icons.work, name = "Work", color = colors.red },
}

-- focused_workspace: the workspace aerospace sends
-- workspace: the checked workspace
-- space: the workspace's corresponding ui element
local function highlight_workspace(focused_workspace, workspace, space)
	local selected = focused_workspace == workspace
	local spaceConfig = spaceConfigs[workspace]
	sbar.animate("tanh", 10, function()
		space:set({
			icon = {
				string = spaceConfig.icon,
				highlight = selected,
				highlight_color = spaceConfig.color,
			},
			label = {
				string = selected and spaceConfig.name or "",
				highlight = selected,
				highlight_color = spaceConfig.color,
			},
		})
	end)
end

local workspaces = parse_cmd_to_table("aerospace list-workspaces --all")

for i, workspace in ipairs(workspaces) do
	local spaceConfig = spaceConfigs[workspace]
	local space = sbar.add("item", "space." .. i, {
		icon = {
			string = spaceConfig.icon,
			color = colors.grey,
		},
		click_script = "aerospace workspace " .. workspace,
	})

	space:subscribe("aerospace_workspace_change", function(env)
		highlight_workspace(env.FOCUSED_WORKSPACE, workspace, space)
	end)

	sbar.exec("aerospace list-workspaces --focused", function(out)
		if string.gsub(out, "\n", "") == workspace then
			highlight_workspace(workspace, workspace, space)
		end
	end)
end
