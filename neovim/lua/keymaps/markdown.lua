local _M = {}

_M.PreviewMarkdown = {}
_M.RenderMarkdown = {
    {
        "<leader>rm",
        function()
            require("render-markdown").enable()
        end,
        desc = "render-markdown",
    },
}

return _M
