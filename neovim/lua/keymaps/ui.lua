local M = {}

-- noice.nvim
M.noice = {
    {
        "<leader>sN",
        function()
            require("noice").cmd("pick")
        end,
        desc = "[Noice] pick history messages",
    },
    {
        "<leader>N",
        function()
            require("noice").cmd("history")
        end,
        desc = "[Noice] Show history messages",
    },
}

-- which-key.nvim
M.whichkey = {
    {
        "?",
        function()
            require("which-key").show()
        end,
        desc = "Show all Keymaps",
    },
}

return M
