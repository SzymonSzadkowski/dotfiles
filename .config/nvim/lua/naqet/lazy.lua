local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'nvim-lua/plenary.nvim',

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.5',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim',     build = 'make' },
            { "nvim-telescope/telescope-live-grep-args.nvim", version = "^1.0.0", }
        }
    },
    {},

    -- Colorscheme
    "folke/tokyonight.nvim",

    -- Treesitter
    'nvim-treesitter/nvim-treesitter',

    -- Git
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',

    -- LSP
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- loading status on right bottom
    'j-hui/fidget.nvim',

    -- Autocomplete
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    { 'saadparwaiz1/cmp_luasnip', dependencies = { 'L3MON4D3/LuaSnip', version = "v2.*", build = "make install_jsregexp" } },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- Utils
    'mbbill/undotree',
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
})
