local M = {}

--- 在源文件和头文件之间切换
-- 使用 LSP 的 textDocument/switchSourceHeader 方法在对应的源文件和头文件之间切换
-- @param bufnr number 缓冲区编号
-- @param client table LSP 客户端对象
function M.switch_source_header(bufnr, client)
    local method_name = "textDocument/switchSourceHeader"
    ---@diagnostic disable-next-line:param-type-mismatch
    if not client or not client:supports_method(method_name) then
        return vim.notify(
            ("method %s is not supported by any servers active on the current buffer"):format(
                method_name
            )
        )
    end
    local params = vim.lsp.util.make_text_document_params(bufnr)
    ---@diagnostic disable-next-line:param-type-mismatch
    client:request(method_name, params, function(err, result)
        if err then
            error(tostring(err))
        end
        if not result then
            vim.notify("corresponding file cannot be determined")
            return
        end
        vim.cmd.edit(vim.uri_to_fname(result))
    end, bufnr)
end

return M
