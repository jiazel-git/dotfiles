return {
    -- which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            status = {
                show = false,
            },
            preset = "modern",
            win = {
                no_overlap = false,
                width = 0.5,
                col = 0.5,
                row = 0.5,
                title_pos = "center",
                title = "All Keymaps",
                wo = {
                    winblend = 0,
                },
            },
            show_help = false,
            show_keys = false,
            spec = {
                { "<leader><tab>", group = "tabs" },
                { "<leader>b", group = "buffer" },
                { "<leader>c", group = "code" },
                { "<leader>d", group = "debug" },
                { "<leader>dp", group = "profiler" },
                { "<leader>f", group = "file/find" },
                { "<leader>g", group = "git" },
                { "<leader>gh", group = "hunks" },
                { "<leader>q", group = "quit/session" },
                { "<leader>s", group = "search" },
                { "<leader>t", group = "terminal" },
                {
                    "<leader>u",
                    group = "ui",
                    icon = { icon = "󰙵 ", color = "cyan" },
                },
                {
                    "<leader>x",
                    group = "diagnostics/quickfix",
                    icon = { icon = "󱖫 ", color = "green" },
                },
                { "[", group = "prev" },
                { "]", group = "next" },
                { "g", group = "goto" },
                { "gs", group = "surround" },
                { "z", group = "fold" },
            },
            expand = function(node)
                return not node.desc
            end,
        },
        keys = require("keymaps.ui").whichkey,
    },
}
