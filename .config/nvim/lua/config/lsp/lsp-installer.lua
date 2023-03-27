local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {
	on_attach = require("config.lsp.handlers").on_attach,
	capabilities = require("config.lsp.handlers").capabilities,
}

mason_lspconfig.setup_handlers({
	function(server_name) -- Default handler (optional)
		lspconfig[server_name].setup({
			on_attach = opts.on_attach,
			capabilities = opts.capabilities,
		})
	end,
	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			on_attach = opts.on_attach,
			capabilities = opts.capabilities,
			settings = require("config.lsp.settings.lua_ls"),
		})
	end,
})

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- mason_lspconfig.setup_handlers(function(server)
-- 	local opts = {
-- 		on_attach = require("config.lsp.handlers").on_attach,
-- 		capabilities = require("config.lsp.handlers").capabilities,
-- 	}

--if server.name == "jsonls" then
--	local jsonls_opts = require("config.lsp.settings.jsonls")
--	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
--end

--if server.name == "sumneko_lua" then
--	local sumneko_opts = require("config.lsp.settings.sumneko_lua")
--	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
--end

-- This setup() function is exactly the same as lspconfig's setup function.
-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--	server:setup(opts)
--end)
