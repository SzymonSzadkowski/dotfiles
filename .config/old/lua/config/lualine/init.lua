local lualine_status_ok, lualine = pcall(require, "lualine")

if not lualine_status_ok then
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        always_divide_middle = true,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
    },
    sections = {
        lualine_a = { { "branch", icon = "" } },
        lualine_b = { "diff", "diagnostics" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "filename" },
        lualine_z = { "searchcount" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = { "nvim-tree", "fugitive" },
})
