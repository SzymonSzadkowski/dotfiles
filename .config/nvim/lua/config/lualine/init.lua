local lualine_status_ok, lualine = pcall(require, "lualine")

if not lualine_status_ok then
	return
end

local tokyonight_status_ok, tokyonight = pcall(require, "lualine.themes.tokyonight")
if not tokyonight_status_ok then
	return
end

tokyonight.normal.c.bg = "#1A1B26"
tokyonight.normal.a.bg = "#7DCFFF"

lualine.setup({
	options = {
		icons_enabled = true,
		theme = tokyonight,
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
