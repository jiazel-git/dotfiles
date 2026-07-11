local M = {}

-- gitsigns.nvim keymaps
M.gitsigns = {
    {
        "]h",
        function()
            require("gitsigns").nav_hunk("next")
        end,
        desc = "next hunk",
    },
    {
        "[h",
        function()
            require("gitsigns").nav_hunk("prev")
        end,
        desc = "prev hunk",
    },
    {
        "]H",
        function()
            require("gitsigns").nav_hunk("last")
        end,
        desc = "last hunk",
    },
    {
        "[H",
        function()
            require("gitsigns").nav_hunk("first")
        end,
        desc = "first hunk",
    },
    {
        "<leader>ghs",
        ":Gitsigns stage_hunk<CR>",
        desc = "stage hunk",
        mode = { "n", "v" },
    },
    {
        "<leader>ghr",
        ":Gitsigns reset_hunk<CR>",
        desc = "reset hunk",
        mode = { "n", "v" },
    },
    {
        "<leader>ghS",
        function()
            require("gitsigns").stage_buffer()
        end,
        desc = "stage buffer",
    },
    {
        "<leader>ghu",
        function()
            require("gitsigns").undo_stage_hunk()
        end,
        desc = "undo stage hunk",
    },
    {
        "<leader>ghR",
        function()
            require("gitsigns").reset_buffer()
        end,
        desc = "reset buffer",
    },
    {
        "<leader>ghp",
        function()
            require("gitsigns").preview_hunk_inline()
        end,
        desc = "preview hunk inline",
    },
    {
        "<leader>ghP",
        function()
            require("gitsigns").preview_hunk()
        end,
        desc = "preview hunk",
    },
    {
        "<leader>ghb",
        function()
            require("gitsigns").blame_line({ full = true })
        end,
        desc = "blame line",
    },
    {
        "<leader>ghB",
        function()
            require("gitsigns").blame()
        end,
        desc = "blame buffer",
    },
    {
        "<leader>ghd",
        function()
            require("gitsigns").diffthis()
        end,
        desc = "diff this",
    },
    {
        "<leader>ghD",
        function()
            require("gitsigns").diffthis("~")
        end,
        desc = "diff this ~",
    },
    {
        "ih",
        ":<C-U>Gitsigns select_hunk<CR>",
        desc = "gitsigns select hunk",
        mode = { "o", "x" },
    },
}

return M
