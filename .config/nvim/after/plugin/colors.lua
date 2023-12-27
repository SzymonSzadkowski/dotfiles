function Color(color)
    color = color or "rose-pine";
    vim.cmd.colorscheme(color);

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" });
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" });
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" });
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" });
    vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "none", fg = '#65b1cd' });
    vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "none", fg = '#ebbcba' });
    vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "none", fg = '#eb6f92' });
end

Color()
