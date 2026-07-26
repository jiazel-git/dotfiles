-- Hyprland Lua Configuration
-- Modular configuration loaded from modules/ directory

local home = os.getenv("HOME")
local modulesDir = home .. "/.config/hypr/modules"

-- Load modules in order
dofile(modulesDir .. "/variables.lua")
dofile(modulesDir .. "/monitors.lua")
dofile(modulesDir .. "/general.lua")
dofile(modulesDir .. "/animations.lua")
dofile(modulesDir .. "/input.lua")
dofile(modulesDir .. "/layouts.lua")
dofile(modulesDir .. "/settings.lua")
dofile(modulesDir .. "/env.lua")
dofile(modulesDir .. "/window_rules.lua")
dofile(modulesDir .. "/keybinds.lua")
dofile(modulesDir .. "/startup.lua")
