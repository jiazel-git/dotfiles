-- Mason options
local _MasonOpts = {}

_MasonOpts.ensure_installed = {
    "lua-language-server",
    "stylua",
    "gopls",
    "clangd",
    "cmake-language-server",
    "cmakelang",
    "cmakelint",
    "ruff",
    "json-lsp",
    "typescript-language-server",
    "rust-analyzer",
    "bash-language-server",
    "shfmt",
    "prettier",
}

_MasonOpts.ui = {
    icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
    },
}

-- LSP options
local _LspOpts = {}

_LspOpts.diagnostics = {
    underline = true,
    update_in_insert = false,
    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = function(diagnostic)
            local icons = require("utils.icons").diagnostics_by_severity
            return icons[diagnostic.severity] or "● "
        end,
    },
    severity_sort = true,
    signs = {
        text = require("utils.icons").diagnostics_by_severity,
    },
}

_LspOpts.inlay_hints = {
    enabled = true,
}

_LspOpts.servers = {
    lua_ls = require("lsp.servers.lua_ls"),
    gopls = require("lsp.servers.gopls"),
    clangd = require("lsp.servers.clangd"),
    cmake = require("lsp.servers.cmake"),
    ruff = require("lsp.servers.pyright"),
    jsonls = require("lsp.servers.jsonlsp"),
    tsserver = require("lsp.servers.tsserver"),
    rust_analyzer = require("lsp.servers.rust_analyzer"),
    bash_ls = require("lsp.servers.bashls"),
}

return {
    -- mason
    {
        "williamboman/mason.nvim",
        event = { "BufReadPre", "BufNewFile" },
        cmd = "Mason",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        opts = _MasonOpts,
        config = function(_, opts)
            require("mason").setup(opts)
            local mr = require("mason-registry")
            local function ensure_installed()
                for _, tool in ipairs(opts.ensure_installed) do
                    local p = mr.get_package(tool)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end
            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
            end
        end,
    },

    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "saghen/blink.cmp",
            { "MysticalDevil/inlay-hints.nvim", event = "LspAttach" },
        },
        opts = _LspOpts,
        config = function(_, opts)
            require("inlay-hints").setup()
            vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

            local servers = opts.servers
            local has_blink, blink = pcall(require, "blink.cmp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                has_blink and blink.get_lsp_capabilities() or {},
                opts.capabilities or {}
            )

            local function setup(server)
                local server_opts = vim.tbl_deep_extend("force", {
                    capabilities = vim.deepcopy(capabilities),
                }, servers[server] or {})
                vim.lsp.config[server] = server_opts
                vim.lsp.enable(server)
            end

            for server, _ in pairs(servers) do
                setup(server)
            end
        end,
        keys = require("keymaps.lsp").lsp,
    },
}
