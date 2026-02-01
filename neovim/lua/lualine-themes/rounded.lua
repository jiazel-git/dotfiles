-- Minimal clean style with rounded separators
local M = {}

function M.setup()
    local colors = require("lualine-themes.palette").get()
    local icons = require("utils.icons")

    local function mode_name()
        local modes = {
            n = "NORMAL",
            i = "INSERT",
            v = "VISUAL",
            ["\22"] = "V-BLOCK",
            V = "V-LINE",
            c = "COMMAND",
            R = "REPLACE",
            t = "TERMINAL",
            s = "SELECT",
            S = "S-LINE",
        }
        return modes[vim.fn.mode()] or vim.fn.mode()
    end

    return {
        options = {
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            theme = {
                normal = {
                    a = { fg = colors.BASE, bg = colors.BLUE, gui = "bold" },
                    b = { fg = colors.TEXT, bg = colors.SURFACE1 },
                    c = { fg = colors.TEXT, bg = colors.SURFACE0 },
                },
                insert = {
                    a = { fg = colors.BASE, bg = colors.GREEN, gui = "bold" },
                    b = { fg = colors.TEXT, bg = colors.SURFACE1 },
                    c = { fg = colors.TEXT, bg = colors.SURFACE0 },
                },
                visual = {
                    a = { fg = colors.BASE, bg = colors.VIOLET, gui = "bold" },
                    b = { fg = colors.TEXT, bg = colors.SURFACE1 },
                    c = { fg = colors.TEXT, bg = colors.SURFACE0 },
                },
                replace = {
                    a = { fg = colors.BASE, bg = colors.RED, gui = "bold" },
                    b = { fg = colors.TEXT, bg = colors.SURFACE1 },
                    c = { fg = colors.TEXT, bg = colors.SURFACE0 },
                },
                command = {
                    a = { fg = colors.BASE, bg = colors.ORANGE, gui = "bold" },
                    b = { fg = colors.TEXT, bg = colors.SURFACE1 },
                    c = { fg = colors.TEXT, bg = colors.SURFACE0 },
                },
                inactive = {
                    a = { fg = colors.OVERLAY0, bg = colors.SURFACE0 },
                    b = { fg = colors.OVERLAY0, bg = colors.SURFACE0 },
                    c = { fg = colors.OVERLAY0, bg = colors.SURFACE0 },
                },
            },
            disabled_filetypes = {
                statusline = { "neo-tree", "dashboard", "alpha" },
            },
        },
        sections = {
            lualine_a = { { mode_name } },
            lualine_b = {
                { "branch", icon = "" },
                {
                    "diff",
                    source = function()
                        local gitsigns = vim.b.gitsigns_status_dict
                        if gitsigns then
                            return {
                                added = gitsigns.added,
                                modified = gitsigns.changed,
                                removed = gitsigns.removed,
                            }
                        end
                    end,
                    symbols = { added = "+", modified = "~", removed = "-" },
                    diff_color = {
                        added = { fg = colors.GREEN },
                        modified = { fg = colors.YELLOW },
                        removed = { fg = colors.RED },
                    },
                },
            },
            lualine_c = {
                {
                    function()
                        return ""
                    end,
                    color = { fg = colors.LAVENDER },
                    padding = { left = 0, right = 0 },
                },
                {
                    "filename",
                    file_status = true,
                    path = 0,
                    symbols = { modified = " ●", readonly = " " },
                    color = {
                        fg = colors.BASE,
                        bg = colors.LAVENDER,
                        gui = "bold",
                    },
                    padding = { left = 1, right = 1 },
                },
                {
                    function()
                        return ""
                    end,
                    color = { fg = colors.LAVENDER },
                    padding = { left = 0, right = 1 },
                },
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                    symbols = {
                        error = icons.diagnostics_by_name.Error .. " ",
                        warn = icons.diagnostics_by_name.Warn .. " ",
                        info = icons.diagnostics_by_name.Info .. " ",
                        hint = icons.diagnostics_by_name.Hint .. " ",
                    },
                    diagnostics_color = {
                        error = { fg = colors.RED },
                        warn = { fg = colors.YELLOW },
                        info = { fg = colors.SKY },
                        hint = { fg = colors.CYAN },
                    },
                },
                {
                    "searchcount",
                    icon = "",
                    color = { fg = colors.GREEN, gui = "bold" },
                },
            },
            lualine_x = {
                {
                    function()
                        local clients = vim.lsp.get_clients({ bufnr = 0 })
                        if #clients == 0 then
                            return ""
                        end
                        local names = {}
                        for _, c in ipairs(clients) do
                            table.insert(names, c.name)
                        end
                        return "  " .. table.concat(names, " ")
                    end,
                    color = { fg = colors.SKY },
                },
                { "encoding" },
                {
                    "fileformat",
                    symbols = { unix = "", dos = "", mac = "" },
                },
            },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
    }
end

return M
