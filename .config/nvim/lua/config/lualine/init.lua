local lualine_status_ok, lualine = pcall(require, "lualine")

if not lualine_status_ok then
	return
end

local nightfly_status_ok, nightfly = pcall(require, "lualine.themes.nightfly")
if not nightfly_status_ok then
	return
end

nightfly.normal.c.bg = "default"

lualine.setup({
	options = {
		icons_enabled = true,
		theme = nightfly,
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { { "branch", icon = "" } },
		lualine_b = { "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = { "filetype" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = { "mode" },
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "nvim-tree", "fugitive" },
})
