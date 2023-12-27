-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
        -- Packer can manage itself
        use('wbthomason/packer.nvim')
        use "nvim-lua/plenary.nvim"

        -- Telescope
        use({
                'nvim-telescope/telescope.nvim',
                tag = '0.1.5',
                requires = { { 'nvim-lua/plenary.nvim' } }
        })
        use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

        -- Colorscheme
        use({ 'rose-pine/neovim', as = 'rose-pine' })

        -- Treesitter
        use({ 'nvim-treesitter/nvim-treesitter' })
        use {
                "ThePrimeagen/harpoon",
                branch = "harpoon2",
                requires = { { "nvim-lua/plenary.nvim" } }
        }

        use("kyazdani42/nvim-tree.lua")
        use 'mbbill/undotree'
        use 'lewis6991/gitsigns.nvim'
        use 'tpope/vim-fugitive'
        use "iamcco/markdown-preview.nvim"

        use {
                'VonHeikemen/lsp-zero.nvim',
                branch = 'v3.x',
                requires = {
                        --- Uncomment these if you want to manage LSP servers from neovim
                        { 'williamboman/mason.nvim' },
                        { 'williamboman/mason-lspconfig.nvim' },

                        -- LSP Support
                        { 'neovim/nvim-lspconfig' },
                        -- Autocompletion
                        { 'hrsh7th/nvim-cmp' },
                        { 'hrsh7th/cmp-nvim-lsp' },
                        { 'L3MON4D3/LuaSnip' },
                }
        }
end)
