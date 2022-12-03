vim.o.termguicolors = true

local nightfox_status_ok, nightfox = pcall(require, "nightfox")
if not nightfox_status_ok then
	return
end

nightfox.setup({
	options = {
		transparent = true,
	},
})

vim.cmd([[
  try 
	  colorscheme nightfox
	catch
	  colorscheme default
		set background=dark
	endtry
]])
