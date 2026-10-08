-- todo-comments.nvim (plugins/editor/todo-comments.lua)
return {
    {
        "]t",
        function()
            require("todo-comments").jump_next()
        end,
        desc = "Next Todo",
    },
    {
        "[t",
        function()
            require("todo-comments").jump_prev()
        end,
        desc = "Prev Todo",
    },
}
