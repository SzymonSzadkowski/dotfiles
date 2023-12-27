vim.o.termguicolors = true

local nightfox_status_ok, nightfox = pcall(require, "nightfox")
if not nightfox_status_ok then
    return
end

local palette = require("nightfox.palette").load("carbonfox");

nightfox.setup({
    options = {
        transparent = true,
        inverse = {
            visual = false
        }
    },
    palettes = {
        carbonfox = {
            sel0 = palette.bg3
        }
    }
})

vim.cmd([[
    try
	  colorscheme duskfox
	catch
	  colorscheme default
      set background=dark
	endtry
]])
