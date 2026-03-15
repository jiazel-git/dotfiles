local _Opts = {}

_Opts.transparent_background = true

_Opts.float = {
    transparent = true,
    solid = true,
}

_Opts.integrations = {
    gitsigns = true,
    neotree = true,
    treesitter = true,
    mini = {
        enabled = true,
        indentscope_color = "",
    },
    barbar = true,
    mason = true,
    notify = true,
    rainbow_delimiters = true,
    blink_cmp = {
        style = "bordered",
    },
    flash = true,
    markdown = true,
    noice = true,
    which_key = true,
    navic = { enabled = true, custom_bg = "" },
    snacks = {
        enabled = true,
        indentscope_color = "lavender",
    },
    telescope = {
        enabled = true,
    },
    lsp_trouble = true,
}

return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = _Opts,
    config = function(_, opts)
        require("catppuccin").setup(opts)
    end,
}
