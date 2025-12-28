return {
    -- snacks
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            animate = {
                duration = 20,
                easing = "linear",
                fps = 120,
            },
            bigfile = { enabled = true },
            dashboard = {
                enabled = true,
                preset = {
                    header = [[ 
            ⢀⣴⡾⠃⠄⠄⠄⠄⠄⠈⠺⠟⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣶⣤⡀  
          ⢀⣴⣿⡿⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⣿⣿⣿⣿⣿⣷ 
         ⣴⣿⡿⡟⡼⢹⣷⢲⡶⣖⣾⣶⢄⠄⠄⠄⠄⠄⢀⣼⣿⢿⣿⣿⣿⣿⣿⣿⣿ 
        ⣾⣿⡟⣾⡸⢠⡿⢳⡿⠍⣼⣿⢏⣿⣷⢄⡀⠄⢠⣾⢻⣿⣸⣿⣿⣿⣿⣿⣿⣿ 
      ⣡⣿⣿⡟⡼⡁⠁⣰⠂⡾⠉⢨⣿⠃⣿⡿⠍⣾⣟⢤⣿⢇⣿⢇⣿⣿⢿⣿⣿⣿⣿⣿ 
     ⣱⣿⣿⡟⡐⣰⣧⡷⣿⣴⣧⣤⣼⣯⢸⡿⠁⣰⠟⢀⣼⠏⣲⠏⢸⣿⡟⣿⣿⣿⣿⣿⣿ 
     ⣿⣿⡟⠁⠄⠟⣁⠄⢡⣿⣿⣿⣿⣿⣿⣦⣼⢟⢀⡼⠃⡹⠃⡀⢸⡿⢸⣿⣿⣿⣿⣿⡟ 
     ⣿⣿⠃⠄⢀⣾⠋⠓⢰⣿⣿⣿⣿⣿⣿⠿⣿⣿⣾⣅⢔⣕⡇⡇⡼⢁⣿⣿⣿⣿⣿⣿⢣ 
     ⣿⡟⠄⠄⣾⣇⠷⣢⣿⣿⣿⣿⣿⣿⣿⣭⣀⡈⠙⢿⣿⣿⡇⡧⢁⣾⣿⣿⣿⣿⣿⢏⣾ 
     ⣿⡇⠄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢻⠇⠄⠄⢿⣿⡇⢡⣾⣿⣿⣿⣿⣿⣏⣼⣿ 
     ⣿⣷⢰⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢰⣧⣀⡄⢀⠘⡿⣰⣿⣿⣿⣿⣿⣿⠟⣼⣿⣿ 
     ⢹⣿⢸⣿⣿⠟⠻⢿⣿⣿⣿⣿⣿⣿⣿⣶⣭⣉⣤⣿⢈⣼⣿⣿⣿⣿⣿⣿⠏⣾⣹⣿⣿ 
     ⢸⠇⡜⣿⡟⠄⠄⠄⠈⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣻⣿⣿⣿⣿⣿⠟⠁⢳⠃⣿⣿⣿ 
      ⣰⡗⠹⣿⣄⠄⠄⠄⢀⣿⣿⣿⣿⣿⣿⠟⣅⣥⣿⣿⣿⣿⠿⠋  ⣾⡌⢠⣿⡿⠃ 
     ⠜⠋⢠⣷⢻⣿⣿⣶⣾⣿⣿⣿⣿⠿⣛⣥⣾⣿⠿⠟⠛⠉            
    ]],
                },
            },
            explorer = { enabled = false },
            indent = {
                enabled = true,
                chunk = {
                    enabled = true,
                },
            },
            input = { enabled = true },
            picker = {
                enabled = true,
                icons = {
                    diagnostics = require("utils.icons.icons").diagnostics_by_name,
                },
            },
            notifier = { enabled = true, style = "fancy", date_format = "%c" },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
        keys = {
            -- find
            {
                "<leader>fb",
                function()
                    require("snacks.picker").buffers()
                end,
                desc = "Buffers",
            },
            {
                "<leader>fc",
                function()
                    local opts = {
                        cwd = {
                            vim.fn.stdpath("config"),
                        },
                    }
                    require("snacks.picker").files(opts)
                end,
                desc = "Find Config File",
            },
            {
                "<leader>ff",
                function()
                    require("snacks.picker").files()
                end,
                desc = "Find Files",
            },
            {
                "<leader>fg",
                function()
                    require("snacks.picker").git_files()
                end,
                desc = "Find Git Files",
            },
            {
                "<leader>fp",
                function()
                    local opts = {
                        dev = {
                            "~/workspace",
                        },
                        recent = false,
                    }

                    require("snacks.picker").projects(opts)
                end,
                desc = "Projects",
            },
            {
                "<leader>fr",
                function()
                    require("snacks.picker").recent()
                end,
                desc = "Recent",
            },
            -- grep
            {
                "<leader>sB",
                function()
                    require("snacks.picker").grep_buffers()
                end,
                desc = "Grep Open Buffers",
            },
            {
                "<leader>sb",
                function()
                    require("snacks.picker").lines()
                end,
                desc = "Buffer Lines",
            },
            {
                "<leader>sg",
                function()
                    require("snacks.picker").grep()
                end,
                desc = "Grep",
            },
            -- search
            {
                "<leader>sd",
                function()
                    require("snacks.picker").diagnostics()
                end,
                desc = "Diagnostics",
            },
            {
                "<leader>sD",
                function()
                    require("snacks.picker").diagnostics_buffer()
                end,
                desc = "Buffer Diagnostics",
            },
            {
                "<leader>sH",
                function()
                    require("snacks.picker").highlights({
                        pattern = "hl_group:^Snacks",
                    })
                end,
                desc = "Group HighLight",
            },
            {
                "<leader>si",
                function()
                    require("snacks.picker").icons()
                end,
                desc = "Icons",
            },
            {
                "<leader>sj",
                function()
                    require("snacks.picker").jumps()
                end,
                desc = "Jumps",
            },
            {
                "<leader>sk",
                function()
                    require("snacks.picker").keymaps()
                end,
                desc = "Keymaps",
            },
            {
                "<leader>sl",
                function()
                    require("snacks.picker").loclist()
                end,
                desc = "Location List",
            },
            {
                "<leader>sm",
                function()
                    require("snacks.picker").marks()
                end,
                desc = "Marks",
            },
            {
                "<leader>sM",
                function()
                    require("snacks.picker").man()
                end,
                desc = "Man Pages",
            },
            {
                "<leader>sp",
                function()
                    require("snacks.picker").lazy()
                end,
                desc = "Search for Plugin Spec",
            },
            {
                "<leader>sq",
                function()
                    require("snacks.picker").qflist()
                end,
                desc = "Quickfix List",
            },
            {
                "<leader>sR",
                function()
                    require("snacks.picker").resume()
                end,
                desc = "Resume",
            },
            {
                "<leader>su",
                function()
                    require("snacks.picker").undo()
                end,
                desc = "Undo History",
            },
            {
                "<leader>uC",
                function()
                    require("snacks.picker").colorschemes()
                end,
                desc = "Colorschemes",
            },
            -- lsp
            {
                "gd",
                function()
                    require("snacks.picker").lsp_definitions()
                end,
                desc = "Goto Definition",
            },
            {
                "gD",
                function()
                    require("snacks.picker").lsp_declarations()
                end,
                desc = "Goto Declaration",
            },
            {
                "gr",
                function()
                    require("snacks.picker").lsp_references()
                end,
                nowait = true,
                desc = "References",
            },
            {
                "gI",
                function()
                    require("snacks.picker").lsp_implementations()
                end,
                desc = "Goto Implementation",
            },
            {
                "gy",
                function()
                    require("snacks.picker").lsp_type_definitions()
                end,
                desc = "Goto T[y]pe Definition",
            },
            {
                "gai",
                function()
                    require("snacks.picker").lsp_incoming_calls()
                end,
                desc = "C[a]lls Incoming",
            },
            {
                "gao",
                function()
                    require("snacks.picker").lsp_outgoing_calls()
                end,
                desc = "C[a]lls Outgoing",
            },
            {
                "<leader>ss",
                function()
                    require("snacks.picker").lsp_symbols()
                end,
                desc = "LSP Symbols",
            },
            {
                "<leader>sS",
                function()
                    require("snacks.picker").lsp_workspace_symbols()
                end,
                desc = "LSP Workspace Symbols",
            },
        },
    },
}
