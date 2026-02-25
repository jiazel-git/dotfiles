local _Opts = {}

_Opts.prompt = {
    enabled = false,
}

return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = _Opts,
    keys = require("keymaps.editor").flash,
}
