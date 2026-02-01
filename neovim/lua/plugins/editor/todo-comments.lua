return {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- TODO:
    -- FIX:
    -- INFO:
    -- WARN:
    -- HACK:
    -- PERF:
    -- NOTE:
    -- TEST:
    opts = {},
    keys = require("keymaps.editor").todo,
}
