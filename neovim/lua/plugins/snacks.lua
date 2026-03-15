math.randomseed(os.time())
local _Opts = {}
local _Header = require("utils.dashboard").header

_Opts.animate = {
    duration = 20,
    easing = "linear",
    fps = 120,
}

_Opts.bigfile = { enabled = true }

_Opts.dashboard = {
    enabled = true,
    preset = {
        header = _Header[math.random(#_Header)],
    },
}

_Opts.explorer = { enabled = false }

_Opts.indent = {
    enabled = true,
    chunk = {
        enabled = true,
    },
}

_Opts.input = { enabled = true }

local diagnostics = require("utils.icons").diagnostics_by_name

_Opts.picker = {
    enabled = true,
    icons = {
        diagnostics = diagnostics,
    },
}

_Opts.notifier = {
    enabled = true,
    style = "fancy",
    date_format = "%c",
    icons = {
        error = diagnostics.Error,
        warn = diagnostics.Warn,
        info = diagnostics.Info,
    },
}

_Opts.quickfile = { enabled = true }

_Opts.scope = { enabled = true }

_Opts.scroll = { enabled = true }

_Opts.statuscolumn = { enabled = true }

_Opts.words = { enabled = true }

return {
    -- snacks
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = _Opts,
        keys = require("keymaps.snacks").snacks,
    },
}
