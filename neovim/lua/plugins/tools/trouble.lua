local _Opts = {}

return {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = _Opts,
    keys = require("keymaps.trouble").trouble,
}
