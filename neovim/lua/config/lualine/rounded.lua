-- Tokyo Night colors, horizon-style layout with powerline separators
local M = {}

local icons = require("config.icons")

local MODE_NAMES = {
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

local LSP_SHORT_NAMES = {
    pyright = "py",
    tsserver = "ts",
    rust_analyzer = "rs",
    lua_ls = "lua",
    clangd = "clangd",
    bashls = "sh",
    jsonls = "json",
    html = "html",
    cssls = "css",
    tailwindcss = "tw",
    dockerls = "docker",
    sqlls = "sql",
    yamlls = "yml",
    cmake = "cmake",
}

local function mode_name()
    return MODE_NAMES[vim.fn.mode()] or vim.fn.mode()
end

local function cwd()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

local function has_filename()
    return vim.api.nvim_buf_get_name(0) ~= ""
end

local function lsp_name()
    local buf_ft = vim.bo.filetype
    local clients = vim.lsp.get_clients()
    if next(clients) == nil then
        return "no active lsp"
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return LSP_SHORT_NAMES[client.name] or client.name:sub(1, 2)
        end
    end
    return "no active lsp"
end

local function filetype_icon()
    local ok, devicons = pcall(require, "nvim-web-devicons")
    if not ok then
        return ""
    end
    return devicons.get_icon_by_filetype(vim.bo.filetype, { default = false }) or ""
end

local function filetype_icon_color(fallback)
    local ok, devicons = pcall(require, "nvim-web-devicons")
    if not ok then
        return { fg = fallback }
    end
    local _, hex = devicons.get_icon_color_by_filetype(vim.bo.filetype, {
        default = true,
    })
    return { fg = hex or fallback }
end

local function mode_section(colors, accent)
    return {
        a = { fg = colors.BASE, bg = accent, gui = "bold" },
        b = { fg = colors.TEXT, bg = colors.SURFACE1 },
        c = { fg = colors.TEXT, bg = colors.SURFACE0 },
    }
end

local function build_theme(colors)
    return {
        normal = mode_section(colors, colors.RED),
        insert = mode_section(colors, colors.SKY),
        visual = mode_section(colors, colors.ORANGE),
        replace = mode_section(colors, colors.MAROON),
        command = mode_section(colors, colors.GREEN),
        inactive = {
            a = { fg = colors.OVERLAY1, bg = colors.SURFACE0, gui = "bold" },
            b = { fg = colors.OVERLAY1, bg = colors.SURFACE0 },
            c = { fg = colors.OVERLAY1, bg = colors.SURFACE0 },
        },
    }
end

local function build_sections(colors)
    return {
        lualine_a = {
            { mode_name },
        },
        lualine_b = {
            { cwd, icon = icons.FOLDER_ALT },
            { "branch", icon = icons.BRANCH_ALT },
            {
                "diff",
                source = diff_source,
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
                "filename",
                file_status = true,
                path = 0,
                symbols = {
                    modified = icons.MODIFIED,
                    readonly = icons.READONLY,
                },
                cond = has_filename,
                padding = { left = 1, right = 1 },
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
                icon = icons.SEARCH,
                color = { fg = colors.GREEN, gui = "bold" },
            },
        },
        lualine_x = {
            {
                filetype_icon,
                color = function()
                    return filetype_icon_color(colors.SKY)
                end,
                separator = " ",
                padding = { left = 1, right = 0 },
            },
            {
                lsp_name,
                color = { fg = colors.SKY, gui = "" },
                padding = { left = 0, right = 1 },
            },
            { "encoding" },
            {
                "fileformat",
                symbols = {
                    unix = icons.UNIX,
                    dos = icons.DOS,
                    mac = icons.MAC,
                },
            },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    }
end

function M.setup()
    local colors = require("config.lualine.palette").get()

    return {
        options = {
            component_separators = { left = "", right = "" },
            section_separators = {
                left = icons.SEPARATORS.POWERLINE_SECTION_LEFT,
                right = icons.SEPARATORS.POWERLINE_SECTION_RIGHT,
            },
            theme = build_theme(colors),
            disabled_filetypes = {
                statusline = { "neo-tree", "dashboard", "alpha" },
            },
        },
        sections = build_sections(colors),
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
