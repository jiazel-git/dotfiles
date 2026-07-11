local M = {}

-- neo-tree keymaps
M.neo_tree = {
    { "<leader>e", "<Cmd>Neotree reveal<CR>", desc = "File Explorer" },
}

-- navic keymaps (if needed)
M.navic = {}

-- symbols-outline keymaps
M.symbols_outline = {
    {
        "<leader>cS",
        function()
            require("symbols-outline").toggle_outline()
        end,
        desc = "Symbols Outline",
    },
}

return M
