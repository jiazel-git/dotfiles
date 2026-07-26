# Luacheck configuration for Hyprland Lua config

std = "lua54"

-- Global variables allowed
globals = {
    "hl",
    "home",
    "mainMod",
    "scriptsDir",
    "UserScripts",
    "wallDIR",
    "edit",
    "term",
    "files",
    "Search_Engine",
    "color0",
    "color1",
    "color2",
    "color3",
    "color4",
    "color5",
    "color6",
    "color7",
    "color8",
    "color9",
    "color10",
    "color11",
    "color12",
    "color13",
    "color14",
    "color15",
    "Touchpad_Device",
}

-- Read-only globals
read_globals = {
    "dofile",
}

-- Ignore line length
max_line_length = false

-- Ignore unused arguments (common in callbacks)
unused_args = false
