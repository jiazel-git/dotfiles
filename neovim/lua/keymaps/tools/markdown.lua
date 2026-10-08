-- render-markdown.nvim (plugins/tools/markdown.lua)
return {
    {
        "<leader>rm",
        function()
            require("render-markdown").toggle()
        end,
        desc = "Toggle Render Markdown",
    },
}
