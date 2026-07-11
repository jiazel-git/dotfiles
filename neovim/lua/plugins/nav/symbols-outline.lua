local _Opts = {}

_Opts.position = "right"

return {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    opts = _Opts,
    keys = require("keymaps.nav").symbols_outline,
}
