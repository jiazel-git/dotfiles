return {
    "nvim-tree/nvim-web-devicons",
    opts = {
        override = {
            zsh = {
                icon = "",
                color = "#428850",
                cterm_color = "65",
                name = "Zsh",
            },
        },
        color_icons = true,
        default = true,
        strict = true,
        variant = "light|dark",
        override_by_filename = {
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
        },
        override_by_extension = {
            ["log"] = {
                icon = "",
                color = "#81e043",
                name = "Log",
            },
        },
    },
}
