local _Opts = {}

-- TODO:
-- FIX:
-- INFO:
-- WARN:
-- HACK:
-- PERF:
-- NOTE:
-- TEST:

return {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = _Opts,
    keys = require("keymaps.editor").todo,
}
