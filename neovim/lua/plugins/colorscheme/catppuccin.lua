return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            transparent_background = true,
            float = {
                transparent = true, -- enable transparent floating windows
                solid = true, -- use solid styling for floating windows, see |winborder|
            },
            integrations = {
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
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
