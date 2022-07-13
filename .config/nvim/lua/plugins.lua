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
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

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

	-- Autocompletion
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- Buffer completions
	use("hrsh7th/cmp-path") -- Path completions
	use("hrsh7th/cmp-cmdline") -- Cmdline completions
	use("hrsh7th/cmp-nvim-lsp") -- Vim configuration completions
	use("hrsh7th/cmp-nvim-lua") -- Lua vim completions
	use("saadparwaiz1/cmp_luasnip") -- Snippet completions

	-- LSP
	use("neovim/nvim-lspconfig") -- Main LSP plugin
	use("williamboman/nvim-lsp-installer") -- Simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- Language server settings defined in json
	use("jose-elias-alvarez/null-ls.nvim") -- Formatters and linters
	use("tomlion/vim-solidity") -- Solidity highlights

	-- Snippets
	use("L3MON4D3/LuaSnip") --Snippet engine
	use("rafamadriz/friendly-snippets") -- Snippets examples

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter")

	-- Lualine
	use("nvim-lualine/lualine.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")

	-- Theme
	use("bluz71/vim-nightfly-guicolors")
	use("kyazdani42/nvim-web-devicons")

	-- Zoom buffers
	use("szw/vim-maximizer")
	if Packer_bootstrap then
		require("packer").sync()
	end
end)
