local wibox = require("wibox")

local cpu_monitor = { widget = nil }

function cpu_monitor.setup()
    cpu_monitor.widget = wibox.widget.textbox("")
    cpu_monitor.update()
end

function cpu_monitor.update()
    -- Read battery capacity
    local file = io.open("/sys/class/power_supply/BAT0/capacity")
    if not file then return false end
    local battery_capacity = tonumber(file:read("a"))

    -- Read battery status
    file = io.open("/sys/class/power_supply/BAT0/status")
    if not file then return false end
    local battery_status = file:read("a")

    -- Update widget text
    if string.find(battery_status, "Discharging") ~= nil then
        cpu_monitor.widget.text = string.format("BAT(-): %d%%", battery_capacity)
    elseif string.find(battery_status, "Charging") ~= nil and battery_capacity < 100 then
        cpu_monitor.widget.text = string.format("BAT(+): %d%%", battery_capacity)
    elseif string.find(battery_status, "Charging") ~= nil and battery_capacity == 100 then
        cpu_monitor.widget.text = ""
    end
end

return cpu_monitor

