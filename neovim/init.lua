require("config.options")
require("config.keymapping")
require("config.lazy")
require("config.autocmd")
require("config.highlight")

local colorscheme = require("utils.colorscheme")
vim.cmd.colorscheme(colorscheme.Tokyonight)
