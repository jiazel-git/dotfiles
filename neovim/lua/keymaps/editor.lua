local M = {}

-- flash.nvim
M.flash = {
    {
        "s",
        mode = { "n", "x", "o" },
        function()
            require("flash").jump()
        end,
        desc = "Flash",
    },
    {
        "S",
        mode = { "n", "x", "o" },
        function()
            require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
    },
    {
        "r",
        mode = { "x", "o" },
        function()
            require("flash").remote()
        end,
        desc = "Remote Flash",
    },
    {
        "R",
        mode = { "x", "o" },
        function()
            require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
    },
    {
        "<c-s>",
        mode = { "c" },
        function()
            require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
    },
}

-- todo-comments.nvim
M.todo = {
    {
        "]t",
        function()
            require("todo-comments").jump_next()
        end,
        desc = "Next Todo",
    },
    {
        "[t",
        function()
            require("todo-comments").jump_prev()
        end,
        desc = "Prev Todo",
    },
}

return M
