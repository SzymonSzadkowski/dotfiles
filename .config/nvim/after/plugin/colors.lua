require("tokyonight").setup({
    style = "night",
    ---@param hl Highlights
    ---@param colors ColorScheme
    on_highlights = function(hl, colors)
        hl.TelescopePromptBorder = {
            fg = colors.fg
        }

        hl.TelescopePromptTitle = {
            fg = colors.fg
        }

        hl.TelescopeBorder = {
            fg = colors.dark3
        }

        hl.GitsignsChangeNr = { fg = colors.blue }
        hl.StatusLine = { fg = colors.fg_sidebar }
    end
})

vim.cmd [[colorscheme tokyonight-night]]
