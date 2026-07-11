-- Telescope Configuration (Backup)
-- NOTE: This plugin is kept as a backup. Currently using snacks.picker as the primary picker.
-- To enable Telescope, uncomment the return statement below and comment out snacks.pvim's picker.

return {}

-- Uncomment below to enable Telescope:
--[[
return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    },
    opts = {},
}
]]
