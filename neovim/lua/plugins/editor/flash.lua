return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        prompt = {
            enabled = false,
        },
    },
    keys = require("keymaps.editor").flash,
}
