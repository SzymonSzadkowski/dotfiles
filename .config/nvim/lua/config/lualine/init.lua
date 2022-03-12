local lualine_status_ok, lualine = pcall(require, "lualine")

if not lualine_status_ok then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "nightfly",
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {},
		lualine_b = { "branch", "diff", "diagnostics" },
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
