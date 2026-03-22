require("config.options")
require("config.keymapping")
require("config.autocmd")
require("config.highlight")
require("config.lazy")

local colorscheme = require("utils.colorscheme")
vim.cmd.colorscheme(colorscheme.Tokyonight)
