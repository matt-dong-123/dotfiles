local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- Execute the event provider binary which provides the event "cpu_update" for
-- the cpu load data, which is fired every 2.0 seconds.
sbar.exec("killall cpu_load >/dev/null; $CONFIG_DIR/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0")

local cpu = sbar.add("graph", "widgets.cpu", 42, {
	position = "right",
	graph = { color = colors.default },
	background = {
		height = 22,
		color = { alpha = 0 },
		border_color = { alpha = 0 },
		drawing = true,
	},
	icon = {
		string = icons.cpu,
		color = colors.default,
	},
	label = {
		string = "??%",
		font = {
			family = settings.font.numbers,
		},
		color = colors.default,
	},
	padding_right = settings.paddings + 6,
})

cpu:subscribe("cpu_update", function(env)
	-- Also available: env.user_load, env.sys_load
	local load = tonumber(env.total_load)
	cpu:push({ load / 100. })

	local color = colors.blue
	if load > 30 then
		if load < 60 then
			color = colors.yellow
		elseif load < 80 then
			color = colors.orange
		else
			color = colors.red
		end
	end

	cpu:set({
		graph = { color = color },
		label = env.total_load .. "%",
	})
end)

-- Background around the cpu item
sbar.add("item", "widgets.cpu.padding", {
	position = "right",
	width = settings.group_paddings,
})
