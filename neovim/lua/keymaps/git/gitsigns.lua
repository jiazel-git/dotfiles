-- gitsigns.nvim (plugins/git/gitsigns.lua)
return {
    {
        "]h",
        function()
            require("gitsigns").nav_hunk("next")
        end,
        desc = "Next hunk",
    },
    {
        "[h",
        function()
            require("gitsigns").nav_hunk("prev")
        end,
        desc = "Prev hunk",
    },
    {
        "]H",
        function()
            require("gitsigns").nav_hunk("last")
        end,
        desc = "Last hunk",
    },
    {
        "[H",
        function()
            require("gitsigns").nav_hunk("first")
        end,
        desc = "First hunk",
    },
    {
        "<leader>ghs",
        ":Gitsigns stage_hunk<CR>",
        desc = "Stage hunk",
        mode = { "n", "v" },
    },
    {
        "<leader>ghr",
        ":Gitsigns reset_hunk<CR>",
        desc = "Reset hunk",
        mode = { "n", "v" },
    },
    {
        "<leader>ghS",
        function()
            require("gitsigns").stage_buffer()
        end,
        desc = "Stage buffer",
    },
    {
        "<leader>ghu",
        function()
            require("gitsigns").undo_stage_hunk()
        end,
        desc = "Undo stage hunk",
    },
    {
        "<leader>ghR",
        function()
            require("gitsigns").reset_buffer()
        end,
        desc = "Reset buffer",
    },
    {
        "<leader>ghp",
        function()
            require("gitsigns").preview_hunk_inline()
        end,
        desc = "Preview hunk inline",
    },
    {
        "<leader>ghP",
        function()
            require("gitsigns").preview_hunk()
        end,
        desc = "Preview hunk",
    },
    {
        "<leader>ghb",
        function()
            require("gitsigns").blame_line({ full = true })
        end,
        desc = "Blame line",
    },
    {
        "<leader>ghB",
        function()
            require("gitsigns").blame()
        end,
        desc = "Blame buffer",
    },
    {
        "<leader>ghd",
        function()
            require("gitsigns").diffthis()
        end,
        desc = "Diff this",
    },
    {
        "<leader>ghD",
        function()
            require("gitsigns").diffthis("~")
        end,
        desc = "Diff this ~",
    },
    {
        "ih",
        ":<C-U>Gitsigns select_hunk<CR>",
        desc = "Select hunk",
        mode = { "o", "x" },
    },
}
