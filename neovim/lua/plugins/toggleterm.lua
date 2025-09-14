return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        size = 13,
        open_mapping = [[<C-\\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = -15,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = "curved",
            winblend = 0,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
    },
    keys = {
        { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
        {
            "<leader>tf",
            "<cmd>ToggleTerm direction=float<cr>",
            desc = "Float Terminal",
        },
        {
            "<leader>th",
            "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
            desc = "Horizontal Terminal",
        },
        {
            "<leader>tv",
            "<cmd>ToggleTerm size=80 direction=vertical<cr>",
            desc = "Vertical Terminal",
        },
    },
}
