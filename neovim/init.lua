require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.highlight")
require("core.lazy")

local colorscheme = require("utils.colorscheme")
vim.cmd.colorscheme(colorscheme.Tokyonight)
