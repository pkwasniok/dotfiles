local wibox = require("wibox")

local gpu_monitor = { widget = nil }

function gpu_monitor.setup()
    gpu_monitor.widget = wibox.widget.textbox("")
    gpu_monitor.update()
end

function gpu_monitor.update()
    -- Open file
    local file = io.open("/sys/bus/pci/devices/0000:2b:00.0/power/runtime_status")
    if not file then return false end

    -- Read temperature
    local status = file:read("a")

    -- Update widget text
    gpu_monitor.widget.text = "GPU: " .. status
end

return gpu_monitor

