return {
    -- mason
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "html-lsp",
                "pyright",
                "stylua",
                "gopls",
                "prettier",
                "cmake-language-server",
                "cmakelang",
                "cmakelint",
            },
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },

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
        dependencies = {
            "saghen/blink.cmp",
            { "MysticalDevil/inlay-hints.nvim", event = "LspAttach" },
        },

        opts = {
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                    prefix = function(diagnostic)
                        local icons =
                            require("utils.icons.icons").diagnostics_by_severity
                        return icons[diagnostic.severity] or "● "
                    end,
                },
                severity_sort = true,
                signs = {
                    text = require("utils.icons.icons").diagnostics_by_severity,
                },
            },
            inlay_hints = {
                enabled = true,
            },
            servers = {
                lua_ls = require("utils.lsp_utils.lua_ls"),
                gopls = require("utils.lsp_utils.gopls"),
                clangd = require("utils.lsp_utils.clangd"),
                cmake = require("utils.lsp_utils.cmake"),
                ruff = require("utils.lsp_utils.pyright"),
                jsonls = require("utils.lsp_utils.jsonlsp"),
                tsserver = require("utils.lsp_utils.tsserver"),
                rust_analyzer = require("utils.lsp_utils.rust_analyzer"),
                bash_ls = require("utils.lsp_utils.bashls"),
            },
        },
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
        keys = {
            {
                "<leader>so",
                require("utils.functions.func").switch_source_header,
                desc = "SWitch between source/header",
            },
            {
                "<leader>sh",
                "<Cmd>ClangdShowSymbolInfo<CR>",
                desc = "Show symbol info",
            },
            {
                "<leader>ca",
                function()
                    local opts = {
                        context = {
                            only = { "quickfix" },
                        },
                    }
                    vim.lsp.buf.code_action(opts)
                end,
                desc = "Code Action",
            },
        },
    },
}
