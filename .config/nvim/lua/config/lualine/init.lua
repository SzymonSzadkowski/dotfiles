local lualine_status_ok, lualine = pcall(require, "lualine")

if not lualine_status_ok then
	return
end

local nightly_status_ok, nightly = pcall(require, "lualine.themes.nightfly")
if not nightly_status_ok then
	return
end

nightly.normal.a.bg = "#7DCFFF"
nightly.normal.b.bg = "transparent"
nightly.normal.c.bg = "transparent"

nightly.inactive.a.bg = "#7DCFFF"
nightly.inactive.b.bg = "transparent"
nightly.inactive.c.bg = "transparent"

lualine.setup({
	options = {
		icons_enabled = true,
		theme = nightly,
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
