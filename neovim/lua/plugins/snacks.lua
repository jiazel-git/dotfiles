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
            },
            notifier = { enabled = true, style = "fancy", date_format = "%c" },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
        keys = {
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
            {
                "<leader>hl",
                function()
                    require("snacks.picker").highlights({
                        pattern = "hl_group:^Snacks",
                    })
                end,
                desc = "Group HighLight",
            },
        },
    },
}
