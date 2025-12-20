-- This file is automatically loaded by plugins.core
vim.g.mapleader = " "

-- line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.smartindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

vim.opt.scrolloff = 15
vim.sidesscrolloff = 10
vim.opt.startofline = false

vim.opt.conceallevel = 2

vim.wo.wrap = false

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.winborder = "rounded"

-- 启用bufferline的event
vim.o.mousemoveevent = true

-- no swap file
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

-- 启用窗口标题
vim.o.title = true

-- 自定义标题格式：显示文件名 + nvim
vim.o.titlestring = "%t - nvim"

-- file encoding
vim.opt.fileencodings = { "euc-cn", "utf-8", "gbk", "gb2312" }
vim.opt.encoding = "utf-8"

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldlevel = 99 -- 默认展开（可按需调整）
