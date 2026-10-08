local theme = "rounded"

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        local config = require("config.lualine." .. theme).setup()
        require("lualine").setup(config)
    end,
}
