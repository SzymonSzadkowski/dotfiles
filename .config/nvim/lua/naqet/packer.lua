-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')
    use('nvim-lua/plenary.nvim')

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })
    use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

    -- Colorscheme
    use({ 'rose-pine/neovim', as = 'rose-pine' })

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter')
    use {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('mbbill/undotree')
    use('lewis6991/gitsigns.nvim')
    use('tpope/vim-fugitive')
    use('iamcco/markdown-preview.nvim')

    -- LSP
    use('neovim/nvim-lspconfig')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')

    -- Autocomplete
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('L3MON4D3/LuaSnip')
end)
