local fn = vim.fn
local install_path = "~/.local/share/nvim/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    Packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
--vim.cmd([[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerSync
--  augroup end
--]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return require("packer").startup(function(use)
    -- Essential
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")

    -- Explorer
    use({
        "kyazdani42/nvim-tree.lua",
    })

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- HARPOON
    use("theprimeagen/harpoon");

    use("preservim/nerdtree");

    -- LSP
    use('tomlion/vim-solidity');
    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required

        }
    })

    -- Formatters and Linters
    use('jose-elias-alvarez/null-ls.nvim');

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter")

    -- Lualine
    use("nvim-lualine/lualine.nvim")

    -- Git
    use("lewis6991/gitsigns.nvim")
    use("tpope/vim-fugitive")
    use("ThePrimeagen/git-worktree.nvim")

    -- Theme
    use("EdenEast/nightfox.nvim")
    use("kyazdani42/nvim-web-devicons")

    -- Zoom buffers
    use("szw/vim-maximizer")

    -- Markdown preview
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = {
                "markdown" }
        end,
        ft = { "markdown" },
    })

    if Packer_bootstrap then
        require("packer").sync()
    end
end)
