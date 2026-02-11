local icons = require 'icons'
local colors = require 'colors'

local volume = sbar.add('item', 'right.volume', {
    position = 'right',
    icon = {
        string = icons.volume._0,
    },
    label = {
        string = '??%',
        drawing = false,
    },
    update_freq = 1,
})

volume:subscribe({ 'routine', 'system_woke' }, function()
    sbar.exec("osascript -e 'output volume of (get volume settings)'", function(volume_level)
        local level = tonumber(volume_level)
        local icon = icons.volume._0
        local color = colors.default

        if level == 0 then
            icon = icons.volume._0
            color = colors.grey
        elseif level <= 10 then
            icon = icons.volume._10
        elseif level <= 33 then
            icon = icons.volume._33
        elseif level <= 66 then
            icon = icons.volume._66
        else
            icon = icons.volume._100
            if level >= 90 then
                color = colors.red
            end
        end

        local label = level .. '%'

        volume:set {
            icon = {
                string = icon,
                color = color,
            },
            label = {
                string = label,
                color = color,
            },
        }
    end)
end)

volume:subscribe('mouse.entered', function()
    volume:set {
        label = { drawing = true, width = 'dynamic' },
    }
end)

volume:subscribe('mouse.exited', function()
    volume:set {
        label = { drawing = false, width = 0 },
    }
end)
