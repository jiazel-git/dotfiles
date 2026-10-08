-- snacks.picker: search
return {
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
            require("snacks.picker").highlights({ pattern = "hl_group:^Snacks" })
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
}
