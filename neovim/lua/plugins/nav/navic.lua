local _Opts = {}

_Opts.highlight = true

_Opts.lsp = {
    auto_attach = true,
    preference = {
        "clangd",
        "gopls",
        "pyright",
        "lua_ls",
        "tsserver",
        "rust_analyzer",
    },
}

return {
    "SmiteshP/nvim-navic",
    event = "LspAttach",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = _Opts,
    init = function()
        vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end,
}
