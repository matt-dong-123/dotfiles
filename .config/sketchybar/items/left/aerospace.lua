local colors = require("colors")
local icons = require("icons")

local function parse_cmd_to_table(s)
	local file = io.popen(s)
	local contents = ""
	if file then
		contents = file:read("*a")
		file:close()
	end
	local result = {}
	for line in contents:gmatch("([^\n]+)") do
		table.insert(result, line)
	end
	return result
end

local spaceConfigs = {
	["!default"] = { icon = "—", name = "Default" },
	["browser"] = { icon = icons.browser, name = "Browser" },
	["coding"] = { icon = icons.terminal, name = "Coding" },
	["music"] = { icon = icons.music, name = "Music" },
	["social"] = { icon = icons.social, name = "Social" },
	["work"] = { icon = icons.work, name = "Work" },
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
				string = selected and spaceConfig.icon .. " " .. spaceConfig.name or spaceConfig.icon,
				highlight = selected,
			},
			label = {
				highlight = selected,
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
			padding_left = 1,
			color = colors.white,
			highlight_color = colors.default,
		},
		label = {
			color = colors.grey,
			highlight_color = colors.white,
			y_offset = 0,
		},
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
