local colors = require("colors")
local settings = require("settings")
local icons = require("icons")

function parse_string_to_table(s)
	local result = {}
	for line in s:gmatch("([^\n]+)") do
		table.insert(result, line)
	end
	return result
end

local spaceConfigs = {
	["!default"] = { icon = "-", name = "Default" },
	["browser"] = { icon = icons.browser, name = "Browser" },
	["coding"] = { icon = icons.terminal, name = "Coding" },
	["music"] = { icon = icons.music, name = "Music" },
	["social"] = { icon = icons.social, name = "Social" },
	["work"] = { icon = icons.work, name = "Work" },
}

local function highlight_workspace(focused_workspace, workspace, space, space_bracket)
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
			background = {
				border_color = selected and colors.black or colors.bg2,
			},
		})
		space_bracket:set({
			background = {
				border_color = selected and colors.green or colors.bg2,
			},
		})
	end)
end

local file = io.popen("aerospace list-workspaces --all")
local result = ""
if file then
	result = file:read("*a")
	file:close()
end

local workspaces = parse_string_to_table(result)

for i, workspace in ipairs(workspaces) do
	local spaceConfig = spaceConfigs[workspace]
	local space = sbar.add("item", "space." .. i, {
		icon = {
			string = spaceConfig.icon,
			padding_left = 1,
			color = colors.white,
			highlight_color = colors.green,
		},
		label = {
			color = colors.grey,
			highlight_color = colors.white,
			y_offset = 0,
		},
		padding_left = 10,
		padding_right = 3,
	})

	local space_bracket = sbar.add("bracket", { space.name }, {
		background = {
			color = colors.bg1,
			border_color = colors.bg2,
			height = 28,
			border_width = 2,
		},
	})

	space:subscribe("aerospace_workspace_change", function(env)
		highlight_workspace(env.FOCUSED_WORKSPACE, workspace, space, space_bracket)
	end)

	space:subscribe("mouse.clicked", function(env)
		sbar.exec("aerospace workspace " .. workspace)
		highlight_workspace(env.FOCUSED_WORKSPACE, workspace, space, space_bracket)
	end)

	sbar.exec("aerospace list-workspaces --focused", function(out)
		if out == workspace .. "\n" then
			highlight_workspace(workspace, workspace, space, space_bracket)
		end
	end)
end

local spaces_indicator = sbar.add("item", {
	padding_left = 5,
	padding_right = 0,
	icon = {
		padding_left = 8,
		padding_right = 9,
		color = colors.green,
		string = icons.switch.on,
	},
	label = {
		width = 0,
		padding_left = 0,
		padding_right = 8,
		string = "Spaces",
		color = colors.white,
	},
	background = {
		color = colors.with_alpha(colors.bg2, 0.0),
		border_color = colors.with_alpha(colors.green, 0.0),
	},
})

spaces_indicator:subscribe("swap_menus_and_spaces", function()
	local currently_on = spaces_indicator:query().icon.value == icons.switch.on
	spaces_indicator:set({
		icon = currently_on and icons.switch.off or icons.switch.on,
		label = currently_on and "Menus" or "Spaces",
	})
end)

spaces_indicator:subscribe("mouse.entered", function()
	sbar.animate("tanh", 30, function()
		spaces_indicator:set({
			background = {
				color = {
					alpha = 1.0,
				},
				border_color = {
					alpha = 1.0,
				},
			},
			icon = {
				color = colors.white,
			},
			label = {
				width = "dynamic",
			},
		})
	end)
end)

spaces_indicator:subscribe("mouse.exited", function()
	sbar.animate("tanh", 30, function()
		spaces_indicator:set({
			background = {
				color = {
					alpha = 0.0,
				},
				border_color = {
					alpha = 0.0,
				},
			},
			icon = {
				color = colors.green,
			},
			label = {
				width = 0,
			},
		})
	end)
end)

spaces_indicator:subscribe("mouse.clicked", function()
	sbar.trigger("swap_menus_and_spaces")
end)
