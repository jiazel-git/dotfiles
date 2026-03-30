local functions = require("utils.functions")
return {
    capabilities = {
        offsetEncoding = { "utf-8", "utf-16" },
    },
    cmd = {
        "clangd",
        "--clang-tidy",
        "--background-index",
        "--header-insertion=iwyu",
    },
    on_attach = function(client, bufnr)
        -- 创建在头文件和源文件之间切换的命令
        vim.api.nvim_buf_create_user_command(
            bufnr,
            "LspClangdSwitchSourceHeader",
            function()
                functions.switch_source_header(bufnr, client)
            end,
            { desc = "Switch between source/header" }
        )
    end,
}
