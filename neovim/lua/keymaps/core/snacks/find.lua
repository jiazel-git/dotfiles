-- snacks.picker: find
return {
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
            require("snacks.picker").files({
                cwd = vim.fn.stdpath("config"),
            })
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
            require("snacks.picker").projects({
                dev = { "~/workspace" },
                recent = false,
            })
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
}
