local _Opts = {}

_Opts.override = {
    zsh = {
        icon = "",
        color = "#428850",
        cterm_color = "65",
        name = "Zsh",
    },
}

_Opts.color_icons = true
_Opts.default = true
_Opts.strict = true
_Opts.variant = "light|dark"

_Opts.override_by_filename = {
    [".gitignore"] = {
        icon = "",
        color = "#f1502f",
        name = "Gitignore",
    },
    ["cpp"] = {
        icon = "",
        color = "#89B4FA",
        name = "Cpp",
    },
}

_Opts.override_by_extension = {
    ["log"] = {
        icon = "",
        color = "#81e043",
        name = "Log",
    },
}

return {
    "nvim-tree/nvim-web-devicons",
    opts = _Opts,
}
