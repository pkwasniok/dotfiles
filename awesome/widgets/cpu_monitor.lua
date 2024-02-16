local wibox = require("wibox")

local cpu_monitor = { widget = nil }

function cpu_monitor.setup()
    cpu_monitor.widget = wibox.widget.textbox("")
    cpu_monitor.update()
end

function cpu_monitor.update()
    -- Open file
    local file = io.open("/sys/class/thermal/thermal_zone10/temp")
    if not file then return false end

    -- Read temperature
    local data = file:read("a")
    local temperature = tonumber(data) / 1000

    -- Update widget text
    cpu_monitor.widget.text = "CPU: " .. tostring(temperature) .. "°C"
end

return cpu_monitor

