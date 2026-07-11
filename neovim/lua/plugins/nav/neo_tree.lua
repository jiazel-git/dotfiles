local _Opts = {}

_Opts.close_if_last_window = false
_Opts.popup_border_style = "rounded"
_Opts.enable_git_status = true
_Opts.enable_diagnostics = true

_Opts.open_files_do_not_replace_types = {
    "terminal",
    "trouble",
    "qf",
}

_Opts.open_files_using_relative_paths = true

_Opts.default_component_configs = {
    container = {
        enable_character_fade = true,
    },
    indent = {
        indent_marker = "┆",
        last_indent_marker = "╰",
    },
    file_size = {
        enabled = false,
    },
    type = {
        enabled = false,
    },
}

_Opts.filesystem = {
    follow_current_file = {
        enabled = false,
    },
}

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        {
            "s1n7ax/nvim-window-picker",
            version = "2.*",
            config = function()
                require("window-picker").setup({
                    filter_rules = {
                        include_current_win = false,
                        autoselect_one = true,
                        bo = {
                            filetype = {
                                "neo-tree",
                                "neo-tree-popup",
                                "notify",
                            },
                            buftype = { "terminal", "quickfix" },
                        },
                    },
                })
            end,
        },
    },
    cmd = "Neotree",
    opts = _Opts,
    keys = require("keymaps.nav").neo_tree,
}
