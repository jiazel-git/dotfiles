local icons = require("config.icons")

return {
    underline = true,
    update_in_insert = false,
    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = function(diagnostic)
            return icons.diagnostics_by_severity[diagnostic.severity] or "● "
        end,
    },
    severity_sort = true,
    signs = {
        text = icons.diagnostics_by_severity,
    },
}
