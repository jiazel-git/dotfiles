local theme = "rounded"

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local config = require("lualine-themes." .. theme).setup()
        require("lualine").setup(config)
    end,
}
