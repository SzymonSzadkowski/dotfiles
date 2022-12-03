local status_ok, _ = pcall(require, "mason")
if not status_ok then
	return
end

require("mason").setup()
require("mason-lspconfig").setup()
require("config.lsp.lsp-installer")
require("config.lsp.handlers").setup()
require("config.lsp.null-ls")
