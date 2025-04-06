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

local function highlight_workspace(focused_workspace, workspace, space, space_bracket)
	local selected = focused_workspace == workspace
	local spaceConfig = spaceConfigs[workspace]
	local color = selected and colors.default or colors.bg2
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
				border_color = color,
			},
		})
		space_bracket:set({
			background = {
				border_color = color,
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
		padding_left = 10,
		padding_right = 3,
		click_script = "aerospace workspace " .. workspace,
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

	sbar.exec("aerospace list-workspaces --focused", function(out)
		if string.gsub(out, "\n", "") == workspace then
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
		color = colors.default,
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
		border_color = colors.with_alpha(colors.default, 0.0),
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
				color = colors.default,
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
