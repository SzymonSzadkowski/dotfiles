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

        hl.TelescopeResultsDiffChange = {
            fg = colors.blue
        }

        hl.TelescopeResultsDiffAdd = {
            fg = colors.green1
        }

        hl.TelescopeResultsDiffDelete = {
            fg = colors.red
        }

        hl.GitsignsChangeNr = { fg = colors.blue }
        hl.GitsignsAddNr = { fg = colors.green1 }
        hl.GitsignsDeleteNr = { fg = colors.red }
        hl.StatusLine = { fg = colors.fg_sidebar }
    end
})

vim.cmd [[colorscheme tokyonight-night]]
