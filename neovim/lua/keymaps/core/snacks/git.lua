-- snacks.picker: git
return {
    {
        "<leader>gi",
        function()
            require("snacks.picker").gh_issue()
        end,
        desc = "GitHub Issues (open)",
    },
    {
        "<leader>gI",
        function()
            require("snacks.picker").gh_issue({ state = "all" })
        end,
        desc = "GitHub Issues (all)",
    },
    {
        "<leader>gp",
        function()
            require("snacks.picker").gh_pr()
        end,
        desc = "GitHub Pull Requests (open)",
    },
    {
        "<leader>gP",
        function()
            require("snacks.picker").gh_pr({ state = "all" })
        end,
        desc = "GitHub Pull Requests (all)",
    },
    {
        "<leader>gb",
        function()
            require("snacks.picker").git_branches()
        end,
        desc = "Git Branches",
    },
    {
        "<leader>gl",
        function()
            require("snacks.picker").git_log()
        end,
        desc = "Git Log",
    },
    {
        "<leader>gL",
        function()
            require("snacks.picker").git_log_line()
        end,
        desc = "Git Log Line",
    },
    {
        "<leader>gs",
        function()
            require("snacks.picker").git_status()
        end,
        desc = "Git Status",
    },
    {
        "<leader>gS",
        function()
            require("snacks.picker").git_stash()
        end,
        desc = "Git Stash",
    },
    {
        "<leader>gd",
        function()
            require("snacks.picker").git_diff()
        end,
        desc = "Git Diff (Hunks)",
    },
    {
        "<leader>gf",
        function()
            require("snacks.picker").git_log_file()
        end,
        desc = "Git Log File",
    },
    {
        "<leader>lg",
        function()
            require("snacks").lazygit()
        end,
        desc = "Lazygit",
    },
}
