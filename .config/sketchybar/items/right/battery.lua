local icons = require 'icons'
local colors = require 'colors'
local settings = require 'settings'

local battery = sbar.add('item', 'right.battery', {
    position = 'right',
    icon = {
        font = {
            style = settings.font.style_map['Regular'],
        },
    },
    label = { font = { family = settings.font.numbers } },
    update_freq = 1,
})

battery:subscribe({ 'routine', 'power_source_change', 'system_woke' }, function()
    sbar.exec('pmset -g batt', function(batt_info)
        local icon = '!'
        local label = '?'

        local color = colors.default

        local found, _, charge = batt_info:find '(%d+)%%'
        if found then
            charge = tonumber(charge)
            label = charge .. '%'
        end

        local charging, _, _ = batt_info:find 'AC Power'

        if charging then
            icon = icons.battery.charging
            color = colors.green
        else
            if found and charge >= 80 then
                icon = icons.battery._100
            elseif found and charge > 60 then
                icon = icons.battery._75
            elseif found and charge > 40 then
                icon = icons.battery._50
            elseif found and charge > 20 then
                icon = icons.battery._25
                color = colors.orange
            else
                icon = icons.battery._0
                color = colors.red
            end
        end

        local lead = ''
        if found and charge < 10 then
            lead = '0'
        end

        battery:set {
            icon = {
                string = icon,
                color = color,
            },
            label = {
                string = lead .. label,
                color = color,
            },
        }
    end)
end)
