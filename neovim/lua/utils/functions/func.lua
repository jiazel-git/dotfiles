local Funcs = {}

function Funcs.switch_source_header()
    local current = vim.api.nvim_buf_get_name(0)
    local target

    if not current or current == "" then
        return
    end

    if current:match("%.h$") then
        target = current:gsub("%.h$", ".cpp")
    elseif current:match("%.cpp$") then
        target = current:gsub("%.cpp$", ".h")
    else
        return
    end

    local target_abspath = vim.fn.resolve(vim.fn.fnamemodify(target, ":p"))

    local found_buf = nil
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local buf_name = vim.api.nvim_buf_get_name(buf)
        if buf_name ~= "" then
            local buf_abspath =
                vim.fn.resolve(vim.fn.fnamemodify(buf_name, ":p"))
            if buf_abspath == target_abspath then
                found_buf = buf
                break
            end
        end
    end

    if found_buf then
        vim.api.nvim_command("buffer " .. found_buf)
    elseif vim.fn.filereadable(target) == 1 then
        vim.api.nvim_command("edit " .. target)
        vim.api.nvim_exec_autocmds("BufEnter", { buffer = 0 })
    else
        return
    end
end

return Funcs
